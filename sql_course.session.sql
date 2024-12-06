CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

INSERT INTO job_applied (
    job_id, 
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name)
VALUES 
    (1,
    '2024-02-01',
    true,
    'resume_01.pdf',
    true,
    'cover_letter_01.pdf');

SELECT * FROM job_applied;