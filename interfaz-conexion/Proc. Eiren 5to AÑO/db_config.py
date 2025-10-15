import mysql.connector

def conectar_db():
    return mysql.connector.connect(
        host="localhost",       # o la IP del servidor
        user="root",            # tu usuario de MySQL
        password="root",        # tu contraseña
        database="ciclobasico_db"   # tu base de datos
    )
