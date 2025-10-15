from tkinter import ttk

def aplicar_estilos(root):
    style = ttk.Style(root)
    style.theme_use("clam")

    # --- Colores Canva ---
    color_fondo = "#F5F3FF"       # Lavanda claro
    color_primario = "#8B5CF6"    # Violeta principal
    color_secundario = "#7C3AED"  # Hover
    color_acento = "#C4B5FD"      # Bordes / detalles
    color_texto = "#2E1065"       # Texto oscuro
    color_boton_texto = "white"
    color_entrada = "white"

    # --- Fuente elegante ---
    fuente_general = ("Nunito", 12)
    fuente_titulo = ("Nunito", 16, "bold")
    fuente_btn = ("Nunito", 14, "bold")
    fuente_tree = ("Nunito", 12)

    # --- Fondo general ---
    root.configure(bg=color_fondo)

    # --- Labels ---
    style.configure("TLabel",
                    background=color_fondo,
                    foreground=color_texto,
                    font=fuente_general,
                    anchor="center")

    # --- Botones ---
    style.configure("TButton",
                    background=color_primario,
                    foreground=color_boton_texto,
                    font=fuente_btn,
                    padding=10)
    style.map("TButton",
              background=[("active", color_secundario)],
              relief=[("pressed", "sunken")])

    # --- Entradas ---
    style.configure("TEntry",
                    fieldbackground=color_entrada,
                    foreground=color_texto,
                    font=fuente_general,
                    padding=6)

    # --- Treeview ---
    style.configure("Treeview",
                    background=color_entrada,
                    foreground=color_texto,
                    rowheight=28,
                    fieldbackground=color_entrada,
                    font=fuente_tree)
    style.configure("Treeview.Heading",
                    font=("Nunito", 12, "bold"),
                    background=color_primario,
                    foreground=color_boton_texto)
    style.map("Treeview.Heading",
              background=[("active", color_secundario)])
