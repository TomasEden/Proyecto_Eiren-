import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector
import webbrowser

# -------------------------
# Importar funciones externas
# -------------------------
from get_primer_año import get_primer_ano
from get_segundo_año import get_segundo_ano
from get_tercer_año import get_tercer_ano
from get_cuarto_año import get_cuarto_ano
from get_quinto_año import get_quinto_ano
from get_sexto_año import get_sexto_ano
from get_profes import get_profes
from get_directivos import get_directivos

# -------------------------
# Importar estilos
# -------------------------
from estilos import aplicar_estilos

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
    menu.geometry("600x400")
    menu.resizable(False, False)
    aplicar_estilos(menu)

    ttk.Label(menu, text="Seleccione una opción:").pack(pady=30)

    btn1 = ttk.Button(menu, text="Ciclo Básico", width=25, command=abrir_ciclo_basico)
    btn2 = ttk.Button(menu, text="Ciclo Orientado", width=25, command=abrir_ciclo_orientado)
    btn3 = ttk.Button(menu, text="Dirección", width=25, command=abrir_direccion)
    btn4 = ttk.Button(menu, text="Ayuda", width=25, command=abrir_ayuda)

    btn1.pack(pady=10)
    btn2.pack(pady=10)
    btn3.pack(pady=10)
    btn4.pack(pady=10)

    menu.mainloop()

# -------------------------
# Submenús
# -------------------------
def abrir_ciclo_basico():
    sub = tk.Toplevel()
    sub.title("Ciclo Básico")
    sub.geometry("500x400")
    sub.resizable(False, False)
    aplicar_estilos(sub)

    ttk.Label(sub, text="Seleccione un curso:").pack(pady=20)

    for curso in ["Primero", "Segundo", "Tercero"]:
        ttk.Button(sub, text=f"{curso} Año", width=25,
                   command=lambda c=curso: abrir_tabla_alumnos(c)).pack(pady=10)

def abrir_ciclo_orientado():
    sub = tk.Toplevel()
    sub.title("Ciclo Orientado")
    sub.geometry("500x400")
    sub.resizable(False, False)
    aplicar_estilos(sub)

    ttk.Label(sub, text="Seleccione un curso:").pack(pady=20)

    for curso in ["Cuarto", "Quinto", "Sexto"]:
        ttk.Button(sub, text=f"{curso} Año", width=25,
                   command=lambda c=curso: abrir_tabla_alumnos(c)).pack(pady=10)

def abrir_direccion():
    sub = tk.Toplevel()
    sub.title("Dirección")
    sub.geometry("500x400")
    sub.resizable(False, False)
    aplicar_estilos(sub)

    ttk.Label(sub, text="Seleccione una opción:").pack(pady=20)

    ttk.Button(sub, text="Directivos", width=25,
               command=lambda: abrir_tabla_directivos("Directivos")).pack(pady=10)
    ttk.Button(sub, text="Profesores", width=25,
               command=lambda: abrir_tabla_profesores("Profesores")).pack(pady=10)

# -------------------------
# Tablas
# -------------------------
def abrir_tabla_alumnos(curso):
    ventana = tk.Toplevel()
    ventana.title(f"{curso} Año")
    ventana.geometry("800x500")
    ventana.resizable(False, False)
    aplicar_estilos(ventana)

    ttk.Label(ventana, text=f"{curso} Año").pack(pady=15)

    frame_busqueda = ttk.Frame(ventana)
    frame_busqueda.pack(pady=10)
    ttk.Label(frame_busqueda, text="Buscar:").pack(side="left", padx=5)
    entry_buscar = ttk.Entry(frame_busqueda, width=40)
    entry_buscar.pack(side="left", padx=5)
    btn_buscar = ttk.Button(frame_busqueda, text="Buscar")
    btn_buscar.pack(side="left", padx=5)

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

    if datos is None:
        datos = []
        messagebox.showwarning("Advertencia de datos", 
                               f"No se pudieron cargar los datos de {curso} Año.")

    for d in datos:
        tree.insert("", "end", values=d)

    def buscar():
        valor = entry_buscar.get().lower()
        for item in tree.get_children():
            tree.delete(item)
        for d in datos:
            if valor in ' '.join(map(str, d)).lower():
                tree.insert("", "end", values=d)

    btn_buscar.config(command=buscar)

def abrir_tabla_directivos(titulo):
    ventana = tk.Toplevel()
    ventana.title(titulo)
    ventana.geometry("700x450")
    ventana.resizable(False, False)
    aplicar_estilos(ventana)

    ttk.Label(ventana, text=titulo).pack(pady=15)

    columnas = ("ID", "Nombre", "Gmail", "Rol")
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
    ventana.geometry("700x450")
    ventana.resizable(False, False)
    aplicar_estilos(ventana)

    ttk.Label(ventana, text=titulo).pack(pady=15)

    columnas = ("ID", "Nombre", "Gmail", "Materia")
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
    ventana.geometry("600x400")
    ventana.resizable(False, False)
    aplicar_estilos(ventana)

    ttk.Label(ventana, text="Enlaces de ayuda:").pack(pady=15)

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
        link = ttk.Label(ventana, text=texto, foreground="blue", cursor="hand2")
        link.pack(pady=5)
        link.bind("<Button-1>", lambda e, url=url: abrir_link(url))

def abrir_link(url):
    webbrowser.open(url)

# -------------------------
# Ventana Login inicial
# -------------------------
login = tk.Tk()
login.title("Login por E_mail")
login.geometry("500x300")
login.resizable(False, False)
aplicar_estilos(login)

ttk.Label(login, text="Correo institucional:").pack(pady=20)
entry_mail = ttk.Entry(login, width=40)
entry_mail.pack(pady=10)

ttk.Button(login, text="Ingresar", command=lambda: verificar_mail(entry_mail.get())).pack(pady=20)

login.mainloop()
