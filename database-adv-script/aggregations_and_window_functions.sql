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