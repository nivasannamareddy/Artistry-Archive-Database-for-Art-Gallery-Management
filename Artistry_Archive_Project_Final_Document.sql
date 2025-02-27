-- Artistry Archive Database for Art Gallery Management
-- DROP DATABASE IF EXISTS Artistry_Archive;
CREATE DATABASE IF NOT EXISTS Artistry_Archive;
USE Artistry_Archive;
SHOW tables;

-- Table: Artists
-- Purpose: Stores information about artists, including personal details, biography, and contact information.
CREATE TABLE IF NOT EXISTS Artists (
    ArtistID INT PRIMARY KEY AUTO_INCREMENT,                     -- Unique identifier for each artist
    FirstName VARCHAR(255) NOT NULL,                             -- First name of the artist
    LastName VARCHAR(255) NOT NULL,                              -- Last name of the artist
    DOB DATE NOT NULL,               							-- Date of birth
    Nationality VARCHAR(100) NOT NULL,                           -- Nationality of the artist
    Bio TEXT,                                                    -- Biography or additional information about the artist
    ContactInfo VARCHAR(255) CHECK (ContactInfo REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')
                                                                 -- Validates that ContactInfo is in a proper email format
);

INSERT INTO Artists (FirstName, LastName, DOB, Nationality, Bio, ContactInfo) VALUES
('John', 'Doe', '1985-06-15', 'American', 'A contemporary artist known for abstract paintings.', 'john.doe@example.com'),
('Jane', 'Smith', '1990-02-20', 'British', 'Specializes in modern sculptures.', 'jane.smith@example.com'),
('Alice', 'Johnson', '1988-11-05', 'Canadian', 'A painter who captures nature in her works.', 'alice.johnson@example.com'),
('Bob', 'Brown', '1975-09-25', 'Australian', 'Known for his innovative mixed media art.', 'bob.brown@example.com'),
('Emily', 'Davis', '1992-03-30', 'American', 'Focuses on photography and digital art.', 'emily.davis@example.com'),
('Michael', 'Wilson', '1980-01-12', 'New Zealander', 'A renowned installation artist.', 'michael.wilson@example.com'),
('Emma', 'Garcia', '1983-07-19', 'Mexican', 'Creates vibrant murals and street art.', 'emma.garcia@example.com'),
('Liam', 'Martinez', '1986-05-10', 'Spanish', 'A versatile artist with a passion for ceramics.', 'liam.martinez@example.com'),
('Olivia', 'Anderson', '1995-12-22', 'American', 'Focuses on video art and performance.', 'olivia.anderson@example.com'),
('Noah', 'Taylor', '1991-04-18', 'British', 'Known for minimalist art and design.', 'noah.taylor@example.com'),
('Sophia', 'Thomas', '1987-08-14', 'French', 'A contemporary artist specializing in prints.', 'sophia.thomas@example.com'),
('Lucas', 'Hernandez', '1982-10-29', 'Argentinian', 'Famous for his landscape paintings.', 'lucas.hernandez@example.com'),
('Mia', 'Clark', '1994-07-06', 'Canadian', 'An artist exploring themes of identity.', 'mia.clark@example.com'),
('Ethan', 'Lewis', '1978-02-01', 'American', 'Creates interactive digital installations.', 'ethan.lewis@example.com'),
('Isabella', 'Walker', '1993-09-17', 'British', 'A talented young artist in contemporary art.', 'isabella.walker@example.com'),
('Aiden', 'Hall', '1984-03-03', 'Australian', 'Specializes in abstract photography.', 'aiden.hall@example.com'),
('Charlotte', 'Allen', '1990-11-11', 'New Zealander', 'An artist known for her textile art.', 'charlotte.allen@example.com'),
('James', 'Young', '1989-05-28', 'Mexican', 'Focuses on street art and graffiti.', 'james.young@example.com'),
('Amelia', 'King', '1981-04-04', 'Spanish', 'A traditional painter with a modern twist.', 'amelia.king@example.com'),
('Alexander', 'Wright', '1992-12-08', 'American', 'Known for his large-scale installations.', 'alexander.wright@example.com'),
('Harper', 'Scott', '1995-01-21', 'French', 'An artist exploring digital landscapes.', 'harper.scott@example.com');
select * from artists;

-- Table: Artworks
-- Purpose: Stores information about artworks, including details about the artist, creation date, medium, and current status.
CREATE TABLE IF NOT EXISTS Artworks (
    ArtworkID INT PRIMARY KEY AUTO_INCREMENT,                     -- Unique identifier for each artwork
    Title VARCHAR(255) NOT NULL,                                  -- Title of the artwork
    ArtistID INT NOT NULL,                                        -- References the unique ID of the artist
    YearCreated YEAR NOT NULL ,                                   -- Year the artwork was created
    ArtMedium VARCHAR(100) NOT NULL,                              -- Medium of the artwork, e.g., Oil, Acrylic, Sculpture
    Dimensions VARCHAR(100),                                      -- Dimensions of the artwork, e.g., "20x30 inches"
    Price DECIMAL(10, 2) CHECK (Price >= 0),                      -- Price of the artwork, must be non-negative
    ArtDescription TEXT,                                          -- Description of the artwork
    ArtStatus ENUM('available', 'sold', 'on display') DEFAULT 'available', 
                                                                  -- Status of the artwork, defaults to 'available'
    -- Foreign key constraint to maintain referential integrity
    FOREIGN KEY (ArtistID) 
        REFERENCES Artists(ArtistID) 
        ON DELETE CASCADE                                         -- Cascades deletion if the related artist is deleted
);

INSERT INTO Artworks (Title, ArtistID, YearCreated, ArtMedium, Dimensions, Price, ArtDescription, ArtStatus) VALUES
('Abstract Dreams', 1, 2020, 'Oil Painting', '24x36 inches', 1200.00, 'A captivating blend of colors and shapes.', 'available'),
('Sculpture of Hope', 2, 2019, 'Sculpture', '3x5 feet', 4500.00, 'A modern take on resilience.', 'sold'),
('Nature’s Canvas', 3, 2021, 'Acrylic', '30x40 inches', 1500.00, 'Capturing the beauty of the outdoors.', 'available'),
('Fusion', 4, 2022, 'Mixed Media', '5x7 feet', 3000.00, 'A mixture of various art forms.', 'on display'),
('Ethereal Light', 5, 2020, 'Photography', '20x30 inches', 800.00, 'An exploration of light and shadows.', 'available'),
('The Depths', 6, 2018, 'Installation', 'Variable', 20000.00, 'An immersive experience.', 'on display'),
('Vibrant Streets', 7, 2021, 'Mural', 'Wall Size', 0.00, 'A tribute to urban life.', 'available'),
('Ceramic Elegance', 8, 2022, 'Ceramics', 'Variable', 500.00, 'Handcrafted ceramic art.', 'available'),
('Digital Horizon', 9, 2023, 'Digital Art', 'Screen Size', 150.00, 'A view into the future.', 'available'),
('Minimalism', 10, 2019, 'Canvas', '18x24 inches', 600.00, 'A study in simplicity.', 'sold'),
('Landscapes of Time', 11, 2020, 'Oil Painting', '36x48 inches', 2500.00, 'Capturing time and nature.', 'available'),
('Cultural Threads', 12, 2021, 'Textile', 'Variable', 1200.00, 'A representation of cultural diversity.', 'on display'),
('Whispers', 14, 2020, 'Watercolor', '16x20 inches', 700.00, 'A gentle representation of emotions.', 'available'),
('Echoes', 15, 2021, 'Digital Installation', 'Variable', 3500.00, 'An auditory visual experience.', 'on display'),
('Abstract Reflections', 16, 2020, 'Acrylic', '30x40 inches', 1300.00, 'Reflection on modern life.', 'available'),
('Nature’s Symphony', 17, 2019, 'Photography', '20x30 inches', 1000.00, 'A harmonious capture of nature.', 'available'),
('Pastel Dreams', 18, 2021, 'Pastel', '24x36 inches', 1100.00, 'Dreamy landscapes in pastel colors.', 'sold'),
('Light and Shadow', 19, 2022, 'Mixed Media', '36x48 inches', 2200.00, 'The interplay of light and dark.', 'available'),
('Journey', 20, 2023, 'Oil Painting', '18x24 inches', 1400.00, 'A journey through color and texture.', 'available');
select * from artworks;

-- Table: Exhibitions
-- Purpose: Stores information about exhibitions, including names, dates, venues, and descriptions.
CREATE TABLE IF NOT EXISTS Exhibitions (
    ExhibitionID INT PRIMARY KEY AUTO_INCREMENT,                 -- Unique identifier for each exhibition
    ExhibitionName VARCHAR(255) NOT NULL,                        -- Name of the exhibition
    StartDate DATE NOT NULL,        							-- Start date of the exhibition; 
    EndDate DATE NOT NULL,                                       -- End date of the exhibition
    Venue VARCHAR(255) NOT NULL,                                 -- Location where the exhibition is held
    ArtDescription TEXT                                          -- General description or additional information about the exhibition
);

INSERT INTO Exhibitions (ExhibitionName, StartDate, EndDate, Venue, ArtDescription) VALUES
('Contemporary Visions', '2023-01-15', '2023-03-15', 'Art Gallery One', 'An exhibition showcasing modern art.'),
('Nature in Focus', '2023-04-10', '2023-06-10', 'Nature Center', 'Capturing the essence of nature through art.'),
('Urban Expressions', '2023-07-05', '2023-09-05', 'City Art Space', 'Art inspired by urban life.'),
('Timeless Classics', '2023-10-01', '2023-11-30', 'Historical Museum', 'A look at classic art through the ages.'),
('Art and Technology', '2023-12-15', '2024-02-15', 'Tech Center', 'Exploring the intersection of art and technology.'),
('Emerging Artists', '2024-03-01', '2024-05-01', 'Community Center', 'Spotlighting new talent in the art world.'),
('Cultural Heritage', '2024-06-01', '2024-08-01', 'Cultural Center', 'Celebrating diverse cultures through art.'),
('The Beauty of Abstraction', '2024-09-01', '2024-11-01', 'Modern Art Museum', 'A showcase of abstract art.'),
('The Power of Color', '2024-12-01', '2025-02-01', 'Art Plaza', 'Exploring the impact of color in art.'),
('Artists in Residence', '2025-03-01', '2025-05-01', 'Creative Space', 'An exhibition featuring works from artists in residence.'),
('Whimsical Worlds', '2025-06-01', '2025-08-01', 'Fantasy Art Gallery', 'A journey through imaginative art.'),
('Global Art Perspectives', '2025-09-01', '2025-11-01', 'International Art Center', 'Art from around the globe.'),
('Seasonal Inspirations', '2025-12-01', '2026-02-01', 'Art in the Park', 'Art inspired by the seasons.'),
('Art for Change', '2026-03-01', '2026-05-01', 'Activist Center', 'Art that promotes social change.'),
('The Narrative in Art', '2026-06-01', '2026-08-01', 'Storytellers Gallery', 'Exploring storytelling through visual art.'),
('Retro Revival', '2026-09-01', '2026-11-01', 'Vintage Gallery', 'A look back at retro art styles.'),
('Art and Emotion', '2026-12-01', '2027-02-01', 'Emotional Space', 'How art expresses emotions.'),
('Interactive Art', '2027-03-01', '2027-05-01', 'Interactive Center', 'Art you can touch and interact with.'),
('Art Beyond Borders', '2027-06-01', '2027-08-01', 'Global Gallery', 'A celebration of international art.'),
('Sustainable Art', '2027-09-01', '2027-11-01', 'Eco Center', 'Art that promotes sustainability.'),
('Future Visions', '2027-12-01', '2028-02-01', 'Futuristic Art Space', 'Imagining the future through art.');
select * from exhibitions;

-- Table: Exhibition_Artworks
-- Purpose: Establishes a many-to-many relationship between Exhibitions and Artworks,
--          ensuring that each artwork can be associated with multiple exhibitions and
--          each exhibition can feature multiple artworks.
CREATE TABLE IF NOT EXISTS Exhibition_Artworks (
    ExhibitionID INT NOT NULL,                 -- References the unique ID of an exhibition
    ArtworkID INT NOT NULL,                    -- References the unique ID of an artwork
    -- Foreign key constraints to maintain referential integrity
    FOREIGN KEY (ExhibitionID) 
        REFERENCES Exhibitions(ExhibitionID) 
        ON DELETE CASCADE,                     -- Automatically removes links if an exhibition is deleted
    FOREIGN KEY (ArtworkID) 
        REFERENCES Artworks(ArtworkID) 
        ON DELETE CASCADE,                     -- Automatically removes links if an artwork is deleted
    -- Composite primary key to ensure each (ExhibitionID, ArtworkID) combination is unique
    PRIMARY KEY (ExhibitionID, ArtworkID)
);

INSERT IGNORE INTO Exhibition_Artworks (ExhibitionID, ArtworkID) VALUES 
(1, 1), (2, 3), (3, 4), (4, 5), (5, 6), 
(6, 7), (7, 8), (8, 9), (9, 11), (10, 12), 
(11, 13), (12, 14), (13, 15), (14, 16), (15, 18), 
(16, 19), (17, 18), (18, 11), (19, 5), (20, 14), 
(21, 6), (12, 9);
select * from Exhibition_Artworks;

-- Table: Customers
-- Purpose: Stores information about customers, including contact details and preferences.
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,             -- Unique identifier for each customer
    FirstName VARCHAR(255) NOT NULL,                       -- Customer's first name
    LastName VARCHAR(255) NOT NULL,                        -- Customer's last name
    Email VARCHAR(255) NOT NULL UNIQUE,                    -- Customer's email address, must be unique
    PhoneNumber VARCHAR(50) CHECK (PhoneNumber REGEXP '^[0-9-+() ]+$'), -- Basic format check for phone number
    Address VARCHAR(255),                                  -- Customer's mailing address
    PreferredArtStyle VARCHAR(100)                         -- Art style preference for targeted recommendations
);

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, PreferredArtStyle) VALUES
('Alice', 'Wright', 'alice.wright@example.com', '555-1234', '123 Elm St, Springfield', 'Abstract'),
('John', 'Doe', 'john.doe@example.com', '555-5678', '456 Oak St, Springfield', 'Modern'),
('Emily', 'Clark', 'emily.clark@example.com', '555-8765', '789 Pine St, Springfield', 'Contemporary'),
('James', 'Smith', 'james.smith@example.com', '555-4321', '321 Maple St, Springfield', 'Classic'),
('Sophia', 'Johnson', 'sophia.johnson@example.com', '555-1357', '654 Cedar St, Springfield', 'Pop Art'),
('Liam', 'Brown', 'liam.brown@example.com', '555-2468', '159 Birch St, Springfield', 'Digital'),
('Mia', 'Davis', 'mia.davis@example.com', '555-3698', '753 Willow St, Springfield', 'Photography'),
('Noah', 'Martinez', 'noah.martinez@example.com', '555-7890', '258 Fir St, Springfield', 'Sculpture'),
('Olivia', 'Garcia', 'olivia.garcia@example.com', '555-1358', '951 Spruce St, Springfield', 'Mixed Media'),
('Ethan', 'Hernandez', 'ethan.hernandez@example.com', '555-2469', '753 Chestnut St, Springfield', 'Installation'),
('Isabella', 'Lee', 'isabella.lee@example.com', '555-3579', '852 Dogwood St, Springfield', 'Ceramics'),
('Aiden', 'Walker', 'aiden.walker@example.com', '555-4680', '951 Redwood St, Springfield', 'Street Art'),
('Charlotte', 'Young', 'charlotte.young@example.com', '555-5791', '147 Ash St, Springfield', 'Graffiti'),
('Alexander', 'King', 'alexander.king@example.com', '555-6802', '258 Hemlock St, Springfield', 'Art Nouveau'),
('Harper', 'Scott', 'harper.scott@example.com', '555-7913', '369 Larch St, Springfield', 'Impressionism'),
('Lucas', 'Robinson', 'lucas.robinson@example.com', '555-8024', '456 Maple St, Springfield', 'Surrealism'),
('Amelia', 'Lee', 'amelia.lee@example.com', '555-9135', '567 Oak St, Springfield', 'Expressionism'),
('William', 'Moore', 'william.moore@example.com', '555-0246', '678 Elm St, Springfield', 'Conceptual'),
('Ella', 'Taylor', 'ella.taylor@example.com', '555-1357', '789 Pine St, Springfield', 'Folk Art'),
('Chloe', 'Anderson', 'chloe.anderson@example.com', '555-2468', '890 Cedar St, Springfield', 'Naïve Art');
select * from customers;

-- Table: Sales
-- Purpose: Records the sale transactions of artworks to customers, including payment and invoice details.
CREATE TABLE IF NOT EXISTS Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,               -- Unique identifier for each sale
    CustomerID INT NOT NULL,                             -- References unique customer in the Customers table
    ArtworkID INT NOT NULL,                              -- References unique artwork in the Artworks table
    SaleDate DATE NOT NULL,                              -- Date of sale
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),    -- Sale price, must be non-negative
    PaymentMethod ENUM('credit card', 'cash') NOT NULL,  -- Payment method, restricted to specified options
    InvoiceNumber VARCHAR(255) UNIQUE,                   -- Unique invoice identifier for the sale
    -- Foreign key constraints to maintain referential integrity
    FOREIGN KEY (CustomerID) 
        REFERENCES Customers(CustomerID) 
        ON DELETE CASCADE,                               -- Deletes sale records if the customer is delete
    FOREIGN KEY (ArtworkID) 
        REFERENCES Artworks(ArtworkID) 
        ON DELETE CASCADE                                -- Deletes sale records if the artwork is deleted
);

INSERT INTO Sales (CustomerID, ArtworkID, SaleDate, Price, PaymentMethod, InvoiceNumber) VALUES
(11, 1, '2023-01-20', 1200.00, 'credit card', 'INV001'),
(12, 2, '2023-02-15', 4500.00, 'cash', 'INV002'),
(13, 3, '2023-03-10', 1500.00, 'credit card', 'INV003'),
(14, 4, '2023-04-05', 3000.00, 'cash', 'INV004'),
(15, 5, '2023-05-30', 800.00, 'credit card', 'INV005'),
(16, 6, '2023-06-12', 20000.00, 'cash', 'INV006'),
(17, 7, '2023-07-18', 500.00, 'credit card', 'INV007'),
(18, 8, '2023-08-22', 150.00, 'cash', 'INV008'),
(19, 9, '2023-09-01', 600.00, 'credit card', 'INV009'),
(20, 10, '2023-10-14', 2500.00, 'cash', 'INV010'),
(1, 11, '2023-11-01', 1200.00, 'credit card', 'INV011'),
(2, 12, '2023-11-18', 1200.00, 'cash', 'INV012'),
(3, 1, '2023-12-12', 900.00, 'credit card', 'INV013'),
(4, 14, '2023-12-25', 700.00, 'cash', 'INV014'),
(5, 15, '2023-01-02', 3500.00, 'credit card', 'INV015'),
(6, 16, '2023-01-19', 1300.00, 'cash', 'INV016'),
(7, 17, '2023-02-14', 1000.00, 'credit card', 'INV017'),
(8, 18, '2023-03-20', 1100.00, 'cash', 'INV018'),
(9, 19, '2023-04-30', 2200.00, 'credit card', 'INV019'),
(10, 14, '2023-05-15', 1400.00, 'cash', 'INV020');
select * from sales;

-- Table: Galleries
-- Purpose: Stores information about galleries, including location, ownership, and contact details.
CREATE TABLE IF NOT EXISTS Galleries (
    GalleryID INT PRIMARY KEY AUTO_INCREMENT,               -- Unique identifier for each gallery
    GalleryName VARCHAR(255) NOT NULL UNIQUE,               -- Gallery name, must be unique to prevent duplicates
    Location VARCHAR(255) NOT NULL,                         -- Physical address or location of the gallery
    GalleryOwner VARCHAR(255),                                     -- Name of the gallery owner or primary contact
    ContactInfo VARCHAR(255) NOT NULL CHECK (ContactInfo REGEXP '^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$' 
                                            OR ContactInfo REGEXP '^[0-9-+() ]+$')  -- Validates ContactInfo as either email or phone format
                                                            
);

INSERT INTO Galleries (GalleryName, Location, GalleryOwner, ContactInfo) VALUES
('Art Gallery One', 'Downtown', 'John Smith', 'john.smith@example.com'),
('Modern Art Museum', 'City Center', 'Jane Doe', 'jane.doe@example.com'),
('Heritage Gallery', 'Old Town', 'Alice Johnson', 'alice.johnson@example.com'),
('Creative Space', 'East Side', 'Bob Brown', 'bob.brown@example.com'),
('Cultural Center', 'West End', 'Emily Davis', 'emily.davis@example.com'),
('The Art Hub', 'North District', 'Michael Wilson', 'michael.wilson@example.com'),
('Exhibition House', 'South Avenue', 'Emma Garcia', 'emma.garcia@example.com'),
('Art Loft', 'Market Square', 'Liam Martinez', 'liam.martinez@example.com'),
('Gallery of Dreams', 'Riverfront', 'Olivia Anderson', 'olivia.anderson@example.com'),
('Urban Art Gallery', 'Warehouse District', 'Noah Taylor', 'noah.taylor@example.com'),
('The Gallery Space', 'Main Street', 'Sophia Thomas', 'sophia.thomas@example.com'),
('Civic Art Center', 'Civic Square', 'Lucas Hernandez', 'lucas.hernandez@example.com'),
('Art & Soul', 'Neighborhood', 'Mia Clark', 'mia.clark@example.com'),
('Art Oasis', 'Park Lane', 'Ethan Lewis', 'ethan.lewis@example.com'),
('The Palette', 'Art District', 'Isabella Walker', 'isabella.walker@example.com'),
('Gallery at the Park', 'Green Space', 'Aiden Hall', 'aiden.hall@example.com'),
('Gallery X', 'City Park', 'Charlotte Allen', 'charlotte.allen@example.com'),
('The Open Canvas', 'Creative Block', 'James Young', 'james.young@example.com'),
('Visions Art Gallery', 'Cultural Block', 'Amelia King', 'amelia.king@example.com'),
('Spectrum Gallery', 'Art Corridor', 'Alexander Wright', 'alexander.wright@example.com');
select * from galleries;

-- Table: Employees
-- Purpose: Stores information about employees, including their position, hire date, and salary details.
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,              -- Unique identifier for each employee
    FirstName VARCHAR(255) NOT NULL,                        -- Employee's first name
    LastName VARCHAR(255) NOT NULL,                         -- Employee's last name
    Position VARCHAR(100) NOT NULL,                         -- Job position of the employee
    HireDate DATE NOT NULL ,                                -- Date of hire
    Salary DECIMAL(10, 2) NOT NULL CHECK (Salary >= 0),     -- Salary amount, must be non-negative
    CHECK (Position <> '')                                  -- Ensures Position is not an empty string
);

INSERT INTO Employees (FirstName, LastName, Position, HireDate, Salary) VALUES
('Sarah', 'Jones', 'Curator', '2020-01-10', 55000.00),
('Mark', 'Wilson', 'Sales Representative', '2019-03-15', 45000.00),
('Laura', 'Smith', 'Manager', '2021-02-20', 70000.00),
('Kevin', 'Brown', 'Technician', '2022-04-05', 40000.00),
('Jessica', 'Taylor', 'Exhibition Coordinator', '2018-11-01', 48000.00),
('Daniel', 'Miller', 'Security', '2023-06-01', 35000.00),
('Rachel', 'Davis', 'Marketing Specialist', '2021-05-10', 60000.00),
('Matthew', 'Hernandez', 'Events Manager', '2019-07-22', 50000.00),
('Nicole', 'Garcia', 'Sales Representative', '2020-09-15', 45000.00),
('Brian', 'Martinez', 'Curator', '2018-10-10', 55000.00),
('Sophia', 'Moore', 'Technician', '2022-08-15', 40000.00),
('David', 'Clark', 'Exhibition Coordinator', '2021-01-20', 48000.00),
('Megan', 'Lee', 'Marketing Specialist', '2023-02-01', 60000.00),
('Jason', 'Walker', 'Security', '2022-05-25', 35000.00),
('Emily', 'Johnson', 'Sales Representative', '2020-04-20', 45000.00),
('Ethan', 'White', 'Manager', '2023-03-15', 70000.00),
('Ashley', 'Taylor', 'Events Manager', '2019-12-12', 50000.00),
('Matthew', 'Young', 'Curator', '2020-08-10', 55000.00),
('Charlotte', 'King', 'Sales Representative', '2021-09-30', 45000.00),
('Daniel', 'Harris', 'Technician', '2022-07-05', 40000.00),
('Isabella', 'Scott', 'Exhibition Coordinator', '2023-01-15', 48000.00);
select * from employees;

-- Table: Employee_Schedules
-- Purpose: Tracks employee assignments to exhibitions, including the shift times and roles.
CREATE TABLE IF NOT EXISTS Employee_Schedules (
    EmployeeID INT NOT NULL,                       -- Foreign key referencing Employees table
    ExhibitionID  INT NOT NULL,                    -- Foreign key referencing Exhibitions table
    ShiftTime TIMESTAMP NOT NULL,                  -- Scheduled shift time for the employee
    EmployeeRole VARCHAR(100) NOT NULL,            -- Role assigned to the employee during the exhibition
    -- Define foreign key relationship with Employees table
     FOREIGN KEY (EmployeeID) 
        REFERENCES Employees(EmployeeID) 
        ON DELETE CASCADE,
    -- Define foreign key relationship with Exhibitions table
     FOREIGN KEY (ExhibitionID) 
        REFERENCES Exhibitions(ExhibitionID) 
        ON DELETE CASCADE,
    -- Define composite primary key to ensure unique assignments
    PRIMARY KEY (EmployeeID, ExhibitionID)
);

INSERT INTO Employee_Schedules (EmployeeID, ExhibitionID, ShiftTime, EmployeeRole) VALUES 
(1, 20, '2024-01-15 09:00:00', 'Curator'),
(2, 18, '2024-01-15 13:00:00', 'Sales Representative'),
(3, 21, '2024-02-10 09:00:00', 'Manager'),
(4, 2, '2024-02-10 13:00:00', 'Technician'),
(5, 3, '2024-02-15 09:00:00', 'Exhibition Coordinator'),
(6, 4, '2024-03-20 12:00:00', 'Security'),
(7, 5, '2024-03-25 14:00:00', 'Marketing Specialist'),
(8, 6, '2024-04-10 08:00:00', 'Events Manager'),
(9, 7, '2024-05-18 10:00:00', 'Sales Represenative'),
(10, 8, '2024-06-01 11:00:00', 'Curator'),
(11, 9, '2024-06-10 09:30:00', 'Technician'),
(12, 10, '2024-07-04 15:00:00', 'Exhibition Coordinator'),
(13, 11, '2024-08-15 13:00:00', 'Marketing Specialist'),
(14, 12, '2024-09-10 12:00:00', 'Security'),
(15, 13, '2024-10-10 08:00:00', 'Sales Representative'),
(16, 14, '2024-11-01 11:00:00', 'Manager'),
(17, 15, '2024-11-05 09:00:00', 'Events Manager'),
(18, 16, '2024-11-20 13:00:00', 'Curator'),
(19, 17, '2024-12-10 14:30:00', 'Sales Representative'),
(20, 19, '2024-12-15 10:00:00', 'Technician'),
(21,14,'2024-12-15 12:00:00','Exhibition Coordinator'); 
select * from employee_schedules;

-- Table: Reviews
-- Purpose: Stores customer reviews of artworks, including review text, rating, and review date.
CREATE TABLE IF NOT EXISTS Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,    -- Unique identifier for each review
    CustomerID INT NOT NULL,                      -- Foreign key referencing the customer who submitted the review
    ArtworkID INT NOT NULL,                      -- Foreign key referencing the reviewed artwork
    ReviewText TEXT NULL,                          -- Text content of the review (optional)
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5), -- Rating given to the artwork, must be between 1 and 5
    ReviewDate DATE NOT NULL,                      -- Date when the review was submitted
    -- Define foreign key relationship with Customers table
	FOREIGN KEY (CustomerID) 
        REFERENCES Customers(CustomerID) 
        ON DELETE CASCADE,
    -- Define foreign key relationship with Artworks table
	FOREIGN KEY (ArtworkID) 
        REFERENCES Artworks(ArtworkID) 
        ON DELETE CASCADE
);

INSERT INTO Reviews (CustomerID, ArtworkID, ReviewText, Rating, ReviewDate) VALUES
(1, 1, 'A stunning piece of art that captures attention!', 5, '2023-01-25'),
(2, 2, 'Beautiful sculpture with great details.', 4, '2023-02-20'),
(3, 3, 'A must-see for nature lovers!', 5, '2023-03-15'),
(4, 4, 'Innovative and thought-provoking.', 4, '2023-04-10'),
(5, 5, 'The lighting in this photograph is mesmerizing.', 5, '2023-05-05'),
(6, 6, 'An immersive experience that I won’t forget.', 5, '2023-06-15'),
(7, 7, 'Vibrant and lively; captures urban life perfectly.', 4, '2023-07-20'),
(8, 8, 'Beautiful craftsmanship in this ceramic piece.', 5, '2023-08-25'),
(9, 9, 'A thought-provoking digital piece.', 3, '2023-09-15'),
(10, 10, 'Classic and timeless; a fantastic addition!', 5, '2023-10-10'),
(11, 11, 'The colors are stunning and vibrant.', 4, '2023-11-01'),
(12, 12, 'A beautiful representation of culture.', 5, '2023-11-20'),
(13, 13, 'An engaging piece that evokes emotion.', 4, '2023-12-05'),
(14, 14, 'The watercolor technique is impressive!', 5, '2023-12-30'),
(15, 15, 'An auditory visual experience that is unique.', 5, '2024-01-15'),
(16, 16, 'Simple yet captivating.', 4, '2024-02-10'),
(17, 17, 'A perfect blend of art and nature.', 5, '2024-03-15'),
(18, 18, 'Dreamy and ethereal; a lovely piece.', 4, '2024-04-05'),
(19, 19, 'Bold and powerful; a statement piece!', 5, '2024-05-10'),
(20, 15, 'A journey of colors and textures.', 4, '2024-06-01');
select * from reviews;

-- Table: Owning_organization
-- Purpose: Stores information about organizations that own galleries, including their headquarters location,
--          type, contact information, and the galleries they manage.
CREATE TABLE IF NOT EXISTS Owning_organization (
    OrganizationID INT PRIMARY KEY AUTO_INCREMENT,             -- Unique identifier for each organization
    Organization_name VARCHAR(255) NOT NULL UNIQUE,            -- Name of the organization, must be unique
    GalleryID INT NOT NULL,                                    -- References the associated gallery's unique ID
    HQLocation VARCHAR(255) NOT NULL,                          -- Headquarters location of the organization
    TypeofOrganization VARCHAR(100) NOT NULL,                  -- Type of organization (e.g., Museum, Gallery)
    ContactEmail VARCHAR(250) UNIQUE CHECK (ContactEmail REGEXP '^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$'), -- Validates email format
    ContactPhone VARCHAR(250) CHECK (ContactPhone REGEXP '^[0-9-+() ]+$'),                          -- Validates phone format
    EstablishedYear INT CHECK (EstablishedYear >= 1800),  -- Validates a realistic year
    -- Foreign key constraint to maintain referential integrity
    FOREIGN KEY (GalleryID) 
        REFERENCES Galleries(GalleryID) 
        ON DELETE CASCADE                                     -- Cascades deletion if a related gallery is deleted
);

INSERT INTO Owning_organization (Organization_name, GalleryID, HQLocation, TypeofOrganization, ContactEmail, ContactPhone, EstablishedYear) VALUES
('ArtWorld Foundation', 1, 'New York, USA', 'Museum', 'contact@artworld.com', '+1-202-555-0143', 1995),
('Global Vision Gallery', 2, 'London, UK', 'Gallery', 'info@globalvision.com', '+44-20-7946-0958', 2000),
('Royal Heritage Collection', 3, 'Paris, France', 'Private Collector', 'royalheritage@collect.com', '+33-1-4432-5678', 1985),
('Avant-Garde Arts', 4, 'Berlin, Germany', 'Gallery', 'support@avantgarde.com', '+49-30-1234-5678', 2002),
('Old Masters Patrons', 5, 'Rome, Italy', 'Museum', 'patrons@oldmasters.com', '+39-06-455-6789', 1978),
('Urban Art Collective', 6, 'Tokyo, Japan', 'Gallery', 'contact@urbanart.com', '+81-3-5555-1234', 2010),
('Creative Legacy Holdings', 7, 'Los Angeles, USA', 'Private Collector', 'info@creativelegacy.com', '+1-310-555-7890', 2005),
('New Vision Art Hub', 8, 'Sydney, Australia', 'Gallery', 'contact@newvision.com', '+61-2-5555-1234', 2012),
('Cultural Heritage Vault', 9, 'Vienna, Austria', 'Private Collector', 'heritage@vault.com', '+43-1-555-9876', 1990),
('Art Innovators Foundation', 10, 'Toronto, Canada', 'Museum', 'info@artinnovators.com', '+1-416-555-0199', 1998),
('Contemporary Creations Group', 11, 'San Francisco, USA', 'Gallery', 'creations@contemporary.com', '+1-415-555-6789', 2015),
('Modernist Arts Institute', 12, 'Chicago, USA', 'Museum', 'info@modernist.com', '+1-312-555-0167', 1992),
('Urban Culture Collective', 13, 'Mexico City, Mexico', 'Private Collector', 'contact@urbanculture.com', '+52-55-5555-4321', 2001),
('Legacy Art Holdings', 14, 'Moscow, Russia', 'Gallery', 'info@legacyartholdings.com', '+7-495-555-0143', 1999),
('Blue Horizon Art Fund', 15, 'Amsterdam, Netherlands', 'Private Collector', 'support@bluehorizon.com', '+31-20-555-9876', 2003),
('Artistry Foundations', 16, 'Dublin, Ireland', 'Museum', 'info@artistry.com', '+353-1-555-0147', 1994),
('Royal Gallery Patrons', 17, 'Madrid, Spain', 'Gallery', 'contact@royalgallery.com', '+34-91-555-0167', 1987),
('Creative Minds Society', 18, 'Copenhagen, Denmark', 'Gallery', 'info@creativeminds.com', '+45-32-555-9876', 2011),
('Cultural Innovators Group', 19, 'Stockholm, Sweden', 'Museum', 'support@culturalinnovators.com', '+46-8-555-1234', 2008),
('Global Art Connections', 20, 'Seoul, South Korea', 'Private Collector', 'contact@globalartconnections.com', '+82-2-555-6789', 2007);
select * from Owning_organization;
 
-- Table: ArtCategory
-- Purpose: Categorizes artworks by style, period, medium, and origin, linking each category to specific galleries and artists.
CREATE TABLE IF NOT EXISTS ArtCategory (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,               -- Unique identifier for each art category
    CategoryName VARCHAR(255) NOT NULL UNIQUE,               -- Category name, must be unique
    CatDescription TEXT,                                     -- Description of the category
    GalleryID INT,                                           -- References the associated gallery's unique ID
    ArtistID INT,                                            -- References the associated artist's unique ID
    Style VARCHAR(100) NOT NULL,                             -- Style of art (e.g., Abstract, Realism)
    Period VARCHAR(100),                                     -- Art period (e.g., Renaissance, Contemporary)
    ArtMedium VARCHAR(100) NOT NULL,                         -- Medium used (e.g., Oil, Acrylic, Sculpture)
    OriginCountry VARCHAR(100),                              -- Country of origin for the art style
    PopularityRank INT CHECK (PopularityRank > 0),           -- Ranking of popularity, must be a positive integer
    -- Foreign key constraints to maintain referential integrity
    FOREIGN KEY (GalleryID) 
        REFERENCES Galleries(GalleryID) 
        ON DELETE CASCADE,                                   -- Cascades deletion if a related gallery is deleted
    FOREIGN KEY (ArtistID) 
        REFERENCES Artists(ArtistID) 
        ON DELETE CASCADE                                    -- Cascades deletion if the related artist is deleted
);

INSERT INTO ArtCategory (CategoryName, GalleryID, ArtistID, Style, Period, ArtMedium, OriginCountry, PopularityRank) VALUES 
('Impressionism', 1, 2, 'Abstract', 'Modern', 'Oil', 'France', 5),
('Cubism', 2, 1, 'Geometric', 'Contemporary', 'Acrylic', 'Spain', 8),
('Surrealism', 3, 5, 'Dreamlike', '20th Century', 'Mixed Media', 'UK', 7),
('Renaissance', 4, 4, 'Realism', '16th Century', 'Fresco', 'Italy', 10),
('Expressionism', 5, 3, 'Expressive', 'Modern', 'Oil', 'Germany', 4),
('Baroque', 6, 8, 'Dramatic', '17th Century', 'Oil', 'Netherlands', 12),
('Minimalism', 7, 9, 'Simple', 'Contemporary', 'Acrylic', 'USA', 6),
('Futurism', 8, 6, 'Dynamic', '20th Century', 'Sculpture', 'Italy', 9),
('Realism', 9, 7, 'True-to-life', '19th Century', 'Charcoal', 'France', 11),
('Neoclassicism', 10, 10, 'Classical', '18th Century', 'Marble', 'Greece', 13),
('Abstract', 11, 13, 'Abstract', '20th Century', 'Mixed Media', 'USA', 3),
('Pop Art', 12, 14, 'Popular', 'Contemporary', 'Acrylic', 'UK', 14),
('Gothic', 13, 12, 'Dark', 'Medieval', 'Wood', 'Germany', 15),
('Romanticism', 14, 11, 'Emotional', '19th Century', 'Oil', 'France', 2),
('Classicism', 15, 18, 'Classical', '18th Century', 'Bronze', 'Italy', 16),
('Modern Art', 16, 15, 'Modernist', '20th Century', 'Mixed Media', 'USA', 1),
('Symbolism', 17, 16, 'Symbolic', '19th Century', 'Watercolor', 'Switzerland', 18),
('Art Nouveau', 18, 17, 'Decorative', '20th Century', 'Glass', 'Austria', 17),
('Rococo', 19, 20, 'Ornate', '18th Century', 'Oil', 'France', 19),
('Constructivism', 20, 21, 'Industrial', '20th Century', 'Wood', 'Russia', 20);
SELECT * FROM ArtCategory;

-- Table: Inventory
-- Purpose: Tracks the inventory of artworks, including acquisition details, storage, and condition.
CREATE TABLE IF NOT EXISTS Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,               -- Unique identifier for each inventory item
    ArtID INT NOT NULL,                                       -- References unique ID of the artwork in the Artworks table
    OrganizationID INT NOT NULL,                              -- References unique ID of the owning organization
    AcquisitionDate DATE NOT NULL ,       -- Date the artwork was acquired, defaults to current date
    EstimatedValue DECIMAL(15, 2) CHECK (EstimatedValue >= 0),-- Estimated value, must be non-negative
    StorageLocation VARCHAR(255) NOT NULL,                    -- Location where the artwork is stored
    ArtCondition VARCHAR(100) NOT NULL CHECK (ArtCondition IN ('Excellent', 'Good', 'Fair', 'Poor')), 
															-- Condition of the artwork, restricted to specified values
    DisplayStatus VARCHAR(100) NOT NULL CHECK (DisplayStatus IN ('On Display', 'In Storage', 'On Loan')), 
                                                              -- Display status, restricted to specified values
    InsurancePolicyNumber VARCHAR(255) UNIQUE,                -- Unique insurance policy number for the artwork
    -- Foreign key constraints to maintain referential integrity
    FOREIGN KEY (ArtID) 
        REFERENCES Artworks(ArtworkID) 
        ON DELETE CASCADE,                                    -- Cascades deletion if the related artwork is deleted
    FOREIGN KEY (OrganizationID) 
        REFERENCES Owning_organization(OrganizationID) 
        ON DELETE CASCADE                                     -- Cascades deletion if the related organization is deleted
);

INSERT INTO Inventory (ArtID, OrganizationID, AcquisitionDate, EstimatedValue, StorageLocation, ArtCondition, DisplayStatus, InsurancePolicyNumber) VALUES 
(1, 1, '2023-01-15', 25000.00, 'New York Gallery - Room A1', 'Excellent', 'On Display', 'INS-12345'),
(2, 1, '2022-06-20', 15000.00, 'New York Gallery - Room B2', 'Good', 'In Storage', 'INS-23456'),
(3, 2, '2021-03-18', 30000.00, 'London Gallery - Storage C1', 'Fair', 'In Storage', 'INS-34567'),
(4, 4, '2022-11-23', 45000.00, 'Berlin Museum - Exhibit D3', 'Excellent', 'On Display', 'INS-45678'),
(5, 3, '2023-05-14', 55000.00, 'Paris Gallery - Vault E2', 'Good', 'In Storage', 'INS-56789'),
(6, 6, '2020-09-11', 38000.00, 'Tokyo Art House - Room F1', 'Poor', 'In Storage', 'INS-67890'),
(7, 5, '2024-01-20', 67000.00, 'Rome Heritage Center - Exhibit G3', 'Excellent', 'On Display', 'INS-78901'),
(8, 9, '2023-08-30', 42000.00, 'Vienna Collection - Vault H2', 'Good', 'On Display', 'INS-89012'),
(9, 17, '2022-07-15', 16000.00, 'Madrid Museum - Storage I1', 'Fair', 'In Storage', 'INS-90123'),
(10, 12, '2021-05-19', 72000.00, 'Chicago Art Gallery - Exhibit J4', 'Excellent', 'On Display', 'INS-12347'),
(11, 8, '2023-10-05', 21000.00, 'Sydney Art Hub - Room K2', 'Good', 'In Storage', 'INS-23458'),
(12, 7, '2023-12-20', 11000.00, 'Los Angeles Exhibit - Vault L1', 'Fair', 'On Display', 'INS-34569'),
(13, 13, '2024-04-09', 25000.00, 'Mexico City Gallery - Storage M3', 'Good', 'In Storage', 'INS-45671'),
(14, 15, '2022-03-10', 57000.00, 'Amsterdam Art Space - Exhibit N2', 'Excellent', 'On Display', 'INS-56782'),
(15, 4, '2023-06-18', 49000.00, 'Berlin Museum - Vault O3', 'Poor', 'In Storage', 'INS-67893'),
(16, 3, '2021-02-14', 64000.00, 'Paris Gallery - Room P1', 'Good', 'On Display', 'INS-78904'),
(17, 10, '2022-10-10', 95000.00, 'Toronto Arts - Exhibit Q3', 'Excellent', 'On Display', 'INS-89015'),
(18, 20, '2023-07-25', 71000.00, 'Seoul Art Connect - Vault R2', 'Fair', 'In Storage', 'INS-90126'),
(19, 16, '2023-09-08', 53000.00, 'Dublin Gallery - Room S1', 'Good', 'On Display', 'INS-12357'),
(14, 19, '2022-04-15', 86000.00, 'Stockholm Museum - Exhibit T4', 'Excellent', 'On Display', 'INS-23468');
SELECT * FROM Inventory;

-- Table: Events
-- Purpose: Records details of events hosted or sponsored by the organization, including fundraisers, social gatherings, and charity events.
CREATE TABLE IF NOT EXISTS Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,                     -- Unique identifier for each event
    EventName VARCHAR(255) NOT NULL,                            -- Name of the event
    EventType VARCHAR(100) NOT NULL CHECK (EventType IN ('Charity', 'Fundraiser', 'Social')),  -- Type of event, restricted to specified values
																
    EventDate DATE NOT NULL,                                    -- Date of the event
    OrganizationID INT NOT NULL,                                -- References the owning organization's unique ID
    Location VARCHAR(255) NOT NULL,                             -- Venue or location where the event is held
    AttendanceCount INT CHECK (AttendanceCount >= 0),           -- Number of attendees, must be non-negative
    TotalFundsRaised DECIMAL(15, 2) DEFAULT 0.00 CHECK (TotalFundsRaised >= 0),   -- Total funds raised, defaults to 0.00 and must be non-negative
    MainSponsor VARCHAR(255),                                   -- Main sponsor for the event
    ContactPerson VARCHAR(255) NOT NULL,                        -- Contact person for the event
    -- Foreign key constraint to maintain referential integrity
    FOREIGN KEY (OrganizationID) 
        REFERENCES Owning_organization(OrganizationID) 
        ON DELETE CASCADE                                       -- Cascades deletion if the related organization is deleted
);

INSERT INTO Events (EventName, EventType, EventDate, OrganizationID, Location, AttendanceCount, TotalFundsRaised, MainSponsor, ContactPerson) VALUES 
('Annual Art Gala', 'Charity', '2024-03-15', 1, 'New York City Hall', 200, 50000.00, 'ArtisCo', 'John Smith'),
('Winter Art Fundraiser', 'Fundraiser', '2024-12-05', 2, 'London Art Center', 150, 30000.00, 'London Arts Ltd.', 'Sarah Johnson'),
('Spring Festival of Arts', 'Social', '2024-04-20', 3, 'Paris City Square', 250, 20000.00, 'Parisian Events', 'Alex Dupont'),
('Heritage Art Night', 'Charity', '2024-05-10', 4, 'Berlin Heritage Museum', 100, 15000.00, 'Berlin Foundation', 'Maria Becker'),
('Artistic Minds Conference', 'Fundraiser', '2024-09-17', 5, 'Tokyo Art House', 180, 45000.00, 'Tokyo Creative', 'Kenji Tanaka'),
('Evening of Classics', 'Social', '2024-07-25', 6, 'Vienna Opera House', 300, 0.00, 'Vienna Art Alliance', 'Franz Muller'),
('Future of Art Symposium', 'Charity', '2024-08-30', 7, 'Rome Exhibition Hall', 220, 32000.00, 'Roma Art Initiative', 'Giulia Romano'),
('Art and Philanthropy Gala', 'Fundraiser', '2024-02-14', 8, 'Madrid Grand Hall', 275, 70000.00, 'Espana Art Corp', 'Pablo Alvarez'),
('Celebration of Impressionism', 'Social', '2024-06-18', 9, 'Amsterdam Art Square', 210, 0.00, 'Amsterdam Creative', 'Emma de Vries'),
('Annual Art Auction', 'Charity', '2024-11-23', 10, 'Chicago Grand Museum', 120, 55000.00, 'Chicago Arts', 'James Wilson'),
('Cultural Arts Fair', 'Social', '2024-03-07', 11, 'Los Angeles Plaza', 400, 0.00, 'LA Art Scene', 'Kimberly Diaz'),
('Art for Everyone', 'Fundraiser', '2024-10-12', 12, 'Seoul Cultural Center', 320, 65000.00, 'Korea Art Foundation', 'Hana Park'),
('International Art Day', 'Social', '2024-04-25', 13, 'Stockholm Museum', 500, 0.00, 'Stockholm Arts', 'Lars Johansson'),
('Modernism Night', 'Charity', '2024-01-30', 14, 'Toronto Art House', 180, 30000.00, 'Toronto Creative Society', 'Linda Wong'),
('Summer Art Show', 'Fundraiser', '2024-07-04', 15, 'Sydney Harbor Art Center', 230, 47000.00, 'Sydney Arts', 'Olivia Green'),
('Artists Against Hunger', 'Charity', '2024-09-22', 16, 'Mexico City Expo Center', 150, 25000.00, 'Food For All', 'Diego Rivera'),
('Youth in Arts Festival', 'Social', '2024-05-03', 17, 'San Francisco Bay Center', 300, 0.00, 'SF Art Council', 'Jessica Lin'),
('Annual Artisans Meet', 'Fundraiser', '2024-08-19', 18, 'Dublin Art Pavilion', 190, 50000.00, 'Irish Arts Group', 'Patrick O’Neill'),
('Global Art Connection', 'Social', '2024-06-28', 19, 'Singapore Cultural Hall', 240, 0.00, 'Singapore Art Connect', 'Siti Nurhaliza'),
('Legacy Art Ball', 'Charity', '2024-10-18', 20, 'Hong Kong Exhibition Center', 160, 40000.00, 'HK Art Society', 'Chen Wei');
Select * from events;

-- Table: SponsorRecords
-- Purpose: Tracks sponsors for events, including their contact information, type of sponsorship, and contribution details.
CREATE TABLE IF NOT EXISTS SponsorRecords (
    SponsorID INT PRIMARY KEY AUTO_INCREMENT,                     -- Unique identifier for each sponsor record
    SponsorName VARCHAR(255) NOT NULL,                            -- Name of the sponsor
    ContactInfo VARCHAR(255) NOT NULL,                            -- Contact information (email or phone number)
    SponsorshipAmount DECIMAL(15, 2) DEFAULT 0.00 CHECK (SponsorshipAmount >= 0), -- Sponsorship amount, defaults to 0.00 and must be non-negative
    SponsorshipType VARCHAR(100) NOT NULL CHECK (SponsorshipType IN ('Monetary', 'In-kind')),  -- Type of sponsorship, restricted to specified values
    SponsorSince DATE NOT NULL,              -- Date since sponsor began
    EventID INT NOT NULL,                                         -- References the unique ID of the associated event
    Website VARCHAR(255) CHECK (Website REGEXP '^(http|https)://'),  -- Validates that the website begins with 'http' or 'https'
    ContactPerson VARCHAR(255) NOT NULL,                          -- Primary contact person for the sponsor
    -- Foreign key constraint to maintain referential integrity
    FOREIGN KEY (EventID) 
        REFERENCES Events(EventID) 
        ON DELETE CASCADE                                         -- Cascades deletion if the associated event is deleted
);

INSERT INTO SponsorRecords (SponsorName, ContactInfo, SponsorshipAmount, SponsorshipType, SponsorSince, EventID, Website, ContactPerson) VALUES 
('ArtisCo', 'contact@artisco.com', 15000.00, 'Monetary', '2022-05-01', 1, 'https://www.artisco.com', 'John Doe'),
('London Arts Ltd.', 'info@londonartsltd.co.uk', 10000.00, 'In-kind', '2023-01-10', 2, 'https://www.londonartsltd.co.uk', 'Sarah Brown'),
('Parisian Events', 'paris@events.fr', 12000.00, 'Monetary', '2021-06-12', 3, 'https://www.parisiane.fr', 'Marie Clément'),
('Berlin Foundation', 'contact@berlinfoundation.de', 8000.00, 'Monetary', '2020-11-20', 4, 'https://www.berlinfoundation.de', 'Hans Meier'),
('Tokyo Creative', 'tokyo.creative@jp.co', 9000.00, 'In-kind', '2022-08-05', 5, 'https://www.tokyocreative.jp', 'Sakura Ishikawa'),
('Vienna Art Alliance', 'contact@viennaarts.at', 7000.00, 'Monetary', '2023-03-22', 6, 'https://www.viennaarts.at', 'Markus Weber'),
('Roma Art Initiative', 'info@romaart.it', 13000.00, 'In-kind', '2021-09-17', 7, 'https://www.romaart.it', 'Claudia Rossi'),
('Espana Art Corp', 'info@espanaart.es', 11000.00, 'Monetary', '2022-12-01', 8, 'https://www.espanaart.es', 'Pablo Fernandez'),
('Amsterdam Creative', 'contact@amsterdamcreative.nl', 14000.00, 'In-kind', '2023-05-05', 9, 'https://www.amsterdamcreative.nl', 'Sophie van Dijk'),
('Chicago Arts', 'info@chicagoarts.org', 12500.00, 'Monetary', '2021-04-18', 10, 'https://www.chicagoarts.org', 'Linda Brown'),
('LA Art Scene', 'contact@laartscene.us', 15500.00, 'In-kind', '2022-02-28', 11, 'https://www.laartscene.org', 'Carlos Mendez'),
('Korea Art Foundation', 'korea.art@kr.com', 14000.00, 'Monetary', '2023-06-16', 12, 'https://www.koreaartfoundation.kr', 'Yuna Kim'),
('Stockholm Arts', 'info@stockholmarts.se', 13000.00, 'In-kind', '2023-11-12', 13, 'https://www.stockholmarts.se', 'Olle Johansson'),
('Toronto Creative Society', 'contact@torontocreative.ca', 10000.00, 'Monetary', '2020-10-08', 14, 'https://www.torontocreative.ca', 'Liam Chen'),
('Sydney Arts', 'info@sydneyarts.au', 15000.00, 'In-kind', '2021-07-20', 15, 'https://www.sydneyarts.au', 'Isabella Thompson'),
('Food For All', 'contact@foodforall.org.mx', 9000.00, 'Monetary', '2023-02-14', 16, 'https://www.foodforall.org.mx', 'Miguel Torres'),
('SF Art Council', 'info@sfartcouncil.us', 7500.00, 'In-kind', '2022-03-30', 17, 'https://www.sfartcouncil.org', 'Jessica Perez'),
('Irish Arts Group', 'contact@irisharts.ie', 8500.00, 'Monetary', '2021-05-25', 18, 'https://www.irisharts.ie', 'Aidan McCarthy'),
('Singapore Art Connect', 'info@singartconnect.sg', 10500.00, 'In-kind', '2022-09-05', 19, 'https://www.singartconnect.sg', 'Tan Wei Ling'),
('HK Art Society', 'info@hkartsociety.hk', 13000.00, 'Monetary', '2023-10-22', 20, 'https://www.hkartsociety.hk', 'Wong Ka Yan');
select * from sponsorrecords;

-- Table: Loans
-- Purpose: Tracks loans of inventory items, including details about the recipient, loan dates, purpose, and condition upon return.
CREATE TABLE IF NOT EXISTS Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,                       -- Unique identifier for each loan record
    InventoryID INT NOT NULL,                                    -- References the unique ID of the item in inventory
    LoanedTo VARCHAR(255) NOT NULL,                              -- Name of the recipient the item is loaned to
    LoanStartDate DATE NOT NULL,                                 -- Date the loan period begins
    LoanEndDate DATE NOT NULL,                                    -- Date the loan period ends
    LoanPurpose VARCHAR(255) NOT NULL CHECK (LoanPurpose IN ('Exhibition', 'Study', 'Research')), -- Purpose of the loan, restricted to specified values
    LoanAgreementNumber VARCHAR(255) UNIQUE,                     -- Unique identifier for the loan agreement
    ReturnCondition VARCHAR(100) CHECK (ReturnCondition IN ('Good', 'Damaged', 'Requires Repair')),  -- Condition upon return, restricted to specified values
    LoanedToContactInfo VARCHAR(255) NOT NULL,                   -- Contact information for the loan recipient
    -- Foreign key constraint to maintain referential integrity
    FOREIGN KEY (InventoryID) 
        REFERENCES Inventory(InventoryID) 
        ON DELETE CASCADE                                        -- Cascades deletion if the related inventory item is deleted
);

INSERT INTO Loans (InventoryID, LoanedTo, LoanStartDate, LoanEndDate, LoanPurpose, LoanAgreementNumber, ReturnCondition, LoanedToContactInfo) VALUES 
(1, 'Metropolitan Museum of Art', '2024-01-10', '2024-06-10', 'Exhibition', 'AGMT-001', 'Good', 'contact@metmuseum.org'),
(2, 'Smithsonian Institution', '2023-02-15', '2023-08-15', 'Research', 'AGMT-002', 'Good', 'info@si.edu'),
(3, 'Louvre Museum', '2024-03-01', '2024-09-01', 'Exhibition', 'AGMT-003', 'Good', 'contact@louvre.fr'),
(4, 'British Museum', '2023-05-05', '2023-11-05', 'Exhibition', 'AGMT-004', 'Damaged', 'info@britishmuseum.org'),
(5, 'National Gallery of Art', '2024-04-10', '2024-10-10', 'Study', 'AGMT-005', 'Good', 'contact@nga.gov'),
(6, 'Rijksmuseum', '2023-06-20', '2023-12-20', 'Research', 'AGMT-006', 'Good', 'info@rijksmuseum.nl'),
(7, 'Vatican Museums', '2024-02-14', '2024-08-14', 'Exhibition', 'AGMT-007', 'Good', 'info@mv.vatican.va'),
(8, 'Museum of Modern Art', '2023-09-10', '2024-03-10', 'Exhibition', 'AGMT-008', 'Good', 'info@moma.org'),
(9, 'Getty Center', '2023-07-15', '2024-01-15', 'Study', 'AGMT-009', 'Damaged', 'contact@getty.edu'),
(10, 'Victoria and Albert Museum', '2024-03-12', '2024-09-12', 'Exhibition', 'AGMT-010', 'Good', 'contact@vam.ac.uk'),
(11, 'Museum of Fine Arts, Boston', '2023-10-25', '2024-04-25', 'Research', 'AGMT-011', 'Good', 'info@mfa.org'),
(12, 'National Museum of China', '2023-01-15', '2023-07-15', 'Study', 'AGMT-012', 'Good', 'contact@chnmuseum.cn'),
(13, 'Prado Museum', '2024-05-01', '2024-11-01', 'Exhibition', 'AGMT-013', 'Damaged', 'info@museodelprado.es'),
(14, 'Hermitage Museum', '2023-11-20', '2024-05-20', 'Exhibition', 'AGMT-014', 'Good', 'contact@hermitage.ru'),
(15, 'Tokyo National Museum', '2024-06-18', '2024-12-18', 'Research', 'AGMT-015', 'Good', 'info@tnm.jp'),
(16, 'Art Institute of Chicago', '2023-12-01', '2024-06-01', 'Study', 'AGMT-016', 'Good', 'contact@artic.edu'),
(17, 'Uffizi Gallery', '2024-07-10', '2025-01-10', 'Exhibition', 'AGMT-017', 'Good', 'info@uffizi.it'),
(18, 'National Museum of Korea', '2023-08-14', '2024-02-14', 'Research', 'AGMT-018', 'Damaged', 'contact@museum.go.kr'),
(19, 'Musee d’Orsay', '2024-04-01', '2024-10-01', 'Exhibition', 'AGMT-019', 'Good', 'info@musee-orsay.fr'),
(20, 'Shanghai Museum', '2023-09-25', '2024-03-25', 'Study', 'AGMT-020', 'Good', 'contact@shanghaimuseum.net');
select * from loans;

-- Table: RestorationRecords
-- Purpose: Records details of restoration activities performed on inventory items, including costs, types, and restorer information.
CREATE TABLE IF NOT EXISTS RestorationRecords (
    RestorationID INT PRIMARY KEY AUTO_INCREMENT,                -- Unique identifier for each restoration record
    InventoryID INT NOT NULL,                                    -- References the unique ID of the item in inventory
    RestorationDate DATE NOT NULL ,          -- Date of restoration
    RestorationDescription TEXT,                                 -- Description of the restoration work done
    RestorerName VARCHAR(255) NOT NULL,                          -- Name of the restorer responsible for the restoration
    Cost DECIMAL(15, 2) CHECK (Cost >= 0),                       -- Cost of restoration, must be non-negative
    RestorationType VARCHAR(100) NOT NULL CHECK (RestorationType IN ('Structural', 'Cleaning', 'Repainting', 'Conservation')), 
                                                                  -- Type of restoration, restricted to specified values
    RestorationLocation VARCHAR(255) NOT NULL,                   -- Location where the restoration took place
    RestorationCompany VARCHAR(255),                             -- Company or organization performing the restoration
    -- Foreign key constraint to maintain referential integrity
    FOREIGN KEY (InventoryID) 
        REFERENCES Inventory(InventoryID) 
        ON DELETE CASCADE                                        -- Cascades deletion if the related inventory item is deleted
);

INSERT INTO RestorationRecords (InventoryID, RestorationDate, RestorationDescription, RestorerName, Cost, RestorationType, RestorationLocation, RestorationCompany) VALUES 
(1, '2023-02-10', 'Restoration of surface cracks and structural reinforcement', 'Emma Roberts', 4500.00, 'Structural', 'New York Conservation Center', 'NY Restoration Inc.'),
(2, '2024-03-15', 'Deep cleaning and varnish restoration', 'Carlos Sanchez', 3200.00, 'Cleaning', 'National Art Gallery Workshop', 'FineArt Care Ltd.'),
(3, '2023-05-18', 'Touch-up painting to restore color vibrancy', 'Lara Kim', 2200.00, 'Repainting', 'Metropolitan Art Workshop', 'Masterpiece Restorations'),
(4, '2022-11-30', 'Structural reinforcement for frame stability', 'Andrew Lee', 5500.00, 'Structural', 'Smithsonian Conservation Center', 'Heritage Works LLC'),
(5, '2023-09-25', 'Dust and grime removal, surface cleaning', 'Fiona Nguyen', 1800.00, 'Cleaning', 'Art Institute of Chicago', 'Elite Art Cleaners'),
(6, '2023-01-12', 'Repainting to restore original colors', 'Sara El-Amin', 3000.00, 'Repainting', 'Louvre Restoration Lab', 'Paris Art Experts'),
(7, '2024-05-21', 'Structural repair of damaged corners', 'James O’Neill', 4700.00, 'Structural', 'British Museum Workshop', 'Heritage Restorers UK'),
(8, '2023-06-01', 'Thorough cleaning and polish restoration', 'Isabel Chen', 2500.00, 'Cleaning', 'Tokyo Conservation Studio', 'CleanArt Solutions'),
(9, '2024-07-15', 'Restoration of faded paints', 'Henry Park', 2600.00, 'Repainting', 'Vatican Museum Lab', 'Color Revival Corp.'),
(10, '2023-10-28', 'Structural reinforcement of artwork frame', 'Liam Scott', 5500.00, 'Structural', 'Los Angeles Art Center', 'FrameGuard Restorations'),
(11, '2024-02-03', 'Detailed surface cleaning and polishing', 'Maria Gomez', 2300.00, 'Cleaning', 'National Museum of Modern Art', 'Prime Clean Restorers'),
(12, '2023-08-22', 'Repainting minor scratches and damages', 'Dae-Jung Kim', 2800.00, 'Repainting', 'Seoul Art Workshop', 'ReviveArt Korea'),
(13, '2023-12-19', 'Frame repair and reinforcement', 'Elena Costa', 4700.00, 'Structural', 'Prado Museum Workshop', 'Art Frame Experts'),
(14, '2022-04-25', 'Removal of dirt, stains, and residue', 'Anna Voss', 2000.00, 'Cleaning', 'Berlin Art Conservatory', 'Berlin Art Restorers'),
(15, '2024-03-11', 'Detailed repainting for color accuracy', 'Marco Rossi', 3100.00, 'Repainting', 'Florence Restoration Studio', 'Italy Art Care'),
(16, '2023-05-30', 'Surface polishing and varnish restoration', 'Sophia Lin', 2200.00, 'Cleaning', 'National Gallery Conservation Lab', 'Art Glow Ltd.'),
(17, '2023-09-13', 'Structural restoration due to transport damage', 'Olivia Smith', 5800.00, 'Structural', 'Toronto Art Workshop', 'SafeArt Solutions'),
(18, '2024-01-05', 'Repainting to restore faded areas', 'Miguel Sanchez', 2400.00, 'Repainting', 'Mexico City Art Lab', 'Colores Restoration Inc.'),
(19, '2023-06-10', 'Cleaning of surface dust and polish', 'Peter Morgan', 2100.00, 'Cleaning', 'National Museum of Australia', 'Aussie Art Restorers'),
(20, '2024-04-17', 'Structural work to secure loose areas', 'Chloe Lee', 4900.00, 'Structural', 'Singapore National Gallery', 'Asia Art Services');
select * from restorationrecords;

-- VIEWS
#view 1 : ActiveExhibitions
CREATE VIEW ActiveExhibitions AS
SELECT 
    e.ExhibitionID,
    e.ExhibitionName,
    e.StartDate,
    e.EndDate,
    e.Venue,
    a.ArtworkID,
    a.Title AS ArtworkTitle,
    a.ArtMedium,
    a.Price,
    a.ArtStatus
FROM Exhibitions e
JOIN Exhibition_Artworks ea ON e.ExhibitionID = ea.ExhibitionID
JOIN Artworks a ON ea.ArtworkID = a.ArtworkID
WHERE CURRENT_DATE BETWEEN e.StartDate AND e.EndDate;
-- To retrieve data from the view
SELECT * FROM ActiveExhibitions;


# 2nd view : ArtistProfiles
CREATE VIEW ArtistProfiles AS
SELECT 
    ar.ArtistID,
    CONCAT(ar.FirstName, ' ', ar.LastName) AS FullName,
    ar.Nationality,
    ar.Bio,
    COUNT(aw.ArtworkID) AS ArtworkCount
FROM Artists ar
LEFT JOIN Artworks aw ON ar.ArtistID = aw.ArtistID
GROUP BY ar.ArtistID, ar.FirstName, ar.LastName, ar.Nationality, ar.Bio;

-- To retrieve data from the view
SELECT * FROM ArtistProfiles;



-- COMPLEX QUERIES
-- #1) Comprehensive Artist Performance Report in Gallery Management
SELECT Artists.FirstName, Artists.LastName,
       SUM(CASE 
       WHEN Artworks.ArtStatus = 'available' THEN Artworks.Price 
       ELSE 0.00 
       END) AS TotalAvailableValue,
       COUNT(DISTINCT exhibition_artworks.ExhibitionID) AS TotalExhibitions,
       COUNT(DISTINCT Sales.SaleID) AS TotalSoldArtworks
FROM Artists
LEFT JOIN Artworks ON Artists.ArtistID = Artworks.ArtistID
LEFT JOIN exhibition_artworks ON Artworks.ArtworkID = exhibition_artworks.ArtworkID
LEFT JOIN Sales ON Artworks.ArtworkID = Sales.ArtworkID
GROUP BY Artists.ArtistID, Artists.FirstName, Artists.LastName
ORDER BY  TotalAvailableValue DESC;

-- #2) Comprehensive Analysis of Artist Event Participation, Sponsorship, and Artwork Value by Art Category
SELECT Artists.FirstName AS ArtistFirstname, Artists.LastName AS ArtistLastName, 
       COUNT(DISTINCT Events.EventID) AS TotalEventsParticipated,
       SUM(sponsorrecords.SponsorshipAmount) AS TotalSponsorshipReceived,
       owning_organization.Organization_name AS OwningOrganization,
       galleries.GalleryName AS GalleryName,
       galleries.Location AS GalleryLocation,
       artcategory.CategoryName AS ArtCategory,
       AVG(Artworks.Price) AS AvgAvailableArtworkPrice
FROM Events
RIGHT JOIN owning_organization ON Events.OrganizationID = owning_organization.OrganizationID
JOIN Galleries ON owning_organization.GalleryID = Galleries.GalleryID
JOIN ArtCategory ON Galleries.GalleryID =ArtCategory.GalleryID
LEFT JOIN sponsorrecords ON Events.EventID = sponsorrecords.EventID
LEFT JOIN artists ON  ArtCategory.ArtistID =  artists.ArtistID
LEFT JOIN Artworks ON Artists.ArtistID = Artworks.ArtistID AND Artworks.ArtStatus = 'available' 
GROUP BY ArtistFirstname, ArtistLastName, OwningOrganization, GalleryName, ArtCategory
ORDER BY TotalSponsorshipReceived DESC, AvgAvailableArtworkPrice DESC;

-- #3.) Identifying High-Value and Active Artists for Strategic Focus
SELECT Artists.FirstName AS ArtistFirstName , Artists.LastName AS ArtistLastname, 
       COUNT(DISTINCT Exhibitions.ExhibitionID) AS TotalExhibitedArtworks,
       COUNT(DISTINCT Sales.SaleID) AS TotalArtworksSold,
       AVG(Artworks.Price) AS AvgAvailableArtworkPrice,
       exhibitions.ExhibitionName AS ExhibitionName
FROM Artists
JOIN Artworks ON Artists.ArtistID = Artworks.ArtistID AND Artworks.ArtStatus = 'available'
LEFT JOIN exhibition_artworks ON Artworks.ArtworkID = exhibition_artworks.ArtworkID
LEFT JOIN exhibitions ON exhibition_artworks.ExhibitionID = exhibitions.ExhibitionID
LEFT JOIN Sales ON Artworks.ArtworkID = Sales.ArtworkID
GROUP BY Artists.ArtistID, ArtistFirstName, ArtistLastname,ExhibitionName
HAVING COUNT(DISTINCT Exhibitions.ExhibitionID) >= 1
   AND AVG(Artworks.Price) > 100
ORDER BY AvgAvailableArtworkPrice DESC, TotalArtworksSold DESC;

-- #4) Revenue Optimization for Art Gallery Management
SELECT Artists.FirstName AS ArtistFirstName , 
Artists.LastName AS ArtistLastName , Artworks.Title AS ArtTitle ,SUM(Artworks.Price) AS PotentialRevenue,
Exhibitions.ExhibitionName AS ExhibitionName
FROM Artists
CROSS JOIN Artworks
LEFT JOIN Sales ON Artworks.ArtworkID = Sales.ArtworkID
JOIN exhibition_artworks ON Artworks.ArtworkID = exhibition_artworks.ArtworkID
JOIN exhibitions ON exhibition_artworks.ExhibitionID = exhibitions.ExhibitionID
WHERE Artworks.ArtStatus = 'available'
GROUP BY Artists.FirstName, Artists.LastName, Artworks.Title, Exhibitions.ExhibitionName
HAVING PotentialRevenue > 2000
ORDER BY PotentialRevenue DESC;

#5.) Identifying High-Value Art Mediums and Standout Artworks
WITH MediumAvgPrice AS (
    SELECT artworks.ArtMedium AS ArtMedium , AVG(Sales.Price) AS AvgSoldPrice
    FROM Artworks
    JOIN Sales ON Artworks.ArtworkID = Sales.ArtworkID
    GROUP BY ArtMedium
)
SELECT Artworks.Title AS Arttitle, Artists.FirstName AS ArtistFirstname , Artists.LastName AS ArtistLastname , 
Artworks.Artmedium AS ArtMedium, Sales.Price AS Saleprice,
       MediumAvgPrice.AvgSoldPrice
FROM Artworks
JOIN Sales ON Artworks.ArtworkID = Sales.ArtworkID
JOIN Artists ON Artworks.ArtistID = Artists.ArtistID
JOIN MediumAvgPrice ON artworks.ArtMedium = MediumAvgPrice.ArtMedium
ORDER BY MediumAvgPrice.AvgSoldPrice DESC, Sales.Price DESC
LIMIT 3;

#WINDOWS FUNCTION 

-- To analyze the sales performance of artworks grouped by artist nationality, providing insights into the
-- volume of artworks sold, total revenue generated, and average price per artwork. 
SELECT 
    a.Nationality AS ArtistNationality,
    COUNT(aw.ArtworkID) AS TotalArtworks,
    SUM(aw.Price) AS TotalSales,
    AVG(aw.Price) AS AvgPrice
FROM Artists a
JOIN Artworks aw ON a.ArtistID = aw.ArtistID
WHERE aw.ArtStatus = 'sold'
GROUP BY ArtistNationality
ORDER BY TotalSales DESC;

#To rank artworks within each medium by the year they 
-- were created, providing a timeline of the evolution and trends in artistic styles. 
SELECT 
    aw.Title AS ArtworkTitle,
    aw.ArtMedium AS ArtMedium,
    aw.YearCreated,
    RANK() OVER (PARTITION BY aw.ArtMedium ORDER BY aw.YearCreated) AS YearRank
FROM Artworks aw
ORDER BY ArtMedium, aw.YearCreated;

#COMMON EXPRESSION TABLE - CTE 
-- To identify and evaluate collaborative artist pairs from the same 
-- nationality who have worked together on multiple artworks, providing insights 
-- into their collaboration frequency and the financial impact of their combined efforts. 

WITH ArtistPairs AS (
    SELECT 
        a1.ArtistID AS Artist1ID,
        a2.ArtistID AS Artist2ID,
        a1.Nationality,
        CONCAT(a1.FirstName, ' ', a1.LastName) AS Artist1Name,
        CONCAT(a2.FirstName, ' ', a2.LastName) AS Artist2Name
    FROM Artists a1
    JOIN Artists a2 ON a1.ArtistID < a2.ArtistID
    WHERE a1.Nationality = a2.Nationality
), 
CollaborativeArtworks AS (
    SELECT 
        ap.Artist1ID,
        ap.Artist2ID,
        ap.Nationality,
        ap.Artist1Name,
        ap.Artist2Name,
        aw.ArtworkID,
        aw.Price
    FROM ArtistPairs ap
    JOIN Artworks aw ON aw.ArtistID = ap.Artist1ID OR aw.ArtistID = ap.Artist2ID
    GROUP BY ap.Artist1ID, ap.Artist2ID, ap.Nationality, ap.Artist1Name, ap.Artist2Name, aw.ArtworkID, aw.Price
),
CollaborationSummary AS (
    SELECT 
        Artist1ID,
        Artist2ID,
        Nationality,
        Artist1Name,
        Artist2Name,
        COUNT(DISTINCT ArtworkID) AS CollaborationCount,
        SUM(Price) AS TotalCollaborationValue
    FROM CollaborativeArtworks
    GROUP BY Artist1ID, Artist2ID, Nationality, Artist1Name, Artist2Name
)
SELECT 
    Nationality,
    Artist1Name,
    Artist2Name,
    CollaborationCount,
    TotalCollaborationValue
FROM CollaborationSummary
WHERE CollaborationCount >= 2
ORDER BY Nationality, CollaborationCount DESC, TotalCollaborationValue DESC;

#SUBQUERY 
-- Identify high-demand artworks featured in multiple exhibitions
SELECT 
    a.FirstName,
    a.LastName,
    aw.Title AS ArtworkTitle,
    aw.Price AS ArtworkPrice,
    COUNT(ea.ExhibitionID) AS NumberOfExhibitions
FROM Artworks AS aw
JOIN Artists AS a ON aw.ArtistID = a.ArtistID
JOIN Exhibition_Artworks AS ea ON aw.ArtworkID = ea.ArtworkID
WHERE aw.ArtStatus = 'available' -- Only include unsold artworks
AND aw.ArtworkID IN (
        SELECT 
            ea2.ArtworkID
        FROM Exhibition_Artworks AS ea2
        GROUP BY ea2.ArtworkID
        HAVING COUNT(ea2.ExhibitionID) > 1 -- Artworks must have appeared in more than one exhibition
    )
GROUP BY a.ArtistID, aw.ArtworkID
ORDER BY NumberOfExhibitions DESC, ArtworkPrice DESC;

#ROLLUP 
-- To generate a comprehensive sales performance report for
-- artists, grouped by nationality, that includes each artist’s total sales, average sale price, 
-- and summarized data at nationality and overall levels.
SELECT 
    a.Nationality,
    CONCAT(a.FirstName, ' ', a.LastName) AS ArtistName,
    SUM(aw.Price) AS TotalSales,
    AVG(aw.Price) AS AverageSalePrice
FROM Artists a
JOIN Artworks aw ON a.ArtistID = aw.ArtistID
WHERE aw.ArtStatus = 'sold'
GROUP BY a.Nationality, a.FirstName, a.LastName WITH ROLLUP;

-- PROCEDURES
#This procedure retrieves detailed artwork records filtered by artist ID, status, and price range, and orders them by year created (descending) and price (ascending).
##PROCEDURE 1

DELIMITER //
CREATE PROCEDURE GetArtworksDetails(
    IN p_ArtistID INT,
    IN p_Status ENUM('available', 'sold', 'on display'),
    IN p_MinPrice DECIMAL(10, 2),
    IN p_MaxPrice DECIMAL(10, 2)
)
BEGIN
    SELECT ArtworkID, Title, YearCreated, ArtMedium, Dimensions, Price, ArtStatus
    FROM Artworks
    WHERE ArtistID = p_ArtistID
      AND ArtStatus = p_Status
      AND Price BETWEEN p_MinPrice AND p_MaxPrice
    ORDER BY YearCreated DESC, Price ASC;
END //
DELIMITER ;
CALL GetArtworksDetails(1, 'available', 800.00, 1200.00);
 
 #PROCEDURE 2
#The procedure retrieves restoration records from the RestorationRecords table for the types 'Repainting' and 'Structural', completed in 2023, and performed by specific restorers ('Emma Roberts', 'Carlos Sanchez', 'Sara El-Amin'), ordered by restoration date and cost.

DELIMITER //
CREATE PROCEDURE GetRestorationDetails()
BEGIN
    -- Select restoration records for the 'Repainting' type, with specific conditions
    SELECT RestorationID, RestorationDate, RestorationDescription, 
           RestorerName, Cost, RestorationType, RestorationLocation, RestorationCompany
    FROM RestorationRecords
    WHERE RestorationType IN ('Repainting', 'Structural')                    -- Fixed restoration types
      AND YEAR(RestorationDate) = 2023                                       -- Fixed year filter for 2023
      AND RestorerName IN ('Emma Roberts', 'Carlos Sanchez', 'Sara El-Amin')   -- Specific restorers
    ORDER BY RestorationDate DESC, Cost ASC;                                  -- Sorting results
END //
DELIMITER ;
call GetRestorationDetails;
 
#PROCEDURE 3
#The procedure retrieves exhibition details for specific venues (e.g., 'Art Gallery One', 'Nature Center', 'City Art Space'), with atleast  1 associated artworks, and orders the results by the exhibition start date in descending order.
DELIMITER //
CREATE PROCEDURE GetExhibitionsByVenueAndArtworkCount()
BEGIN
    -- Select exhibition details and the count of artworks for each exhibition
    SELECT e.ExhibitionID, e.ExhibitionName, e.StartDate, e.EndDate, e.Venue, e.ArtDescription,
           COUNT(ea.ArtworkID) AS ArtworkCount
    FROM Exhibitions e
    JOIN Exhibition_Artworks ea ON e.ExhibitionID = ea.ExhibitionID
    WHERE e.Venue IN ('Art Gallery One', 'Nature Center', 'City Art Space')  -- Filter by specific venues
    GROUP BY e.ExhibitionID
    HAVING COUNT(ea.ArtworkID) >= 1      -- Only exhibitions with more than 4 artworks
    ORDER BY e.StartDate DESC;          -- Sort by start date in descending order
END //
DELIMITER ;
call GetExhibitionsByVenueAndArtworkCount;

-- TRIGGER 
-- Change delimiter to handle triggers


-- Drop existing triggers if they exist
DROP TRIGGER IF EXISTS before_artwork_insert;
DROP TRIGGER IF EXISTS after_artwork_insert;
DROP TRIGGER IF EXISTS before_artwork_update;
DROP TRIGGER IF EXISTS after_artwork_update;
DROP TRIGGER IF EXISTS before_artwork_delete;
DROP TRIGGER IF EXISTS after_artwork_delete;

-- Trigger 1: Before Insert - Validate artwork title length and creation year
DELIMITER //
CREATE TRIGGER before_artwork_insert
BEFORE INSERT ON Artworks
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.Title) > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Artwork title is too long.';
    END IF;

    IF NEW.YearCreated > YEAR(CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Year created cannot be in the future.';
    END IF;
END //

-- Trigger 2: After Insert - Log new artwork addition
DELIMITER //
CREATE TRIGGER after_artwork_insert
AFTER INSERT ON Artworks
FOR EACH ROW
BEGIN
    INSERT INTO ArtworkLogs (ArtworkID, Action, ActionDate)
    VALUES (NEW.ArtworkID, 'INSERT', NOW());
END //

-- Trigger 3: Before Update - Capture current state for reference
DELIMITER //
CREATE TRIGGER before_artwork_update
BEFORE UPDATE ON Artworks
FOR EACH ROW
BEGIN
    INSERT INTO ArtworkHistory (ArtworkID, OldTitle, OldYearCreated, UpdatedDate)
    VALUES (OLD.ArtworkID, OLD.Title, OLD.YearCreated, NOW());
END //

-- Trigger 4: After Update - Log the update action
DELIMITER //
CREATE TRIGGER after_artwork_update
AFTER UPDATE ON Artworks
FOR EACH ROW
BEGIN
    INSERT INTO ArtworkLogs (ArtworkID, Action, ActionDate)
    VALUES (NEW.ArtworkID, 'UPDATE', NOW());
END //

-- Trigger 5: Before Delete - Archive artwork details
DELIMITER //
CREATE TRIGGER before_artwork_delete
BEFORE DELETE ON Artworks
FOR EACH ROW
BEGIN
    INSERT INTO ArchivedArtworks (ArtworkID, Title, YearCreated, ArchivedDate)
    VALUES (OLD.ArtworkID, OLD.Title, OLD.YearCreated, NOW());
END //
DELIMITER //
-- Trigger 6: After Delete - Log deletion action
CREATE TRIGGER after_artwork_delete
AFTER DELETE ON Artworks
FOR EACH ROW
BEGIN
    INSERT INTO ArtworkLogs (ArtworkID, Action, ActionDate)
    VALUES (OLD.ArtworkID, 'DELETE', NOW());
END //

-- Reset delimiter back to default
DELIMITER ;


-- Function 1: Get Artist's Full Name
DELIMITER //
CREATE FUNCTION GetArtistFullName(artistID INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE fullName VARCHAR(255);
    SELECT CONCAT(FirstName, ' ', LastName) INTO fullName
    FROM Artists
    WHERE ArtistID = artistID;
    RETURN fullName;
END;
//
DELIMITER ;

-- Function 2: Calculate Total Artworks by an Artist
DELIMITER //
CREATE FUNCTION GetTotalArtworks(artistID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totalArtworks INT;
    SELECT COUNT(*) INTO totalArtworks
    FROM Artworks
    WHERE ArtistID = artistID;
    RETURN totalArtworks;
END;
//
DELIMITER ;

-- Function 3: Get Artist Nationality
DELIMITER //
CREATE FUNCTION GetArtistNationality(artistID INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nationality VARCHAR(100);
    SELECT Nationality INTO nationality
    FROM Artists
    WHERE ArtistID = artistID;
    RETURN nationality;
END;
//
DELIMITER ;

-- Function 4: Check Artwork Availability
DELIMITER //
CREATE FUNCTION IsArtworkAvailable(artworkID INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE isAvailable BOOLEAN;
    SELECT COUNT(*) INTO isAvailable
    FROM Exhibition_Artworks
    WHERE ArtworkID = artworkID;
    RETURN isAvailable = 0;  -- TRUE if not present in exhibitions, indicating availability.
END;
//
DELIMITER ;

-- Function 5: Get Artist's Email
DELIMITER //
CREATE FUNCTION GetArtistEmail(artistID INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE email VARCHAR(255);
    SELECT ContactInfo INTO email
    FROM Artists
    WHERE ArtistID = artistID;
    RETURN email;
END;
//
DELIMITER ;

