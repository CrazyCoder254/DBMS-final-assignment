from fastapi import FastAPI, HTTPException
from database import conn, cursor
from models import UserCreate, TaskCreate

app = FastAPI()

# Create User
@app.post("/users/")
def create_user(user: UserCreate):
    cursor.execute("INSERT INTO users (name, email) VALUES (%s, %s)", (user.name, user.email))
    conn.commit()
    return {"message": "User created successfully"}

# Create Task
@app.post("/tasks/")
def create_task(task: TaskCreate):
    cursor.execute(
        "INSERT INTO tasks (title, description, status, user_id) VALUES (%s, %s, %s, %s)",
        (task.title, task.description, task.status, task.user_id)
    )
    conn.commit()
    return {"message": "Task created successfully"}

# Get All Tasks
@app.get("/tasks/")
def get_tasks():
    cursor.execute("SELECT * FROM tasks")
    return cursor.fetchall()

# Update Task
@app.put("/tasks/{task_id}")
def update_task(task_id: int, task: TaskCreate):
    cursor.execute(
        "UPDATE tasks SET title=%s, description=%s, status=%s, user_id=%s WHERE id=%s",
        (task.title, task.description, task.status, task.user_id, task_id)
    )
    conn.commit()
    return {"message": "Task updated"}

# Delete Task
@app.delete("/tasks/{task_id}")
def delete_task(task_id: int):
    cursor.execute("DELETE FROM tasks WHERE id=%s", (task_id,))
    conn.commit()
    return {"message": "Task deleted"}
# Route for testing FastAPI
@app.get("/")
def read_root():
    return {"message": "FastAPI is working!"}
