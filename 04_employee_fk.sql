USE music_store;

ALTER TABLE employee
DROP FOREIGN KEY employee_ibfk_1;

-- Run 02_import_data.py

ALTER TABLE employee
ADD CONSTRAINT employee_ibfk_1
FOREIGN KEY (reports_to)
REFERENCES employee(employee_id);