CREATE DATABASE MovieRental

-- Create Tables
CREATE TABLE AppUser ( -- NOTE: leaving out dateJoined for now because this causing errors with DATETIME
    userID int NOT NULL,
    username VARCHAR(50) NOT NULL,
    [password] VARCHAR(1000) NOT NULL,
    isActiveAccount BIT NOT NULL
    CONSTRAINT AppUser_PK PRIMARY KEY (userID)
);

CREATE TABLE ProductionCompany(
    productionID int NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    headquarters VARCHAR(2) NOT NULL -- Setting this to two because I think we decided we were just going to say state?
    CONSTRAINT ProductionCompany_PK PRIMARY KEY (productionID)
);

CREATE TABLE MovieGenre(
    movieID int NOT NULL,
    genre VARCHAR(50) NOT NULL CHECK(genre IN('Comedy', 'Horror', 'Romance', 'Action', 'Thriller', 'Science Fiction', 'Drama', 'Documentary')),
    CONSTRAINT MovieGenre_PK PRIMARY KEY (movieID, genre)
);

CREATE TABLE Actor(
    actorID int NOT NULL,
    [name] VARCHAR(50),
    age int NOT NULL
    CONSTRAINT Actor_PK PRIMARY KEY (actorID)
);

CREATE TABLE Director (
    directorID int NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    age int NOT NULL
    CONSTRAINT Director_PK PRIMARY KEY(directorID)
);

CREATE TABLE [Role] (
    roleID int NOT NULL,
    roleName VARCHAR(50) CHECK(roleName IN ('Admin', 'Common User', 'Distributer', 'Renter')),
    CONSTRAINT Role_PK PRIMARY KEY (roleID)
);

CREATE TABLE Movie (
    movieID int NOT NULL,
    title VARCHAR(100) NOT NULL,
    runtime int NOT NULL, -- Maybe datetime object? Represent in minutes, convert to hours if needed
    productionID int NOT NULL,
    originalLanguage VARCHAR(50) NOT NULL CHECK(originalLanguage IN ('English', 'Spanish', 'French', 'Italian', 'Japanese', 'Korean', 'Portugese', 'Chinese')),
    [day] VARCHAR(2) NOT NULL,
    [month] VARCHAR(9) NOT NULL,
    [year] VARCHAR(4) NOT NULL
    CONSTRAINT Movie_PK PRIMARY KEY (movieID),
    CONSTRAINT Movie_Production_FK FOREIGN KEY (productionID) REFERENCES ProductionCompany(productionID)
);

CREATE TABLE Review (
    movieID int NOT NULL,
    userID int NOT NULL,
    reviewID int NOT NULL,
    rating int NOT NULL,
    comment VARCHAR(256)
    CONSTRAINT Review_PK PRIMARY KEY (movieID, userID, reviewID),
    CONSTRAINT Review_Movie_FK FOREIGN KEY (movieID) REFERENCES Movie(movieID),
    CONSTRAINT Review_User_FK FOREIGN KEY (userID) REFERENCES AppUser(userID)
);

CREATE TABLE ActsIn(
    movieID int NOT NULL,
    actorID int NOT NULL
    CONSTRAINT ActsIn_PK PRIMARY KEY (movieID, actorID),
    CONSTRAINT ActsIn_Movie_FK FOREIGN KEY (movieID) REFERENCES Movie(movieID),
    CONSTRAINT ActsIn_Actor_FK FOREIGN KEY (actorID) REFERENCES Actor(actorID)
);

CREATE TABLE DirectorMovie(
    directorID int NOT NULL,
    movieID int NOT NULL
    CONSTRAINT DirectorMovie_PK PRIMARY KEY (directorID, movieID),
    CONSTRAINT DirectorMovie_Director_FK FOREIGN KEY (directorID) REFERENCES Director(directorID),
    CONSTRAINT DirectorMovie_Movie_FK FOREIGN KEY (movieID) REFERENCES Movie(movieID)
);

CREATE TABLE UserRole (
    roleID int NOT NULL,
    userID int NOT NULL
    CONSTRAINT UserRole_PK PRIMARY KEY (roleID, userID),
    CONSTRAINT UserRole_Role_FK FOREIGN KEY (roleID) REFERENCES [Role](roleID),
    CONSTRAINT UserRole_User_FK FOREIGN KEY (userID) REFERENCES AppUser(userID)
);

CREATE TABLE UserMovie (
    movieID int NOT NULL,
    userID int NOT NULL
    CONSTRAINT UserMovie_PK PRIMARY KEY (movieID, userID),
    CONSTRAINT UserMovie_Movie_FK FOREIGN KEY (movieID) REFERENCES Movie(movieID),
    CONSTRAINT UserMovie_User_FK FOREIGN KEY (userID) REFERENCES AppUser(userID)
);


INSERT INTO AppUser (userID, username, password, isActiveAccount) VALUES
(1, 'john_doe', 'password123', 1),
(2, 'jane_smith', 'password456', 1),
(3, 'mike_jones', 'password789', 1),
(4, 'lisa_williams', 'password101112', 1),
(5, 'david_taylor', 'password131415', 1),
(6, 'emma_martin', 'password161718', 1),
(7, 'oliver_lee', 'password192021', 1),
(8, 'sophia_thomas', 'password222324', 1),
(9, 'liam_harris', 'password252627', 1),
(10, 'ava_scott', 'password282930', 1),
(11, 'william_adams', 'password313233', 1),
(12, 'mia_turner', 'password343536', 1),
(13, 'james_perez', 'password373839', 1),
(14, 'amelia_thompson', 'password404142', 1),
(15, 'benjamin_white', 'password434445', 1),
(16, 'charlotte_anderson', 'password464748', 1),
(17, 'elijah_jackson', 'password495051', 1),
(18, 'isabella_clark', 'password525354', 1),
(19, 'lucas_martinez', 'password555657', 1),
(20, 'mason_rodriguez', 'password585960', 1),
(21, 'harper_lewis', 'password616263', 1),
(22, 'ethan_king', 'password646566', 1),
(23, 'evelyn_hill', 'password676869', 1),
(24, 'alexander_allen', 'password707172', 1),
(25, 'abigail_wright', 'password737475', 1),
(26, 'henry_lopez', 'password767778', 1),
(27, 'scarlett_evans', 'password798081', 1),
(28, 'sebastian_carter', 'password828384', 1),
(29, 'aiden_green', 'password858687', 1),
(30, 'grace_baker', 'password888990', 1);



INSERT INTO ProductionCompany (productionID, name, headquarters) VALUES
(1, 'Warner Bros.', 'CA'),
(2, 'Paramount Pictures', 'CA'),
(3, 'Universal Pictures', 'CA'),
(4, '20th Century Fox', 'CA'),
(5, 'Walt Disney Pictures', 'CA'),
(6, 'DreamWorks Pictures', 'CA'),
(7, 'New Line Cinema', 'CA'),
(8, 'Marvel Studios', 'CA'),
(9, 'Lucasfilm', 'CA'),
(10, 'Studio Ghibli', 'JP'),
(11, 'Pixar Animation Studios', 'CA'),
(12, 'Sony Pictures Entertainment', 'CA'),
(13, 'Columbia Pictures', 'CA'),
(14, 'Metro-Goldwyn-Mayer (MGM)', 'CA'),
(15, 'Legendary Pictures', 'CA'),
(16, 'Lionsgate Films', 'CA'),
(17, 'Miramax', 'CA'),
(18, 'Focus Features', 'CA'),
(19, 'A24', 'NY'),
(20, 'Blumhouse Productions', 'CA'),
(21, 'Regency Enterprises', 'CA'),
(22, 'TriStar Pictures', 'CA'),
(23, 'Village Roadshow Pictures', 'CA'),
(24, 'Plan B Entertainment', 'CA'),
(25, 'Summit Entertainment', 'CA'),
(26, 'Fox Searchlight Pictures', 'CA'),
(27, 'Amblin Entertainment', 'CA'),
(28, 'Annapurna Pictures', 'CA'),
(29, 'Bad Robot Productions', 'CA'),
(30, 'Imagine Entertainment', 'CA');

---SELECT * FROM ProductionCompany;

INSERT INTO MovieGenre (movieID, genre) VALUES
(1, 'Comedy'),
(2, 'Horror'),
(3, 'Romance'),
(4, 'Action'),
(5, 'Thriller'),
(6, 'Science Fiction'),
(7, 'Drama'),
(8, 'Documentary');


INSERT INTO Actor (actorID, name, age) VALUES
(1, 'Leonardo DiCaprio', 48),
(2, 'Song Kang-ho', 56),
(3, 'Marlon Brando', 80),
(4, 'Matthew McConaughey', 53),
(5, 'Christian Bale', 49),
(6, 'John Travolta', 69),
(7, 'Liam Neeson', 71),
(8, 'Rumi Hiiragi', 35),
(9, 'Elijah Wood', 42),
(10, 'Brad Pitt', 60),
(11, 'Tom Hanks', 67),
(12, 'Keanu Reeves', 59),
(13, 'James Earl Jones', 92),
(14, 'Russell Crowe', 59),
(15, 'Morgan Freeman', 87),
(16, 'Robert Downey Jr.', 58),
(17, 'Sam Worthington', 47),
(18, 'Kate Winslet', 48),
(19, 'Jeff Goldblum', 71),
(20, 'Mark Hamill', 72),
(21, 'Harrison Ford', 81),
(22, 'Viggo Mortensen', 65),
(23, 'Michael J. Fox', 62),
(24, 'Tom Hanks', 67),
(25, 'Gael García Bernal', 45),
(26, 'Ryan Gosling', 43),
(27, 'Idina Menzel', 52),
(28, 'Daniel Radcliffe', 34),
(29, 'Jesse Eisenberg', 40),
(30, 'Tom Hardy', 46);

INSERT INTO Director (directorID, name, age) VALUES
(1, 'Christopher Nolan', 53),
(2, 'Bong Joon-ho', 54),
(3, 'Francis Ford Coppola', 85),
(4, 'Steven Spielberg', 77),
(5, 'Quentin Tarantino', 61),
(6, 'Peter Jackson', 62),
(7, 'Hayao Miyazaki', 83),
(8, 'Ridley Scott', 86),
(9, 'James Cameron', 69),
(10, 'George Lucas', 80),
(11, 'David Fincher', 61),
(12, 'Martin Scorsese', 81),
(13, 'Alfonso Cuarón', 62),
(14, 'Patty Jenkins', 52),
(15, 'Damien Chazelle', 39),
(16, 'Sam Mendes', 58),
(17, 'Guy Ritchie', 55),
(18, 'Greta Gerwig', 40),
(19, 'Ryan Coogler', 38),
(20, 'Denis Villeneuve', 56),
(21, 'Robert Zemeckis', 72),
(22, 'Jon Favreau', 57),
(23, 'Tim Burton', 65),
(24, 'Gore Verbinski', 60),
(25, 'Taika Waititi', 48),
(26, 'Kenneth Branagh', 63),
(27, 'J.J. Abrams', 57),
(28, 'Guillermo del Toro', 59),
(29, 'Ang Lee', 69),
(30, 'Christopher McQuarrie', 55);

INSERT INTO Role (roleID, roleName) VALUES
(1, 'Admin'),
(2, 'Common User'),
(3, 'Distributer'),
(4, 'Renter');


INSERT INTO Movie (movieID, title, runtime, productionID, originalLanguage, day, month, year) VALUES
(1, 'Inception', 148, 1, 'English', '16', 'July', '2010'),
(2, 'Parasite', 132, 19, 'Korean', '30', 'May', '2019'),
(3, 'The Godfather', 175, 2, 'English', '24', 'March', '1972'),
(4, 'Interstellar', 169, 1, 'English', '7', 'November', '2014'),
(5, 'The Dark Knight', 152, 1, 'English', '18', 'July', '2008'),
(6, 'Pulp Fiction', 154, 13, 'English', '14', 'October', '1994'),
(7, 'Schindler''s List', 195, 3, 'English', '15', 'December', '1993'),
(8, 'Spirited Away', 125, 10, 'Japanese', '20', 'July', '2001'),
(9, 'The Lord of the Rings: The Fellowship of the Ring', 178, 7, 'English', '19', 'December', '2001'),
(10, 'Fight Club', 139, 17, 'English', '15', 'October', '1999'),
(11, 'Forrest Gump', 142, 2, 'English', '6', 'July', '1994'),
(12, 'The Matrix', 136, 12, 'English', '31', 'March', '1999'),
(13, 'The Lion King', 88, 5, 'English', '24', 'June', '1994'),
(14, 'Gladiator', 155, 1, 'English', '5', 'May', '2000'),
(15, 'The Shawshank Redemption', 144, 4, 'English', '14', 'October', '1994'),
(16, 'The Avengers', 143, 8, 'English', '4', 'May', '2012'),
(17, 'Avatar', 162, 4, 'English', '18', 'December', '2009'),
(18, 'Titanic', 195, 2, 'English', '19', 'December', '1997'),
(19, 'Jurassic Park', 127, 3, 'English', '11', 'June', '1993'),
(20, 'Star Wars: Episode IV - A New Hope', 121, 9, 'English', '25', 'May', '1977'),
(21, 'The Empire Strikes Back', 124, 9, 'English', '21', 'May', '1980'),
(22, 'The Lord of the Rings: The Return of the King', 201, 7, 'English', '17', 'December', '2003'),
(23, 'Back to the Future', 116, 12, 'English', '3', 'July', '1985'),
(24, 'Toy Story', 81, 11, 'English', '22', 'November', '1995'),
(25, 'Coco', 105, 11, 'English', '22', 'November', '2017'),
(26, 'La La Land', 128, 19, 'English', '9', 'December', '2016'),
(27, 'Frozen', 102, 5, 'English', '27', 'November', '2013'),
(28, 'Harry Potter and the Sorcerer''s Stone', 152, 1, 'English', '16', 'November', '2001'),
(29, 'The Social Network', 120, 18, 'English', '1', 'October', '2010'),
(30, 'Mad Max: Fury Road', 120, 16, 'English', '15', 'May', '2015');


INSERT INTO Review (movieID, userID, reviewID, rating, comment) VALUES
(1, 1, 1, 9, 'Amazing film with a mind-bending concept!'),
(2, 2, 2, 10, 'A masterpiece that delves deep into social issues.'),
(3, 3, 3, 9, 'One of the greatest films of all time.'),
(4, 4, 4, 8, 'A beautiful journey through space and time.'),
(5, 5, 5, 10, 'One of the best superhero films ever made.'),
(6, 6, 6, 8, 'Tarantino at his finest.'),
(7, 7, 7, 10, 'Heartbreaking and uplifting at the same time.'),
(8, 8, 8, 9, 'A visually stunning animation.'),
(9, 9, 9, 9, 'Epic fantasy with incredible world-building.'),
(10, 10, 10, 9, 'A film that makes you question everything.'),
(11, 11, 11, 10, 'A heartwarming and emotional journey.'),
(12, 12, 12, 8, 'A genre-defining action film.'),
(13, 13, 13, 10, 'A timeless Disney classic.'),
(14, 14, 14, 9, 'A historical epic with incredible performances.'),
(15, 15, 15, 10, 'A touching story of hope and friendship.'),
(16, 16, 16, 9, 'A fun and thrilling superhero film.'),
(17, 17, 17, 8, 'A visually groundbreaking film.'),
(18, 18, 18, 9, 'A tragic and epic romance.'),
(19, 19, 19, 9, 'A thrilling adventure through a prehistoric world.'),
(20, 20, 20, 10, 'The film that started it all.'),
(21, 21, 21, 9, 'A worthy sequel to an all-time classic.'),
(22, 22, 22, 10, 'A perfect conclusion to an epic trilogy.'),
(23, 23, 23, 9, 'A fun and nostalgic time-travel film.'),
(24, 24, 24, 9, 'A charming and heartfelt animated film.'),
(25, 25, 25, 10, 'A beautiful tribute to family and culture.'),
(26, 26, 26, 9, 'A delightful musical with stunning performances.'),
(27, 27, 27, 8, 'A modern Disney classic.'),
(28, 28, 28, 9, 'A magical introduction to the wizarding world.'),
(29, 29, 29, 8, 'An intriguing look at the rise of social media.'),
(30, 30, 30, 10, 'An exhilarating action-packed adventure.');

INSERT INTO ActsIn (movieID, actorID) VALUES
(1, 1),  -- Inception: Leonardo DiCaprio
(2, 2),  -- Parasite: Song Kang-ho
(3, 3),  -- The Godfather: Marlon Brando
(4, 4),  -- Interstellar: Matthew McConaughey
(5, 5),  -- The Dark Knight: Christian Bale
(6, 6),  -- Pulp Fiction: John Travolta
(7, 7),  -- Schindler's List: Liam Neeson
(8, 8),  -- Spirited Away: Rumi Hiiragi
(9, 9),  -- The Lord of the Rings: Elijah Wood
(10, 10), -- Fight Club: Brad Pitt
(11, 11), -- Forrest Gump: Tom Hanks
(12, 12), -- The Matrix: Keanu Reeves
(13, 13), -- The Lion King: James Earl Jones
(14, 14), -- Gladiator: Russell Crowe
(15, 15), -- The Shawshank Redemption: Morgan Freeman
(16, 16), -- The Avengers: Robert Downey Jr.
(17, 17), -- Avatar: Sam Worthington
(18, 18), -- Titanic: Kate Winslet
(19, 19), -- Jurassic Park: Jeff Goldblum
(20, 20), -- Star Wars: Episode IV: Mark Hamill
(21, 21), -- The Empire Strikes Back: Harrison Ford
(22, 22), -- The Return of the King: Viggo Mortensen
(23, 23), -- Back to the Future: Michael J. Fox
(24, 24), -- Toy Story: Tom Hanks
(25, 25), -- Coco: Gael García Bernal
(26, 26), -- La La Land: Ryan Gosling
(27, 27), -- Frozen: Idina Menzel
(28, 28), -- Harry Potter: Daniel Radcliffe
(29, 29), -- The Social Network: Jesse Eisenberg
(30, 30); -- Mad Max: Tom Hardy

INSERT INTO DirectorMovie (directorID, movieID) VALUES
(1, 1),  -- Christopher Nolan: Inception
(2, 2),  -- Bong Joon-ho: Parasite
(3, 3),  -- Francis Ford Coppola: The Godfather
(1, 4),  -- Christopher Nolan: Interstellar
(1, 5),  -- Christopher Nolan: The Dark Knight
(5, 6),  -- Quentin Tarantino: Pulp Fiction
(6, 7),  -- Steven Spielberg: Schindler's List
(7, 8),  -- Hayao Miyazaki: Spirited Away
(6, 9),  -- Peter Jackson: The Lord of the Rings: The Fellowship of the Ring
(8, 10), -- David Fincher: Fight Club
(9, 11), -- Robert Zemeckis: Forrest Gump
(10, 12), -- Wachowski Sisters: The Matrix
(11, 13), -- Jon Favreau: The Lion King
(8, 14), -- Ridley Scott: Gladiator
(12, 15), -- Frank Darabont: The Shawshank Redemption
(13, 16), -- Joss Whedon: The Avengers
(9, 17), -- James Cameron: Avatar
(9, 18), -- James Cameron: Titanic
(6, 19), -- Steven Spielberg: Jurassic Park
(10, 20), -- George Lucas: Star Wars: Episode IV - A New Hope
(10, 21), -- George Lucas: The Empire Strikes Back
(6, 22), -- Peter Jackson: The Lord of the Rings: The Return of the King
(21, 23), -- Robert Zemeckis: Back to the Future
(13, 24), -- John Lasseter: Toy Story
(15, 25), -- Lee Unkrich: Coco
(16, 26), -- Damien Chazelle: La La Land
(13, 27), -- Chris Buck: Frozen
(14, 28), -- Chris Columbus: Harry Potter and the Sorcerer's Stone
(11, 29), -- David Fincher: The Social Network
(20, 30); -- George Miller: Mad Max: Fury Road

INSERT INTO UserRole (roleID, userID) VALUES
(1, 1),
(2, 2),
(1, 3),
(2, 4),
(1, 5);

INSERT INTO UserMovie (movieID, userID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(9, 10),
(8, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30);

-- Query 1
SELECT U.username, COUNT(UM.userID) AS NumRented
FROM AppUser U
LEFT JOIN UserMovie UM ON U.userID = UM.userID GROUP BY U.username HAVING COUNT(UM.userID) >= 3;

-- Query 2
SELECT M.title,
(SELECT AVG(R.rating)
FROM Review as R
WHERE M.movieID = R.movieID) AS avgRating
FROM Movie M
GROUP BY M.title, M.movieID HAVING (SELECT AVG(R.rating)
FROM Review as R
WHERE M.movieID = R.movieID) IS NOT NULL;

-- Query 3
SELECT D.name
FROM Director D
WHERE (SELECT COUNT(DM.movieID) FROM DirectorMovie DM WHERE DM.directorID = D.directorID) > 2;

-- Query 4
SELECT P.name, COUNT(M.movieID) AS NumMovies
FROM ProductionCompany P
JOIN Movie M ON P.productionID = M.productionID
GROUP BY P.name
ORDER BY NumMovies DESC;

-- Query 5
SELECT P.name, M.title, MAX(R.rating) AS highestRating
FROM ProductionCompany P
JOIN Movie M ON P.productionID = M.productionID
JOIN Review R ON M.movieID = R.movieID
GROUP BY P.name, M.title;

-- Query 6
SELECT A.name, AVG(R.rating) AS avgMovieRating
FROM Actor A
JOIN ActsIn AI ON A.actorID = AI.actorID
JOIN Review R ON AI.movieID = R.movieID
GROUP BY A.name;

-- Query 7
SELECT A.name, COUNT(AI.movieID) AS NumMovies
FROM Actor A
JOIN ActsIn AI ON A.actorID = AI.actorID
GROUP BY A.name
HAVING COUNT(AI.movieID) > 1;

-- Query 8
SELECT P.name AS ProductionCompany, M.title AS MovieTitle, MAX(R.rating) AS HighestRating
FROM ProductionCompany P
JOIN Movie M ON P.productionID = M.productionID
JOIN Review R ON M.movieID = R.movieID
GROUP BY P.name, M.title
ORDER BY HighestRating DESC;

-- Query 9
SELECT m.title, (SELECT COUNT(*) FROM Review r WHERE r.movieID = m.movieID) AS [numberOfReviews] FROM Movie m;

-- Query 10
SELECT DISTINCT au.username, (SELECT COUNT(*) FROM UserMovie um WHERE um.userID = au.userID) AS [numberOfMoviesRenting] FROM AppUser au JOIN UserMovie um2 ON um2.userId = au.userID;
