
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

--ROW NUMBER

SELECT
    p.property_id,
    p.name,
    p.location,
    COUNT(b.booking_id) AS total_number_of_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number
FROM
    properties p
LEFT JOIN
    bookings b
    ON p.property_id = b.property_id
GROUP BY
    p.property_id,
    p.name,
    p.location;
