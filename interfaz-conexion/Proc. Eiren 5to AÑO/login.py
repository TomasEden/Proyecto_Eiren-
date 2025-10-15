import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector
import webbrowser

# -------------------------
# Importar funciones externas
# -------------------------
# ¡IMPORTANTE! Estos archivos (get_primer_año.py, etc.) deben existir en el mismo directorio.
from get_primer_año import get_primer_ano
from get_segundo_año import get_segundo_ano
from get_tercer_año import get_tercer_ano
from get_cuarto_año import get_cuarto_ano
from get_quinto_año import get_quinto_ano
from get_sexto_año import get_sexto_ano
from get_profes import get_profes
from get_directivos import get_directivos

# -------------------------
# Función de conexión a base de datos (solo para login)
# -------------------------
def conectar_db(nombre_bd):
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            database=nombre_bd
        )
        return conn
    except mysql.connector.Error as err:
        # No mostramos el error aquí para no interrumpir el login por cada BD
        return None

# -------------------------
# Verificación de Login
# -------------------------
def verificar_mail(mail):
    if not mail.endswith("@escuelasproa.edu.ar"):
        messagebox.showerror("Correo inválido", 
                             "Debes ingresar tu correo institucional (@escuelasproa.edu.ar)")
        return

    bases = ["ciclobasico_db", "cicloorientado_db", "gestion_db"]
    tablas = [
        "primer_año", "segundo_año", "tercer_año",
        "cuarto_año", "quinto_año", "sexto_año",
        "profes", "directivos"
    ]

    encontrado = False

    for base in bases:
        conn = conectar_db(base)
        if conn:
            cursor = conn.cursor()
            for tabla in tablas:
                try:
                    cursor.execute(f"SELECT gmail FROM {tabla} WHERE gmail = %s", (mail,))
                    resultado = cursor.fetchone()
                    if resultado:
                        encontrado = True
                        break
                except mysql.connector.Error:
                    # Captura el error específico de MySQL (ej. tabla no existe) y continúa
                    pass
            conn.close()

        if encontrado:
            break

    if encontrado:
        login.destroy()
        abrir_menu_principal()
    else:
        messagebox.showerror("Error", "Correo no registrado en ninguna base de datos.")

# -------------------------
# Menú principal
# -------------------------
def abrir_menu_principal():
    menu = tk.Tk()
    menu.title("Pantalla de Inicio")
    menu.geometry("400x350")

    tk.Label(menu, text="Seleccione una opción:", font=("Arial", 14)).pack(pady=20)

    btn1 = tk.Button(menu, text="Ciclo Básico", width=20, command=abrir_ciclo_basico)
    btn2 = tk.Button(menu, text="Ciclo Orientado", width=20, command=abrir_ciclo_orientado)
    btn3 = tk.Button(menu, text="Dirección", width=20, command=abrir_direccion)
    btn4 = tk.Button(menu, text="Ayuda", width=20, command=abrir_ayuda)

    btn1.pack(pady=5)
    btn2.pack(pady=5)
    btn3.pack(pady=5)
    btn4.pack(pady=5)

    menu.mainloop()

# -------------------------
# Submenús
# -------------------------
def abrir_ciclo_basico():
    sub = tk.Toplevel()
    sub.title("Ciclo Básico")
    sub.geometry("300x250")

    tk.Label(sub, text="Seleccione un curso:", font=("Arial", 12)).pack(pady=15)

    for curso in ["Primero", "Segundo", "Tercero"]:
        tk.Button(sub, text=f"{curso} Año", width=20,
                  command=lambda c=curso: abrir_tabla_alumnos(c)).pack(pady=5)


def abrir_ciclo_orientado():
    sub = tk.Toplevel()
    sub.title("Ciclo Orientado")
    sub.geometry("300x250")

    tk.Label(sub, text="Seleccione un curso:", font=("Arial", 12)).pack(pady=15)

    for curso in ["Cuarto", "Quinto", "Sexto"]:
        tk.Button(sub, text=f"{curso} Año", width=20,
                  command=lambda c=curso: abrir_tabla_alumnos(c)).pack(pady=5)


def abrir_direccion():
    sub = tk.Toplevel()
    sub.title("Dirección")
    sub.geometry("300x250")

    tk.Label(sub, text="Seleccione una opción:", font=("Arial", 12)).pack(pady=15)

    tk.Button(sub, text="Directivos", width=20,
              command=lambda: abrir_tabla_directivos("Directivos")).pack(pady=5)
    tk.Button(sub, text="Profesores", width=20,
              command=lambda: abrir_tabla_profesores("Profesores")).pack(pady=5)

# -------------------------
# Tablas
# -------------------------
def abrir_tabla_alumnos(curso):
    ventana = tk.Toplevel()
    ventana.title(f"{curso} Año")
    ventana.geometry("750x400") # Se aumenta el tamaño para 4 columnas

    tk.Label(ventana, text=f"{curso} Año", font=("Arial", 16)).pack(pady=10)

    frame_busqueda = tk.Frame(ventana)
    frame_busqueda.pack(pady=5)
    tk.Label(frame_busqueda, text="Buscar: ").pack(side="left")
    entry_buscar = tk.Entry(frame_busqueda)
    entry_buscar.pack(side="left", padx=5)

    # Definición de 4 columnas (ID, Nombre, Apellido, Mail) basada en tu output de consola
    columnas = ("ID", "Nombre", "Apellido", "Mail") 
    tree = ttk.Treeview(ventana, columns=columnas, show="headings")
    
    for col in columnas:
        tree.heading(col, text=col)
        if col == "Mail":
            tree.column(col, width=250)
        elif col == "ID":
            tree.column(col, width=50)
        else:
            tree.column(col, width=150)
            
    tree.pack(fill="both", expand=True)

    # Obtener datos según curso
    if curso == "Primero":
        datos = get_primer_ano()
    elif curso == "Segundo":
        datos = get_segundo_ano()
    elif curso == "Tercero":
        datos = get_tercer_ano()
    elif curso == "Cuarto":
        datos = get_cuarto_ano()
    elif curso == "Quinto":
        datos = get_quinto_ano()
    elif curso == "Sexto":
        datos = get_sexto_ano()
    else:
        datos = []

    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    # SOLUCIÓN AL TypeError: 'NoneType' object is not iterable
    if datos is None:
        datos = []
        messagebox.showwarning("Advertencia de datos", 
                               f"No se pudieron cargar los datos de {curso} Año. Verifique la conexión a la base de datos en el archivo de la función get_{curso.lower()}_año.py")
    # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        
    # Insertar datos en la tabla
    for d in datos:
        tree.insert("", "end", values=d)

    def buscar():
        valor = entry_buscar.get().lower()
        # Limpiar tabla
        for item in tree.get_children():
            tree.delete(item)
        # Filtrar e insertar
        for d in datos:
             # Convertimos toda la fila (tupla) a string para buscar en todos los campos
            if valor in ' '.join(map(str, d)).lower():
                tree.insert("", "end", values=d)

    btn_buscar = tk.Button(frame_busqueda, text="Buscar", command=buscar)
    btn_buscar.pack(side="left")

def abrir_tabla_directivos(titulo):
    ventana = tk.Toplevel()
    ventana.title(titulo)
    ventana.geometry("600x400")

    tk.Label(ventana, text=titulo, font=("Arial", 16)).pack(pady=10)

    columnas = ("ID", "Nombre", "Rol", "Mail")
    tree = ttk.Treeview(ventana, columns=columnas, show="headings")
    for col in columnas:
        tree.heading(col, text=col)
        if col == "Mail":
             tree.column(col, width=200)
        else:
             tree.column(col, width=120)
    tree.pack(fill="both", expand=True)

    datos = get_directivos()
    if datos is None:
        datos = []
        messagebox.showwarning("Advertencia de datos", "No se pudieron cargar los datos de Directivos.")

    for d in datos:
        tree.insert("", "end", values=d)

def abrir_tabla_profesores(titulo):
    ventana = tk.Toplevel()
    ventana.title(titulo)
    ventana.geometry("600x400")

    tk.Label(ventana, text=titulo, font=("Arial", 16)).pack(pady=10)

    columnas = ("ID", "Nombre", "Materia", "Mail")
    tree = ttk.Treeview(ventana, columns=columnas, show="headings")
    for col in columnas:
        tree.heading(col, text=col)
        if col == "Mail":
             tree.column(col, width=200)
        else:
             tree.column(col, width=120)
    tree.pack(fill="both", expand=True)

    datos = get_profes()
    if datos is None:
        datos = []
        messagebox.showwarning("Advertencia de datos", "No se pudieron cargar los datos de Profesores.")

    for d in datos:
        tree.insert("", "end", values=d)

# -------------------------
# Ayuda
# -------------------------
def abrir_ayuda():
    ventana = tk.Toplevel()
    ventana.title("Ayuda")
    ventana.geometry("500x350")

    tk.Label(ventana, text="Enlaces de ayuda:", font=("Arial", 14)).pack(pady=10)

    enlaces = [
        ("Crear y ejecutar código en línea", "https://www.mycompiler.io/es"),
        ("Programación en distintos lenguajes 1", "https://tutorialesprogramacionya.com/"),
        ("Programación en distintos lenguajes 2", "https://aprendeconalf.es/docencia/python/"),
        ("Programación en distintos lenguajes 3", "https://pathfinder.w3schools.com/"),
        ("Programación en Python 1", "https://pythontutor.com/"),
        ("Simulación de circuitos y 3D", "https://www.tinkercad.com/circuits"),
        ("Desarrollo Web", "https://codepen.io/"),
        ("Juegos para practicar CSS", "https://www.espai.es/blog/2022/04/8-juegos-para-aprender-css/"),
        ("Ejecutar código de python en línea", "https://pythonsandbox.com/"),
        ("Navegación responsiva", "https://getbootstrap.com/docs/5.0/components/navbar/"),
    ]

    for texto, url in enlaces:
        link = tk.Label(ventana, text=texto, fg="blue", cursor="hand2")
        link.pack(pady=5)
        link.bind("<Button-1>", lambda e, url=url: abrir_link(url))

def abrir_link(url):
    webbrowser.open(url)

# -------------------------
# Ventana Login inicial
# -------------------------
login = tk.Tk()
login.title("Login por E_mail")
login.geometry("300x150")

tk.Label(login, text="Correo institucional:", font=("Arial", 11)).pack(pady=10)
entry_mail = tk.Entry(login, width=30)
entry_mail.pack()

btn_login = tk.Button(login, text="Ingresar", command=lambda: verificar_mail(entry_mail.get()))
btn_login.pack(pady=20)

login.mainloop()