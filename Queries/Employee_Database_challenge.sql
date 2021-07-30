-- DELIVERABLE 1
-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT em.emp_no,
	em.first_name,
	em.last_name,
-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
	ti.title,
	ti.from_date,
	ti.to_date
-- 3. Create a new table using the INTO clause.
INTO retirement_titles
FROM employees AS em
-- 4. Join both tables on the primary key.
LEFT JOIN titles AS ti
ON em.emp_no = ti.emp_no
-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
-- Then, order by the employee number.
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no
-- 7. Confirm output.
SELECT * FROM retirement_titles
-- 9. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--10. Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
--11. Create a Unique Titles table using the INTO clause.
INTO unique_titles
FROM retirement_titles
--12. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e. to_date) of the most recent title
ORDER BY emp_no, to_date DESC;
--13. Confirm output. 
SELECT * FROM unique_titles

--15. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
--16. First, retrieve the number of titles from the Unique Titles table.
SELECT COUNT(title), title
--17. Then, create a Retiring Titles table to hold the required information.
INTO retiring_titles
FROM unique_titles
--18. Group the table by title, then sort the count column in descending order.
GROUP BY title
ORDER BY COUNT(title) DESC;
--19. Confirm output.
SELECT * FROM retiring_titles

-- DELIVERABLE 2
-- 1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
-- 4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (em.emp_no) em.emp_no, 
	em.first_name, 
	em.last_name, 
	em.birth_date,
-- 2. Retrieve the from_date and to_date columns from the Department Employee table.
	de.from_date,
	de.to_date,
-- 3. Retrieve the title column from the Titles table.
	ti.title
INTO mentorship_eligibility	
FROM employees AS em
INNER JOIN dept_emp AS de
ON (em.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no;

SELECT * FROM mentorship_eligibility