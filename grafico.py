import mysql.connector
import matplotlib.pyplot as plt
import os

def conectar():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="patentamientos0724"
    )

    # Crear un cursor
    cursor = conn.cursor()

    return conn,cursor

def graf_edadpatente():

# Conectar a la base de datos
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="patentamientos0724"
    )

    # Crear un cursor
    cursor = conn.cursor()

    # Consultar datos de la vista
    cursor.execute("SELECT titular_anio_nacimiento, totales, Edad FROM InscripcionEdad")
    resultados = cursor.fetchall()

    # Cerrar cursor y conexión
    cursor.close()
    conn.close()

    # Procesar los datos
    totales = [fila[1] for fila in resultados]
    edades = [fila[2] for fila in resultados]

    # Crear el gráfico
    plt.figure(figsize=(12, 6))

    # Gráfico de barras para 'totales'
    bars=plt.bar(edades, totales, color='b', alpha=0.6, label='Total Inscripciones')

    for bar in bars:
        yval = bar.get_height()  # Obtiene la altura de la barra
        plt.text(bar.get_x() + bar.get_width()/2, yval, int(bar.get_x()), ha='center', va='bottom')  # Muestra el valor

    # Añadir títulos y etiquetas
    plt.title('Total de Inscripciones y Edad Promedio')
    plt.xlabel('Edad')
    plt.ylabel('Total Inscripciones')
    plt.xticks(rotation=0)
    plt.legend()
    plt.grid()

    image_path = os.path.join('static', 'grafico.png')
    os.remove(image_path)
    plt.savefig(image_path)
    plt.close()  # Cerrar la figura para liberar memoria

def graf_generos():
    conn,cursor=conectar()
    cursor.execute("SELECT * FROM generos")
    resultados = cursor.fetchall()

    # Cerrar cursor y conexión
    cursor.close()
    conn.close()

    # Procesar los datos
    generos = [fila[0] for fila in resultados]
    cantidades = [fila[1] for fila in resultados]

    # Crear el gráfico
    plt.figure(figsize=(12, 6))

    # Gráfico de barras para 'totales'
    plt.pie(cantidades,labels=generos)
    
    # Añadir títulos y etiquetas
    plt.title('Participacion segun Genero')
    plt.legend()
    plt.grid()

    image_path = os.path.join('static', 'grafico.png')
    os.remove(image_path)
    plt.savefig(image_path)
    plt.close()  # Cerrar la figura para liberar memoria