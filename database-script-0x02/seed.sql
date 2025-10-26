INSERT INTO user(email, first_name, last_name, password_hash, phone_number, role)VALUES 
('martinwere14@gmail.com', 'Martin', 'Owino', 'Kenya@123', '+254797782614', 'admin'),
('gloriuswanja@gmail.com', 'Glorius', 'Wanja', 'Kenya@123', '+254712345678', 'host'),
('johndoe@gmail.com', 'John', 'Doe', 'Kenya@123', '+254712345679', 'guest');

INSERT INTO properties(host_id, name, description, location, price_per_night)
SELECT user_id, 'Cozy Cottage', 'A cozy cottage in the countryside.', 'Nairobi, Kenya', 75.00
FROM user WHERE email = 'martinwere14@gmail.com';
UNION ALL
SELECT user_id, 'Modern Apartment', 'A modern apartment in the city center,', 'Mombasa, Kenya', 120.00
FROM user WHERE email = 'gloriuswanja@gmail.com';

INSERT INTO bookings(property_id, guest_id, start_date, end_date, total_price, status)
SELECT 
     P.property_id ,
     U.user_id,
        '2024-07-01',
        '2024-07-05',
        300.00,
        'confirmed'
        FROM properties p 
        JOIN users u ON u.email = 'johndoe@gmail.com'
        WHERE p.name = 'Cozy Cottage';

INSERT INTO reviews(property_id, user_id, rating, comment)
SELECT 
      P.property_id,
      U.user_id,
      5,
      'Amazing stay! Highly recommend.'
      FROM properties p 
      JOIN users u ON u.email = 'johndoe@gmail.com'
      WHERE p.name ='Cozy Cottage';

INSERT INTO messages(sender_id, recepient_id, message_body)
        