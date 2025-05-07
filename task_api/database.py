import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="yourusername", #Replace with your MySQL username
    password="yourpassword", #Replace with your MySQL password
    database="task_manager"
)

cursor = conn.cursor(dictionary=True)
