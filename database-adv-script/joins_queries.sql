SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number
FROM bookings b
INNER JOIN users u on b.guest_id = u.user_id
ORDER BY b.created_at DESC

SELECT 
    p.property_id,
    p.price_per_night
    p.created_at AS property_created_at,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_created_at
FROM properties p
OUTER JOIN reviews r ON p.property_id = r.property_id

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM users u 
FULL JOIN  bookings b ON u.user_id = b.guest_id

SELECT 
    p.property_id,
    p.name, 
    p.location,
    p.price_per_night,
    p.description,
FROM properties p 
WHERE (
    SELECT AVG(r.rating)
    FROM reviews r
    WHERE r.property_id = p.property_id) > 4

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,

FROM users u
 WHERE(
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.guest_id = u.user_id
 ) > 3

 SELECT
   u.user_id,
   u.email,
   u.first_name,
   u.last_name,
   u.role,
   b.booking_id,
   b.property,
   b.start_date,
   b.end_date,b.total_price,
   b.status AS booking_status,
   b.created_at AS booking_created_at
 FROM 
   users u
 FULL OUTER JOIN bookings b ON U.user_id = b.guest_id 

 ORDER BY 
    u.user_id, b.booking_id

SELECT
   p.property_id,
   p.name AS property_name,
   p.location,
   p.price_per_night,
   COUNT(r.review_id) AS total_reviews,
   AVG(r.rating) AS average_rating,
   MIN(r.rating) AS lowest_rating,
   MAX(r.rating) AS highest_rating
FROM
   properties P
LEFT JOIN 
 reviews r ON p.property_id = r.property_id
GROUP BY
 p.property_id, p.name, p.location, p.price_per_night
ORDER BY 
 average_rating DESC NULLS LAST, total_reviews DESC;   


     



    


