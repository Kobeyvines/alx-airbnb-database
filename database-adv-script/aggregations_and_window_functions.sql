
/*Write a query to find the total number of bookings made by each user, using the 
COUNT function and GROUP BY clause.*/

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.user_id) AS total_number_of_bookings
FROM
    users u
JOIN
    booking b
    ON
    u.user_id = b.user_id
GROUP BY
    u.user_id,
    u.first_name,
    u.last_name
ORDER BY
    total_number_of_bookings DESC


/*Use a window function (ROW_NUMBER, RANK) to rank properties based on the total
number of bookings they have received.*/

SELECT
    p.name,
    p.location,
    COUNT(b.property_id) AS total_number_of_bookings,
    RANK() OVER (ORDER BY COUNT(b.property_id) DESC) AS bookings_rank
FROM
    properties p 
JOIN 
    booking b 
    ON 
    p.property_id = b.property_id
GROUP BY 
    p.name,
    p.location
