import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Niki@9849",
    database="ai_resume_screening"
)

print("Connected Successfully")

cursor = conn.cursor()

cursor.execute("SELECT * FROM candidates")

rows = cursor.fetchall()

for row in rows:
    print(row)

conn.close()