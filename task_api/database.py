import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="kentech",
    database="task_manager"
)

cursor = conn.cursor(dictionary=True)
