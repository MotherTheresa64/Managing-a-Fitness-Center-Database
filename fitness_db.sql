/*CREATE DATABASE fitness_db;
SET SQL_SAFE_UPDATES = 0; 
USE fitness_db;

The above commands only get used if in MySQL local program. Attached snippet is from online compiler from a "work-approved website due to my restrictions"
*/

CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

INSERT INTO Members (id, name, age) VALUES
(1, 'Jane Doe', 30),
(2, 'John Smith', 25),
(3, 'Alice Johnson', 28);

INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) VALUES
(1, 1, '2024-08-27', 'Morning', 'Yoga'),
(2, 2, '2024-08-27', 'Afternoon', 'Weight Training'),
(3, 3, '2024-08-27', 'Evening', 'Cardio');

UPDATE WorkoutSessions
SET session_time = 'Evening'
WHERE member_id = 1 AND session_time = 'Morning';

DELETE FROM WorkoutSessions
WHERE member_id = (SELECT id FROM Members WHERE name = 'John Smith');

DELETE FROM Members
WHERE name = 'John Smith';

/*
Output:
+----+---------------+------+
| id | name          | age  |
+----+---------------+------+
|  1 | Jane Doe      |   30 |
|  3 | Alice Johnson |   28 |
+----+---------------+------+
+------------+-----------+--------------+--------------+----------+
| session_id | member_id | session_date | session_time | activity |
+------------+-----------+--------------+--------------+----------+
|          1 |         1 | 2024-08-27   | Evening      | Yoga     |
|          3 |         3 | 2024-08-27   | Evening      | Cardio   |
+------------+-----------+--------------+--------------+----------+
*/