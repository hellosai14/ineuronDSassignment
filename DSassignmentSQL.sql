#Q1.

-- Create the 'runners' table
CREATE TABLE runners (
    id INT,
    name VARCHAR(255)
);

-- Insert data into the 'runners' table
INSERT INTO runners (id, name) VALUES
(1, 'John Doe'),
(2, 'Jane Doe'),
(3, 'Alice Jones'),
(4, 'Bobby Louis'),
(5, 'Lisa Romero');

-- Create the 'races' table
CREATE TABLE races (
    id INT,
    event VARCHAR(255),
    winner_id INT
);




-- Insert data into the 'races' table
INSERT INTO races (id, event, winner_id) VALUES
(1, '100 meter dash', 2),
(2, '500 meter dash', 3),
(3, 'cross-country', 2),
(4, 'triathlon', NULL);

SELECT DISTINCT r.id, r.name
FROM runners r
WHERE r.id NOT IN (SELECT DISTINCT winner_id FROM races WHERE winner_id IS NOT NULL);




#Q.2 

-- Create table test_a
CREATE TABLE test_a (
    id NUMERIC
);

-- Create table test_b
CREATE TABLE test_b (
    id NUMERIC
);

-- Insert data into test_a
INSERT INTO test_a (id) VALUES
(10),
(20),
(30),
(40),
(50);

-- Insert data into test_b
INSERT INTO test_b (id) VALUES
(10),
(30),
(50);

SELECT a.id
FROM test_a a
LEFT JOIN test_b b ON a.id = b.id
WHERE b.id IS NULL;



#Q3.


-- Create the 'users' table
CREATE TABLE users5 (
    user_id INT,
    username VARCHAR(255)
);

-- Insert data into the 'users' table
INSERT INTO users5 (user_id, username) VALUES
(1, 'John Doe'),
(2, 'Jane Don'),
(3, 'Alice Jones'),
(4, 'Lisa Romero');

-- Create the 'training_details' table
CREATE TABLE training_details (
    user_training_id INT,
    user_id INT,
    training_id INT,
    training_date DATE
);

-- Insert data into the 'training_details' table
INSERT INTO training_details (user_training_id, user_id, training_id, training_date) VALUES
(1, 1, 1, '2015-08-02'),
(2, 2, 1, '2015-08-03'),
(3, 3, 2, '2015-08-02'),
(4, 4, 2, '2015-08-04'),
(5, 2, 2, '2015-08-03'),
(6, 1, 1, '2015-08-02'),
(7, 3, 2, '2015-08-04'),
(8, 4, 3, '2015-08-03'),
(9, 1, 4, '2015-08-03'),
(10, 3, 1, '2015-08-02'),
(11, 4, 2, '2015-08-04'),
(12, 3, 2, '2015-08-02'),
(13, 1, 1, '2015-08-02'),
(14, 4, 3, '2015-08-03');


SELECT
    user_id,
    training_id,
    COUNT(*) AS lesson_count,
    MAX(training_date) AS most_recent_date
FROM
    training_details
GROUP BY
    user_id,
    training_id,
    training_date
HAVING
    COUNT(*) > 1
ORDER BY
    most_recent_date DESC;
    
    
#Q.4

-- Create the 'employee' table
CREATE TABLE employee5 (
    Emp_id INT,
    Emp_name VARCHAR(255),
    Salary INT,
    Manager_id INT
);

-- Insert data into the 'employee' table
INSERT INTO employee5 (Emp_id, Emp_name, Salary, Manager_id) VALUES
(10, 'Anil', 50000, 18),
(11, 'Vikas', 75000, 16),
(12, 'Nisha', 40000, 18),
(13, 'Nidhi', 60000, 17),
(14, 'Priya', 80000, 18),
(15, 'Mohit', 45000, 18),
(16, 'Rajesh', 90000, NULL),
(17, 'Raman', 55000, 16),
(18, 'Santosh', 65000, 17);

SELECT
    e.Manager_id,
    m.Emp_name AS Manager,
    AVG(e.Salary) AS Average_Salary_Under_Manager
FROM
    employee5 e
JOIN
    employee5 m ON e.Manager_id = m.Emp_id
GROUP BY
    e.Manager_id, m.Emp_name
ORDER BY
    e.Manager_id;

    


  










  