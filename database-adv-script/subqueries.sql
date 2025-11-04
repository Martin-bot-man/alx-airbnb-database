SELECT
 p.property_id,
 p.name AS property_name,
 p.description,
 p.location,
 p.price_per_night,
 p.created_at
FROM
 properties P
WHERE
 p.property_id IN(
    SELECT 
        r.property_id
    FROM 
        reviews r
    GROUP BY
        r.property_id
    HAVING AVG(r.rating)> 4.0

 ) 
 ORDER BY
    p.name;

SELECT
 u.user_id,
 u.email,
 u.first_name,
 u.last_name,
 u.role,
 u.phone_number,
 u.created_at
FROM
 users u
WHERE
 (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.guest_id = u.user_id
 ) > 3

ORDER BY
 u.first_name;
