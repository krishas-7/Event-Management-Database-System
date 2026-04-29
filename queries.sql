-- Event Management Database System
-- Reporting & Analysis Queries


-- ── 1. View all tables ──────────────────────────────────────
SELECT * FROM Venues;
SELECT * FROM Bookings;
SELECT * FROM Sponsors;
SELECT * FROM Programs;
SELECT * FROM EventSponsors;

-- ── 2. All confirmed bookings with venue details ─────────────
SELECT 
    b.BookingID,
    v.VenueName,
    v.Location,
    v.Capacity,
    b.EventDate,
    b.BookedBy,
    b.Status
FROM Bookings b
JOIN Venues v ON b.VenueID = v.VenueID
WHERE b.Status = 'Confirmed'
ORDER BY b.EventDate;

-- ── 3. All programs with their booking and venue info ────────
SELECT 
    p.ProgramName,
    p.StartTime,
    p.Duration AS Duration_Minutes,
    b.EventDate,
    v.VenueName,
    b.BookedBy
FROM Programs p
JOIN Bookings b ON p.BookingID = b.BookingID
JOIN Venues v ON b.VenueID = v.VenueID
ORDER BY b.EventDate, p.StartTime;

-- ── 4. Sponsors for each event (many-to-many join) ───────────
SELECT 
    b.BookingID,
    v.VenueName,
    b.EventDate,
    b.BookedBy,
    s.SponsorName,
    s.ContactInfo
FROM EventSponsors es
JOIN Bookings b ON es.BookingID = b.BookingID
JOIN Venues v ON b.VenueID = v.VenueID
JOIN Sponsors s ON es.SponsorID = s.SponsorID
ORDER BY b.BookingID;

-- ── 5. Number of bookings per venue ─────────────────────────
SELECT 
    v.VenueName,
    v.Capacity,
    COUNT(b.BookingID) AS TotalBookings
FROM Venues v
LEFT JOIN Bookings b ON v.VenueID = b.VenueID
GROUP BY v.VenueID, v.VenueName, v.Capacity
ORDER BY TotalBookings DESC;

-- ── 6. Total programs per booking ───────────────────────────
SELECT 
    b.BookingID,
    b.BookedBy,
    v.VenueName,
    COUNT(p.ProgramID) AS TotalPrograms,
    SUM(p.Duration) AS TotalDuration_Minutes
FROM Bookings b
JOIN Venues v ON b.VenueID = v.VenueID
LEFT JOIN Programs p ON b.BookingID = p.BookingID
GROUP BY b.BookingID, b.BookedBy, v.VenueName
ORDER BY TotalPrograms DESC;

-- ── 7. Venues with capacity > 500 that have bookings ────────
SELECT 
    v.VenueName,
    v.Capacity,
    v.Location,
    b.EventDate,
    b.Status
FROM Venues v
JOIN Bookings b ON v.VenueID = b.VenueID
WHERE v.Capacity > 500
ORDER BY v.Capacity DESC;

-- ── 8. Bookings with no sponsor assigned ────────────────────
SELECT 
    b.BookingID,
    b.BookedBy,
    v.VenueName,
    b.EventDate
FROM Bookings b
JOIN Venues v ON b.VenueID = v.VenueID
LEFT JOIN EventSponsors es ON b.BookingID = es.BookingID
WHERE es.SponsorID IS NULL;

-- ── 9. Sponsors supporting multiple events ───────────────────
SELECT 
    s.SponsorName,
    COUNT(es.BookingID) AS EventsSponsored
FROM Sponsors s
JOIN EventSponsors es ON s.SponsorID = es.SponsorID
GROUP BY s.SponsorID, s.SponsorName
HAVING COUNT(es.BookingID) > 1;

-- ── 10. Full event report — venue + programs + sponsors ──────
SELECT 
    b.BookingID,
    v.VenueName,
    b.EventDate,
    b.BookedBy,
    b.Status,
    p.ProgramName,
    p.StartTime,
    p.Duration AS Duration_Minutes,
    s.SponsorName
FROM Bookings b
JOIN Venues v ON b.VenueID = v.VenueID
LEFT JOIN Programs p ON b.BookingID = p.BookingID
LEFT JOIN EventSponsors es ON b.BookingID = es.BookingID
LEFT JOIN Sponsors s ON es.SponsorID = s.SponsorID
ORDER BY b.EventDate, p.StartTime;