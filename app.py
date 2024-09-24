from flask import Flask, render_template, request, send_file
import mysql.connector
import os
from grafico import graf_edadpatente
image_path = os.path.join('static', 'grafico.png')

app = Flask(__name__)

# Conexión a la base de datos
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="patentamientos0724"
    )

@app.route('/', methods=['GET', 'POST'])
def index():
    resultados = None
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = "SELECT * FROM provincia"
    cursor.execute(query)
    categorias = cursor.fetchall()  
    cursor.close()
    conn.close()
    return render_template('index.html', categorias=categorias)

@app.route('/edadpatente', methods=['GET', 'POST'])
def edadpatente():
    graf_edadpatente()
    return render_template('grafico.html', graph=image_path)

if __name__ == '__main__':
    app.run(debug=True)