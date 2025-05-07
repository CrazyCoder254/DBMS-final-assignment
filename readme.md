A combined project that includes:

A library database system and A task management API built using FastAPI

PROJECT ONE
📚 Library Management System – SQL Schema
This project contains the SQL schema for a Library Management System. It includes tables for members, books, authors, categories, and borrowing records, along with sample data.

🔧 Prerequisites
To run this SQL file, you'll need:
MySQL Server installed and running (version 5.7+ recommended)
A database management tool like:
MySQL Workbench
phpMyAdmin
Command Line Interface (mysql)

📂 File
library.sql 
LINK: https://github.com/CrazyCoder254/DBMS-final-assignment/blob/main/library.sql

▶️ How to Run
Option 1: Using MySQL Workbench
Open MySQL Workbench and connect to your MySQL server.
Run the library.sql script
You should see a new database called librarydb.

PROJECT TWO
📝 Task Manager API – FastAPI + MySQL
This is a simple CRUD API for managing tasks, built using **FastAPI** and **MySQL**.

✅ Prerequisites
Python 3.8+
pip
📦 Installation


🚀 Features

- Create, read, update, and delete users and tasks
- MySQL database with foreign key relationships
- FastAPI with automatic Swagger UI

🛠️ Step 2: Clone the Project
git clone https://github.com/CrazyCoder254/DBMS-final-assignment.githttps://github.com/your-username/task-manager-api.git
cd task-manager-api

⚙️ Step 2: Set Up the MySQL Database

 **Open MySQL** (via command line or any GUI like MySQL Workbench).
 Run the tasks.sql script to create the task management database located in the project folder.

🧰 Step 3: Install Dependencies
Make sure you're inside the project folder, then run:
pip install fastapi uvicorn mysql-connector-python pydantic

📝 Step 4: Update Your Database Credentials
In the file database.py, update the following with your actual MySQL credentials:
conn = mysql.connector.connect(
    host="localhost",
    user="your_username",
    password="your_password",
    database="task_manager"
)

▶️ Step 5: Run the API
Start the FastAPI server with:
uvicorn main:app --reload

You’ll see:
Uvicorn running on http://127.0.0.1:8000

🌐 Step 6: Use the API
Open your browser and go to:

Swagger UI: http://127.0.0.1:8000/docs

Redoc UI: http://127.0.0.1:8000/redoc

You can test endpoints like:

POST /users/

POST /tasks/

GET /tasks/

PUT /tasks/{id}

DELETE /tasks/{id}

