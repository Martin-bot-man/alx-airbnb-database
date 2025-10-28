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
