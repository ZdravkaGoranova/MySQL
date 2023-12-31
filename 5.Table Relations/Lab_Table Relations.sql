# 1. Mountains and Peaks
CREATE TABLE mountains (
    id INT PRIMARY KEY AUTO_INCREMENT ,
    name VARCHAR(40) not null
);
CREATE TABLE peaks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    mountain_id INT,
    CONSTRAINT fk_peaks_mountains FOREIGN KEY (mountain_id)
        REFERENCES mountains (id)
);

# 2. Trip Organization
SELECT 
    driver_id,
    vehicle_type,
    CONCAT_WS(' ', c.first_name, c.last_name) AS 'driver_name'
FROM
    vehicles AS v
        JOIN
    campers AS c ON v.driver_id = c.id;

# 3. SoftUni Hiking
SELECT 
    starting_point,
    end_point,
    leader_id,
    CONCAT_WS(' ', first_name, last_name) AS leader_name
FROM
    routes AS r
        JOIN
    campers AS c ON c.id = r.leader_id;
    
