#include <SoftwareSerial.h>
#include <Servo.h>

// --- Pines ---
/*
  --- CONEXIONES DETALLADAS ---

  1. SENSOR DE SONIDO:
     - AOUT -> A1 (Usamos la salida analógica para medir la intensidad del sonido)
     - VCC  -> 5V
     - GND  -> GND
     - DOUT -> A2 (No se usa en este código, pero lo definimos por si acaso)

  2. MÓDULO WIFI (ESP-01):
     - TX del ESP -> Pin 2 del Arduino (ESP_RX)
     - RX del ESP -> Pin 3 del Arduino (ESP_TX)
     - VCC / CH_PD -> 3.3V (¡MUY IMPORTANTE, NO 5V!)
     - GND -> GND
  
  3. BUZZER (ZUMBADOR):
     - Pin de señal (+) -> Pin 8 del Arduino
     - Pin de tierra (-) -> GND

  4. MÓDULO BLUETOOTH (HC-05/HC-06):
     - TX del Bluetooth -> Pin RX (0) del Arduino
     - RX del Bluetooth -> Pin TX (1) del Arduino
     - VCC -> 5V
     - GND -> GND
     NOTA: Al usar los pines 0 y 1, desconecta el Bluetooth cuando subas el código al Arduino.

  5. SERVOMOTORES:
     - Motor Izquierdo -> Pin 9
     - Motor Derecho -> Pin 10
     - Servo de Alerta -> Pin 5
*/

// --- PINES DE COMPONENTES ---
#define SOUND_PIN_ANALOG A1   // Salida Analógica (AOUT) del sensor de sonido
#define SOUND_PIN_DIGITAL A2  // Salida Digital (DOUT), no usada actualmente
#define BUZZER_PIN 8          // Pin de señal del Buzzer
#define ESP_RX 2              // SoftwareSerial RX, se conecta al TX del ESP-01
#define ESP_TX 3              // SoftwareSerial TX, se conecta al RX del ESP-01

// --- PINES DE SERVOS ---
#define SERVO1_PIN 9          // Motor 1 (izquierdo)
#define SERVO2_PIN 10         // Motor 2 (derecho)
#define SERVO_ALERTA_PIN 5

// --- Constantes de configuración ---
#define SOUND_THRESHOLD 300   // Sensibilidad del sensor de sonido
#define DEBOUNCE_TIME 5000    // 5 segundos de espera entre detecciones de sonido
#define PAUSA_ENTRE_MOVIMIENTOS 300 // ms

// --- Calibración de Movimiento ---
const int MS_POR_CM = 20;     // Milisegundos que tarda en avanzar 1 cm
const int MS_POR_GRADO = 6;   // Milisegundos que tarda en girar 1 grado

// --- Estados del Robot ---
enum RobotState { IDLE, EXECUTING_ROUTINE, PAUSED }; // Eliminamos el estado FINISHED
RobotState currentState = IDLE;

// --- Tipos de Movimiento ---
enum MovementType { FORWARD, TURN_RIGHT }; // Eliminamos el tipo STOP

// --- Estructura para un paso del recorrido ---
struct RoutineStep {
  MovementType type;
  int value;
};

// --- Define aquí tu recorrido autónomo en bucle ---
RoutineStep routine[] = {
  {FORWARD, 526},
  {TURN_RIGHT, 180},
  {FORWARD, 526},
  {TURN_RIGHT, 180}
};
// Calculamos cuántos pasos hay en la rutina para saber cuándo reiniciar
const int routineSize = sizeof(routine) / sizeof(routine[0]);
int currentStep = 0;
unsigned long stepStartTime = 0;

// --- Objetos ---
SoftwareSerial espSerial(ESP_RX, ESP_TX);
Servo servo_alerta;
Servo motor1;
Servo motor2;

// --- WiFi / Google Sheets ---
const String SSID = "Conectividad Cordoba";
const String PASSWORD = "";
const String SHEETS_URL = "https://script.google.com/a/macros/escuelasproa.edu.ar/s/AKfycbw-2oIqFf-IUDMCeEaB1yzGa_cDjVVj9aW-dFmeyePL8CqDSYy4YSogbp8Vz9i152L_/exec";

unsigned long lastSoundTime = 0;

// --- SETUP ---
void setup() {
  Serial.begin(115200);
  espSerial.begin(9600);

  pinMode(BUZZER_PIN, OUTPUT);
  servo_alerta.attach(SERVO_ALERTA_PIN);
  servo_alerta.write(0);

  motor1.attach(SERVO1_PIN);
  motor2.attach(SERVO2_PIN);
  
  Parada();
  
  delay(1000);
  initESP();

  Serial.println("DotBot listo. Esperando comando 'S' para iniciar el bucle...");
}

// --- LOOP PRINCIPAL ---
void loop() {
  if (Serial.available()) {
    char comandoRecibid_o = Serial.read();
    if (comandoRecibid_o == 'S' && currentState == IDLE) {
      startRoutine();
    }
  }

  // Si no está en reposo (IDLE), está en la rutina
  if (currentState != IDLE) {
    handleRoutine();
  }
  
  detectarSonido();
}

// --- MANEJO DEL RECORRIDO (MÁQUINA DE ESTADOS) ---
void startRoutine() {
  Serial.println("Iniciando recorrido en bucle...");
  currentStep = 0;
  currentState = EXECUTING_ROUTINE;
  stepStartTime = millis();
  executeStep(routine[currentStep]);
}

void handleRoutine() {
  unsigned long currentTime = millis();
  unsigned long stepDuration = 0;

  if (currentState == EXECUTING_ROUTINE) {
    RoutineStep step = routine[currentStep];
    if (step.type == FORWARD) {
      stepDuration = (unsigned long)step.value * MS_POR_CM;
    } else if (step.type == TURN_RIGHT) {
      stepDuration = (unsigned long)step.value * MS_POR_GRADO;
    }
    
    if (currentTime - stepStartTime >= stepDuration) {
      Parada();
      stepStartTime = currentTime;
      currentState = PAUSED;
    }
  }
  
  if (currentState == PAUSED) {
    if (currentTime - stepStartTime >= PAUSA_ENTRE_MOVIMIENTOS) {
      currentStep++; // Avanzamos al siguiente paso
      
      // Si hemos completado el último paso, volvemos al principio
      if (currentStep >= routineSize) {
        currentStep = 0; // ¡Aquí ocurre la magia del bucle!
        Serial.println("--- Recorrido reiniciado ---");
      }
      
      // Pasamos a ejecutar el siguiente paso (que podría ser el primero otra vez)
      currentState = EXECUTING_ROUTINE;
      stepStartTime = currentTime;
      executeStep(routine[currentStep]);
    }
  }
}

void executeStep(RoutineStep step) {
  switch (step.type) {
    case FORWARD: MarchaAdelante(); break;
    case TURN_RIGHT: GiroDer(); break;
  }
}

// --- SENSOR DE SONIDO + WiFi ---
void detectarSonido() {
  static unsigned long lastCheck = 0;
  
  if (millis() - lastCheck > 100) {
    int soundLevel = analogRead(SOUND_PIN_ANALOG);
    
    if (soundLevel > SOUND_THRESHOLD && (millis() - lastSoundTime > DEBOUNCE_TIME)) {
      lastSoundTime = millis();

      Serial.println("¡Sonido detectado!");
      tone(BUZZER_PIN, 500, 200);
      servo_alerta.write(90);
      delay(500);
      servo_alerta.write(0);
      delay(200);

      String data = "timestamp=" + String(millis()) +
                    "&soundLevel=" + String(soundLevel) +
                    "&status=Sonido_detectado";
      sendToSheets(data);
    }
    lastCheck = millis();
  }
}

// --- CONEXIÓN ESP8266 ---
void initESP() {
  Serial.println("Inicializando ESP...");
  espSerial.println("AT");
  delay(1000);
  if (espSerial.find("OK")) {
    espSerial.println("AT+RST");
    delay(3000);
    espSerial.println("AT+CWMODE=1");
    delay(1000);
    espSerial.println("AT+CWJAP=\"" + SSID + "\",\"" + PASSWORD + "\"");
    delay(7000);
    if (espSerial.find("OK")) {
      Serial.println("WiFi conectado!");
    } else {
      Serial.println("Error al conectar a WiFi!");
    }
  } else {
    Serial.println("Módulo ESP-01 no encontrado!");
  }
}

void sendToSheets(String params) {
  Serial.println("Enviando datos a Google Sheets...");
  espSerial.println("AT+CIPSTART=\"TCP\",\"script.google.com\",443");
  delay(2000);

  String request = "GET " + SHEETS_URL + "?" + params + " HTTP/1.1\r\n";
  request += "Host: script.google.com\r\n";
  request += "Connection: close\r\n\r\n";

  espSerial.print("AT+CIPSEND=");
  espSerial.println(request.length());

  if (espSerial.find(">")) {
    espSerial.print(request);
    Serial.println("Datos enviados.");
    delay(2000);
  } else {
    Serial.println("Error en CIPSEND");
    espSerial.println("AT+CIPCLOSE");
  }
}

// --- FUNCIONES DE MOVIMIENTO DEL ROBOT ---
#define SERVO_STOP 90
void MarchaAdelante() { throttle(100, 100); }
void MarchaAtras()   { throttle(-100, -100); }
void GiroIzq()       { throttle(-100, 100); }
void GiroDer()       { throttle(100, -100); }
void Parada()        { throttle(0, 0); }

void throttle(int velocidad_izq, int velocidad_der) {
  int vel_motor1 = map(velocidad_izq, -100, 100, 0, 180);
  int vel_motor2 = map(velocidad_der, -100, 100, 180, 0);

  motor1.write(vel_motor1);
  motor2.write(vel_motor2);
}

