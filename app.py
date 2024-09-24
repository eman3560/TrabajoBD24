from flask import Flask, render_template, request
import mysql.connector

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

if __name__ == '__main__':
    app.run(debug=True)