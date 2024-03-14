-- -- Scenario 1
-- Retrieve the names of all gaming engines.
SELECT engine_name FROM gaming_engine;

-- Scenario 2
-- Find the total quantity of all games in stock.
SELECT COUNT(*) AS total_number_games FROM game;

-- Scenario 3
-- Get the unique titles of all games with a price higher than $30.00.
SELECT game_title, price FROM game 
WHERE price > 30.00; 

-- Scenario 4
-- List the titles and quantities of games with less than 20 in stock.
SELECT game_title, quantity FROM game
WHERE quantity < 20;

-- Scenario 5
-- Find the total number of genre-game associations.*
SELECT COUNT(*) FROM genre_game;

-- Scenario 6
-- Retrieve the titles of action figures with a price between $20.00 and $50.00.
SELECT action_figure_title, price FROM action_figure
WHERE price > 20 AND price < 50; 

-- OR THE FOLLOWING WAY SHORTER SYNTAX

SELECT action_figure_title, price FROM action_figure
WHERE price BETWEEN 20 AND 50; 

-- Scenario 7
-- List the poster titles and prices for posters with quantities between 15 and 30.
SELECT poster_title, price, quantity FROM poster
WHERE quantity BETWEEN 15 AND 30;

-- Scenario 8
-- Get the names and positions of employees earning more than $40,000 per year.
SELECT employee_name, position, salary FROM employee
WHERE salary > 40000;

-- Scenario 9
-- Find the total number of social security entries.
SELECT COUNT(*) FROM social_security;

-- Scenario 10
-- Retrieve the start and end times of all shifts.
SELECT start_time, end_time FROM shifts;

-- Scenario 11
-- Get the names and salaries of employees working on shifts.
SELECT shifts.start_time, shifts.end_time, employee.employee_name, employee.salary
FROM shifts JOIN employee ON shifts.employee_id = employee.id; --on statement allows you to filter out and get back only what you need

-- SELECT shifts.start_time, shifts.end_time, employee.employee_name, employee.salary FROM shifts, employee; --wrong way which cross join

-- Scenario 12
-- List the action figures with a quantity less than 5.
SELECT action_figure_title, quantity FROM action_figure
WHERE quantity < 5;

-- Scenario 13
-- Retrieve the titles of games with the word 'Warzone' in their title.
SELECT game_title FROM game 
WHERE game_title LIKE '%Warzone%';

-- Scenario 14
-- Find the total number of genres.
SELECT COUNT(genre_name) FROM genre; 
SELECT COUNT(*) FROM genre; 
SELECT COUNT(*) AS num_genres FROM genre; 


-- Scenario 15
-- Get the names and quantities of action figures with prices over $27.00.
SELECT action_figure_title, quantity, price FROM action_figure
WHERE price > 27;

-- Scenario 16
-- Retrieve the names of employees in the 'IT Specialist' position.
SELECT employee_name, position FROM employee
WHERE position = 'IT Specialist'; -- use LIKE if substring in string

-- Scenario 17
-- List the game titles with quantities greater than 25.
SELECT game_title FROM game
WHERE quantity > 25;

-- Scenario 18
-- Find the total quantity of all items (games, action figures, and posters).
SELECT SUM(total_count) FROM --this is called a subquery
(SELECT COUNT(*) AS total_count FROM game --total_count is an alias, think of it as a function needing a parameter 
UNION ALL
SELECT COUNT(*) AS total_count FROM action_figure
UNION ALL
SELECT COUNT(*) AS total_count FROM poster) AS total_sum; --SUM needs an alias as well

-- Scenario 19
-- Retrieve the social security numbers and names of employees with salaries over $50,000.
SELECT social_security.ssn, employee.employee_name, employee.salary FROM employee
JOIN social_security ON employee.id = social_security.employee_id
WHERE employee.salary > 50000;--the order doesn't matter with a join, but does with left join or right join

SELECT social_security.ssn, employee.employee_name, employee.salary FROM social_security
JOIN  employee ON employee.id = social_security.employee_id
WHERE salary > 50000;


SELECT ssn FROM social_security
WHERE employee_id IN (          --reminds me of CREATE DATABASE
    SELECT id FROM employee     --and list builtins
    WHERE salary > 50000)--working backwards, from bottom up another approach to solving this problem

-- Scenario 20
-- Get the names and quantities of posters with prices between $10.00 and $15.00.
SELECT poster_title, quantity, price FROM poster
WHERE price BETWEEN 10 AND 15;

-- Scenario 21
-- List the names and quantities of posters with a price less than $8.00.
SELECT poster_title, quantity, price FROM poster
WHERE price < 8;


-- Scenario 22
-- Retrieve the employee names and salaries for 'Marketing Coordinator' and 'Finance Analyst' positions.
SELECT employee_name, salary, position FROM employee
WHERE position IN ('Marketing Coordinator', 'Finance Analyst');

-- Scenario 23
-- Find the total quantity of action figures in stock.
SELECT SUM(quantity) FROM action_figure;


-- Scenario 24
-- Get the titles and quantities of games with a quantity between 15 and 30.
SELECT game_title, quantity FROM game
WHERE quantity BETWEEN 15 AND 30;

-- Scenario 25
-- List the names and salaries of employees working on shifts with a start time after '2024-01-01'.
SELECT employee_name, salary, shifts.start_time FROM employee
JOIN shifts ON shifts.employee_id = employee.id
WHERE shifts.start_time > '2024-01-01';


-- Scenario 26
-- Retrieve the titles and prices of games with prices less than $20.00.
SELECT game_title, price FROM game
WHERE price < 20;

-- Scenario 27
-- Find the total quantity of action figures with prices between $25.00 and $30.00.
SELECT COUNT(quantity) FROM action_figure
WHERE price BETWEEN 25 AND 30;


-- Scenario 28
-- Get the names and positions of employees working on shifts with a start time before  '2024-03-07 13:00:00'.
SELECT employee.employee_name, employee.position, shifts.start_time FROM shifts
JOIN employee ON employee.id = shifts.employee_id
WHERE shifts.start_time > '2024-03-07 13:00:00';

-- SELECT table 1 property, table 2 property FROM table 1 JOIN table 2 ON table 1 common property = table 2 property


-- Scenario 29
-- List the names and quantities of action figures with a quantity greater than 10.
SELECT action_figure_title, quantity FROM action_figure
WHERE quantity > 10;

-- Scenario 30
-- Retrieve the titles and quantities of posters with quantities greater than 25.
SELECT poster_title, quantity FROM poster
WHERE quantity > 25;


-- Scenario 31
-- Find the total number of shifts.
SELECT COUNT(*) FROM shifts;
SELECT COUNT(id) FROM shifts;

-- Scenario 32
-- Get the names and positions of employees working on shifts with a start time between '2024-02-01' and '2024-03-07 13:00:00'.
SELECT employee.employee_name, employee.position, shifts.start_time FROM employee
JOIN shifts ON employee.id = shifts.employee_id
WHERE shifts.start_time BETWEEN '2024-02-01' AND '2024-03-07 13:00:00'
LIMIT (SELECT COUNT(id) FROM employee);

-- Scenario 33
-- List the game titles with quantities less than 20.
SELECT game_title, quantity FROM game
WHERE quantity < 20;

-- Scenario 34
-- Retrieve the names and quantities of action figures with prices over $20.00.
SELECT action_figure_title, quantity, price FROM action_figure
WHERE price > 20;

-- Scenario 35
-- Find the total quantity of posters in stock.
SELECT SUM(quantity) FROM poster;
