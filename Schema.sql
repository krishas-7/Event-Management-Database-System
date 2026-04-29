-- Event Management Database System
-- Schema — Create Tables 

CREATE TABLE Venues (
    VenueID   INT PRIMARY KEY,
    VenueName VARCHAR(100) NOT NULL,
    Location  VARCHAR(100) NOT NULL,
    Capacity  INT NOT NULL
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    VenueID   INT,
    EventDate DATE NOT NULL,
    BookedBy  VARCHAR(100),
    Status    VARCHAR(50),
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);

CREATE TABLE Sponsors (
    SponsorID   INT PRIMARY KEY,
    SponsorName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Programs (
    ProgramID   INT PRIMARY KEY,
    BookingID   INT,
    ProgramName VARCHAR(100) NOT NULL,
    StartTime   TIME NOT NULL,
    Duration    INT NOT NULL, -- Duration in minutes
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE EventSponsors (
    BookingID INT,
    SponsorID INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (SponsorID) REFERENCES Sponsors(SponsorID),
    PRIMARY KEY (BookingID, SponsorID)
);