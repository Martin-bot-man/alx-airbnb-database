SELECT 
   u.user_id,
   u.first_name,
   u.last_name,
   u.email,
   COUNT(b.booking_id)AS total_bookings
FROM 
 user U
LEFT JOIN 
 bookings b ON u.user_id = b.guest_id
GROUP BY 
 u.user_id, u.first_name, u.last_name,u.email
ORDER BY
 total_bookings DESC, u.first_name;

 SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    COUNT(b.booking_id)AS total_bookings,
    ROW_NUMBER() OVER(ORDER BY COUNT(b.booking_id)DESC)AS row_number_rank)
 FROM
    properties P
 LEFT JOIN
    bookings b ON p.property_id = b.property
 GROUP BY
    p.property_id, p.name, p.location, p.price_per_night
 ORDER BY
    row_number_rank;            