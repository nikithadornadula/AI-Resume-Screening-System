USE ai_resume_screening;
SHOW TABLES;
CREATE TABLE resumes (
    resume_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT,
    resume_text LONGTEXT,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id)
    REFERENCES candidates(candidate_id)
);

CREATE TABLE screening_results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT,
    score INT,
    status VARCHAR(20),
    remarks TEXT,
    FOREIGN KEY (candidate_id)
    REFERENCES candidates(candidate_id)
);

INSERT INTO candidates
(name, email, phone, skills, experience_years, education)
VALUES
('Rahul Sharma',
 'rahul@gmail.com',
 '9876543210',
 'Python, SQL, Machine Learning',
 3,
 'B.Tech');
 
 INSERT INTO candidates
(name, email, phone, skills, experience_years, education)
VALUES
('Priya Singh',
 'priya@gmail.com',
 '9876501234',
 'Python, Data Analysis, Power BI',
 2,
 'MCA');
 
 INSERT INTO candidates
(name, email, phone, skills, experience_years, education)
VALUES
('Amit Kumar',
 'amit@gmail.com',
 '9876512345',
 'Java, SQL, Spring Boot',
 4,
 'B.Tech');
 
 INSERT INTO candidates
(name, email, phone, skills, experience_years, education)
VALUES
('Sneha Patel',
 'sneha@gmail.com',
 '9876549876',
 'Python, SQL, Artificial Intelligence, NLP',
 5,
 'M.Tech');
 
 SELECT * FROM candidates;
 SELECT * FROM screening_results;
 TRUNCATE TABLE screening_results;
 SELECT * FROM screening_results;
 SELECT candidate_id, score, status, remarks
FROM screening_results
WHERE status = 'Selected';

SELECT * 
FROM screening_results
ORDER BY score DESC;

SELECT status, COUNT(*) AS total
FROM screening_results
GROUP BY status;

ALTER TABLE screening_results
ADD interview_date DATE;
