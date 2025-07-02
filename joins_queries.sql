/*Write a query using an INNER JOIN to retrieve all bookings and the respective users who made 
those bookings.*/

SELECT
    *
FROM
    bookings AS bookings
JOIN
    users AS users
    ON
    bookings.user_id = users.user_id

/*Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties
that have no reviews.*/

SELECT
    *
FROM
    properties AS property
LEFT JOIN
    reviews AS reviews
    ON
    property.property_id = reviews.property_id
ORDER BY 
    property.name ASC


/*Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has
no booking or a booking is not linked to a user.*/

SELECT
    *
FROM
    users AS users
FULL OUTER JOIN
    bookings AS bookings
    ON
    users.user_id = bookings.user_id