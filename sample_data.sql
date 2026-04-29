-- Event Management Database System
-- Sample Data — Insert Queries
 

-- Venues
INSERT INTO Venues VALUES (1,  'Grand Auditorium',    '123 Main St, City',    500);
INSERT INTO Venues VALUES (2,  'City Hall',            '456 Elm St, City',     300);
INSERT INTO Venues VALUES (3,  'Convention Center',    '789 Maple Ave, City', 1000);
INSERT INTO Venues VALUES (4,  'Outdoor Stadium',      '101 Oak St, City',    2000);
INSERT INTO Venues VALUES (5,  'Art Gallery',          '202 Pine St, City',    150);
INSERT INTO Venues VALUES (6,  'Community Center',     '303 Cedar St, City',   400);
INSERT INTO Venues VALUES (7,  'Cultural Plaza',       '404 Birch St, City',   600);
INSERT INTO Venues VALUES (8,  'Township Park',        '505 Walnut St, City',  800);
INSERT INTO Venues VALUES (9,  'Riverfront Pavilion',  '606 Pine Ave, City',   350);
INSERT INTO Venues VALUES (10, 'Theater Royale',       '707 Maple St, City',   700);

-- Bookings
INSERT INTO Bookings VALUES (1,  1, '2024-11-15', 'John Doe',        'Confirmed');
INSERT INTO Bookings VALUES (2,  2, '2024-12-01', 'Jane Smith',      'Pending');
INSERT INTO Bookings VALUES (3,  3, '2024-11-20', 'Mike Johnson',    'Confirmed');
INSERT INTO Bookings VALUES (4,  4, '2024-12-05', 'Emily Clark',     'Cancelled');
INSERT INTO Bookings VALUES (5,  5, '2024-11-25', 'James Brown',     'Confirmed');
INSERT INTO Bookings VALUES (6,  1, '2024-12-10', 'Linda White',     'Pending');
INSERT INTO Bookings VALUES (7,  6, '2024-11-30', 'Robert Green',    'Confirmed');
INSERT INTO Bookings VALUES (8,  7, '2024-12-15', 'Patricia Black',  'Confirmed');
INSERT INTO Bookings VALUES (9,  8, '2024-12-20', 'Michael Adams',   'Pending');
INSERT INTO Bookings VALUES (10, 9, '2024-12-25', 'Elizabeth Moore', 'Confirmed');

-- Sponsors
INSERT INTO Sponsors VALUES (1,  'Tech Innovations',  'contact@techinnovations.com');
INSERT INTO Sponsors VALUES (2,  'Music Lovers',       'info@musiclovers.com');
INSERT INTO Sponsors VALUES (3,  'Artistry Co.',       'support@artistryco.com');
INSERT INTO Sponsors VALUES (4,  'Culinary Delight',   'hello@culinarydelight.com');
INSERT INTO Sponsors VALUES (5,  'Eco-Friendly Goods', 'contact@ecofriendly.com');
INSERT INTO Sponsors VALUES (6,  'Health & Wellness',  'wellness@health.com');
INSERT INTO Sponsors VALUES (7,  'Sports League',      'info@sportsleague.com');
INSERT INTO Sponsors VALUES (8,  'Travel Adventures',  'contact@traveladventures.com');
INSERT INTO Sponsors VALUES (9,  'Book Publishers',    'support@bookpublishers.com');
INSERT INTO Sponsors VALUES (10, 'Local Farms',        'info@localfarms.com');

-- Programs
INSERT INTO Programs VALUES (1,  1, 'Keynote Speech',        '10:00:00',  60);
INSERT INTO Programs VALUES (2,  1, 'Panel Discussion',      '11:30:00',  90);
INSERT INTO Programs VALUES (3,  2, 'Live Music',            '18:00:00', 120);
INSERT INTO Programs VALUES (4,  3, 'Art Exhibition',        '14:00:00', 180);
INSERT INTO Programs VALUES (5,  4, 'Outdoor Concert',       '17:00:00', 150);
INSERT INTO Programs VALUES (6,  5, 'Cooking Demonstration', '15:00:00',  90);
INSERT INTO Programs VALUES (7,  6, 'Yoga Session',          '09:00:00',  60);
INSERT INTO Programs VALUES (8,  7, 'Health Talk',           '11:00:00',  45);
INSERT INTO Programs VALUES (9,  8, 'Sports Clinic',         '16:00:00', 120);
INSERT INTO Programs VALUES (10, 9, 'Book Signing',          '13:00:00',  90);

-- EventSponsors (Many-to-Many Junction Table)
INSERT INTO EventSponsors VALUES (1, 1);
INSERT INTO EventSponsors VALUES (1, 2);
INSERT INTO EventSponsors VALUES (2, 3);
INSERT INTO EventSponsors VALUES (3, 4);
INSERT INTO EventSponsors VALUES (4, 5);
INSERT INTO EventSponsors VALUES (5, 6);
INSERT INTO EventSponsors VALUES (6, 7);
INSERT INTO EventSponsors VALUES (7, 8);
INSERT INTO EventSponsors VALUES (8, 9);
INSERT INTO EventSponsors VALUES (9, 10);