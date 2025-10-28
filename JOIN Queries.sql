USE Company;
GO

SELECT d.department_name, p.project_name
FROM Departments d
JOIN Projects p ON d.department_id = p.department_id;

SELECT dep.*, e.first_name + ' ' + e.last_name AS employee_name
FROM Dependents dep
JOIN Employees e ON dep.employee_id = e.employee_id;

SELECT project_id, project_name, location
FROM Projects
WHERE location IN ('Cairo','Mustafa');

SELECT * FROM Projects WHERE project_name LIKE 'A%';


SELECT employee_id, first_name + ' ' + last_name AS emp_name
FROM Employees
WHERE department_id = 30 AND salary BETWEEN 1000 AND 2000;

SELECT e.first_name + ' ' + e.last_name AS emp_name
FROM Employees e
JOIN Works_On w ON e.employee_id = w.employee_id
JOIN Projects p ON w.project_id = p.project_id
WHERE e.department_id = 10 AND p.project_name = 'AL Rabwah' AND w.hours >= 10;


SELECT e.first_name + ' ' + e.last_name AS emp_name
FROM Employees e
JOIN Employees s ON e.supervisor_id = s.employee_id
WHERE s.first_name = 'Abdullah' AND s.last_name = 'AL - Rashdi';

SELECT e.first_name + ' ' + e.last_name AS emp_name, p.project_name
FROM Employees e
JOIN Works_On w ON e.employee_id = w.employee_id
JOIN Projects p ON w.project_id = p.project_id
ORDER BY p.project_name;

SELECT p.project_id, p.project_name, d.department_name, m.last_name AS manager_lname, m.address, m.birth_date
FROM Projects p
JOIN Departments d ON p.department_id = d.department_id
JOIN Employees m ON d.manager_id = m.employee_id
WHERE p.location = 'Cairo';

SELECT DISTINCT m.*
FROM Employees m
JOIN Departments d ON m.employee_id = d.manager_id;

SELECT e.employee_id, e.first_name + ' ' + e.last_name AS emp_name, d.dependent_name, d.relationship
FROM Employees e
LEFT JOIN Dependents d ON e.employee_id = d.employee_id;