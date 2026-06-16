import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Niki@9849",
    database="ai_resume_screening"
)

cursor = conn.cursor()

cursor.execute(
    "SELECT candidate_id, name, skills, experience_years FROM candidates"
)

selected = 0

for candidate_id, name, skills, exp in cursor.fetchall():

    score = 0

    if "Python" in skills:
        score += 40

    if "SQL" in skills:
        score += 30

    if exp >= 3:
        score += 30

    print(name, "Score =", score)
    if score >= 80:
        status = "Selected"
        remarks = "Eligible for Interview"
        selected += 1
    else:
        status = "Rejected"
        remarks = "Skills Improvement Required"
    cursor.execute(
    	"INSERT INTO screening_results(candidate_id, score, status, remarks) VALUES (%s, %s, %s, %s)",
    	(candidate_id, score, status, remarks)
)



conn.commit()
print("Scores Saved Successfully")
print("Total Selected Candidates =", selected)
conn.close()