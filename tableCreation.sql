IF EXISTS(select *
          from sys.databases
          where name = 'Cinema')
    DROP DATABASE Cinema
CREATE DATABASE Cinema 

IF OBJECT_ID(N'dbo.Movies', N'U') IS NOT NULL
    DROP TABLE [dbo].[Movies];
GO
CREATE TABLE [dbo].[Movies]
(
    [movieID]     INT          NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [movieTitle]  VARCHAR(100) NOT NULL,
    [genre]       VARCHAR(100) NOT NULL,
    [releaseYear] INT          NOT NULL,
    [director]    VARCHAR(100) NOT NULL,
    [length]      INT          NOT NULL,
    [country]     VARCHAR(100) NOT NULL,
    [onDisplay]   VARCHAR(3)   NOT NULL
)

IF OBJECT_ID(N'dbo.Actors', N'U') IS NOT NULL
    DROP TABLE [dbo].[Actors];
GO
CREATE TABLE [dbo].[Actors]
(
    [actorID]      INT          NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [actorName]    VARCHAR(100) NOT NULL,
    [actorSurname] VARCHAR(100) NOT NULL,
    [yearOfBirth]  INT          NOT NULL,
    [gender]       VARCHAR(1)   NOT NULL,
    [country]      VARCHAR(100) NOT NULL,
)

IF OBJECT_ID(N'dbo.Cast', N'U') IS NOT NULL
    DROP TABLE [dbo].[Cast];
GO
CREATE TABLE [dbo].[Cast]
(
    [movieID] INT          NOT NULL,
    [actorID] INT          NOT NULL,
    [role]    VARCHAR(100) NOT NULL
)

IF OBJECT_ID(N'dbo.Clients', N'U') IS NOT NULL
    DROP TABLE [dbo].[Clients];
GO
CREATE TABLE [dbo].[Clients]
(
    [clientID]    INT           NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [name]        NVARCHAR(100) NOT NULL,
    [surname]     NVARCHAR(100) NOT NULL,
    [email]       VARCHAR(100),
    [phoneNumber] VARCHAR(9),
    [newsletter]  BIT,
)

IF OBJECT_ID(N'dbo.Reservations', N'U') IS NOT NULL
    DROP TABLE [dbo].[Reservations];
GO
CREATE TABLE [dbo].[Reservations]
(
    [reservationID] INT          NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [showingID]     INT          NOT NULL,
    [ticketType]    VARCHAR(100) NOT NULL,
    [seatID]        INT          NOT NULL,
    [employeeID]    INT,
    [sold]          DATE         NOT NULL,
    [clientID]      INT          NOT NULL,
)

IF OBJECT_ID(N'dbo.Seats', N'U') IS NOT NULL
    DROP TABLE [dbo].[Seats];
GO
CREATE TABLE [dbo].[Seats]
(
    [seatID]     INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [hallID]     INT NOT NULL,
    [row]        INT NOT NULL,
    [seatNumber] INT NOT NULL,
)

IF OBJECT_ID(N'dbo.Employees', N'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
CREATE TABLE [dbo].[Employees]
(
    [employeeID]  INT           NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [name]        NVARCHAR(100) NOT NULL,
    [surname]     NVARCHAR(100) NOT NULL,
    [sex]         VARCHAR(1)    NOT NULL,
    [dateOfBirth] DATE          NOT NULL,
    [postID]      INT           NOT NULL,
)

IF OBJECT_ID(N'dbo.Shifts', N'U') IS NOT NULL
    DROP TABLE [dbo].[Shifts];
GO
CREATE TABLE [dbo].[Shifts]
(
    [employeeID] INT      NOT NULL,
    [start]      DATETIME NOT NULL,
    [end]        DATETIME NOT NULL,
)

IF OBJECT_ID(N'dbo.Posts', N'U') IS NOT NULL
    DROP TABLE [dbo].[Posts];
GO
CREATE TABLE [dbo].[Posts]
(
    [postID] INT          NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [post]   VARCHAR(100) NOT NULL,
    [wage]   INT          NOT NULL,
)

IF OBJECT_ID(N'dbo.Showings', N'U') IS NOT NULL
    DROP TABLE [dbo].[Showings];
GO
CREATE TABLE [dbo].[Showings]
(
    [showingID]     INT  NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [hallID]        INT  NOT NULL,
    [moveID]        INT  NOT NULL,
    [date]          DATE NOT NULL,
    [standardPrice] INT  NOT NULL,
    [reducedPrice]  INT  NOT NULL,
    [ticketsBought] INT  NOT NULL
)

IF OBJECT_ID(N'dbo.TransactionList', N'U') IS NOT NULL
    DROP TABLE [dbo].[TransactionList];
GO
CREATE TABLE [dbo].[TransactionList]
(
    [employeeID] INT  NOT NULL,
    [date]       DATE NOT NULL,
    [amount]     INT  NOT NULL,
    [productID]  INT NOT NULL,
)
IF OBJECT_ID(N'dbo.Products', N'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
CREATE TABLE [dbo].[Products]
(
    [productID]  INT  NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [name]       VARCHAR(100) NOT NULL,
    [retailPrice]     INT  NOT NULL,
    [wholesalePrice]  INT NOT NULL,
    [pcsInStock]  INT NOT NULL
) 
IF OBJECT_ID(N'dbo.Studios', N'U') IS NOT NULL
    DROP TABLE [dbo].[Studios];
GO
CREATE TABLE [dbo].[Studios]
(
    [studioID] INT  NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [studioName]       VARCHAR(100) NOT NULL,
    [contactInfo]     VARCHAR(100)  NOT NULL
) 
IF OBJECT_ID(N'dbo.Licenses', N'U') IS NOT NULL
    DROP TABLE [dbo].[Licenses];
GO
CREATE TABLE [dbo].[Licenses]
(
    [studioID] INT  NOT NULL ,
    [movieID]       INT NOT NULL,
    [start]     DATE  NOT NULL,
    [finish] DATE NOT NULL, 
    [price] INT NOT NULL
) 

IF OBJECT_ID(N'dbo.Orders', N'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
CREATE TABLE [dbo].[Orders]
(
    [productID] INT  NOT NULL ,
    [quantity]   INT NOT NULL,
    [orderPrice]    INT  NOT NULL,
    [orderDate] DATE NOT NULL, 
    [status] VARCHAR(20) NOT NULL
)  

IF OBJECT_ID(N'dbo.Halls', N'U') IS NOT NULL
    DROP TABLE [dbo].[Halls];
GO
CREATE TABLE [dbo].[Halls]
(
    [hallID] INT  NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [colour]       VARCHAR(100) NOT NULL,
    [capacity]     INT  NOT NULL
) 

INSERT INTO Movies (movieTitle, genre, releaseYear, director, length, country, onDisplay)
VALUES ('Godfather', 'crime', 1972, 'Francis Ford Coppola', 170, 'USA', 'YES'),
       ('The Shawshank Redemption', 'drama', 1994, 'Frank Darabont', 142, 'USA', 'YES'),
       ('Schindlers List', 'history', 1993, 'Steven Spielberg', 195, 'USA', 'YES'),
       ('Forrest Gump', 'comedy', 1994, 'Robert Zemeckis', 142, 'USA', 'YES'),
       ('12 Angry Men', 'crime', 1957, 'Sidney Lumet', 96, 'USA', 'NO'),
       ('Star Wars: Episode IV - A New Hope', 'Fantasy', 1977, 'George Lucas', 121, 'USA', 'YES'),
       ('The Silence of the Lambs', 'thriller', 1991, 'Jonathan Demme', 118, 'USA', 'YES'),
       ('Intouchables', 'comedy', 2011, 'Oliver Nakache', 112, 'France', 'NO'),
       (N'La vita è bella', 'war', 1997, 'Roberto Benigni', 116, 'Italy', 'YES'),
       ('Fight Club', 'thriller', 1999, 'David Fincher', 139, 'USA', 'NO'),
       ('Joker', 'action', 2019, 'Todd Phillips', 122, 'USA', 'YES'),
       ('Django Unchained', 'western', 2012, 'Quentin Tarantino', 165, 'USA', 'YES'),
       ('Gran Torino', 'drama', 2008, 'Clint Eastwood', 116, 'USA', 'YES'),
       ('Good Will Hunting', 'drama', 1997, 'Gus Van Sant', 124, 'USA', 'YES'),
       (N'Léon', 'thriller', 1994, 'Luc Besson', 110, 'France', 'NO'),
       ('The Good The Bad and The Ugly', 'western', 1966, 'Todd Phillips', 179, 'Italy', 'NO'),
       ('Inglourious Basterds', 'war', 2009, 'Quentin Tarantino', 170, 'USA', 'YES'),
       ('Avatar: The Way of Water', 'sci-fi', 2022, 'James Cameron', 192, 'USA', 'YES')


INSERT INTO Actors(actorName, actorSurname, yearOfBirth, gender, country)
VALUES ('Marlon', 'Brando', 1924, 'M', 'USA'),
       ('Al', 'Pacino', 1940, 'M', 'USA'),
       ('Morgan', 'Freeman', 1937, 'M', 'USA'),
       ('Tim', 'Robbins', 1958, 'M', 'USA'),
       ('Liam', 'Neeson', 1952, 'M', 'USA'),
       ('Embeth', 'Davidtz', 1965, 'F', 'USA'),
       ('Tom', 'Hanks', 1956, 'M', 'USA'),
       ('Robin', 'Right', 1966, 'F', 'USA'),
       ('Mark', 'Hamill', 1951, 'M', 'USA'),
       ('Harrison', 'Ford', 1942, 'M', 'USA'),
       ('Carrie', 'Fisher', 1956, 'F', 'USA'),
       ('Anthony', 'Hopkins', 1937, 'M', 'USA'),
       ('Jodie', 'Foster', 1962, 'F', 'USA'),
	   ('François', 'Cluzet',1955,'M','France'),
    ('Brad','Pitt',1963,'M','USA'),
    ('Robert','De Niro',1943,'M','USA'),
    ('Leonardo','Di Caprio',1974,'M','USA'),
    ('Clint','Eastwood',1930,'M','USA'), 
    ('Matt','Damon',1970,'M','USA'),
    ('Jean','Reno',1948,'M','France'),
    ('Kate','Winslet',1975,'F','USA')
		


		
		

INSERT INTO Cast(movieID, actorID, role)
VALUES (1, 1, 'Michael Corleone'),
       (1, 2, 'Don Vito Corleone'),
       (2, 3, 'Ellis Boyd "Red" Redding '),
       (2, 4, 'Andy Dufresne'),
       (3, 5, 'Oskar Schindler'),
       (3, 6, 'Helen Hirsch'),
       (4, 7, 'Forrest Gump'),
       (4, 8, 'Jenny Curran'),
       (5, 9, 'Luke Skywalker'),
       (5, 10, 'Han Solo'),
       (5, 11, 'Princess Leia'),
       (6, 12, 'Dr Hannibal Lecter'),
       (6, 13, 'Clarice Starling'),
	    (7, 14, 'Philippe'),
		(9, 15, 'Tyler Durden'),
		(10, 16, 'Murray Franklin'),
		(11, 17, 'Calvin Candie'),
		(12, 18, 'Walt Kowalski'),
		(13, 19, 'Will Hunting'),
		(14, 20, 'Leon'), 
		(15,18,'the Man with No Name'),
		(16,15,'Lieutenant Aldo Raine'),
		(18,21,'Ronal')

INSERT INTO Products(name,retailPrice,wholesalePrice,pcsInStock) VALUES
('fries',15,3,784),
('popcorn',12,2,1542),
('nachos',23,6,422),
('salsa dip',5,1,123),
('cheese dip',6,2,45),
('coke',7,1,4561),
('water',5,1,7842)

INSERT INTO Studios(studioName,contactInfo) VALUES
('Paramount Pictures','Carl Warback - 987883737'),
('Columbia Pictures','John Dew - 564206988'),
('Universal Pictures','Grubolini Gruby - 42069999292'),
('United Artists','Jan Kowalski - 12342534534'),
('Lucasfilms','Darth Vader - 666666666'),
('Orion Pictures','Hannie Lecture 452165154'),
('Gaumont','Adrian Nowak - 93883899823'),
 ('Melampo Cinematografica','Zalno Adrian - 3259235'),
 ('20th Century Fox','Patt Bridd - 983453452'),
 ('Warner Bros Pictures','Matheo Moravietti - 298352983'), 
 ('Miramax Films','Matheo Demonno - 2123352983'), 
 ('Les Films du Dauphin','Bildung Ist - 1123352983')
 
 


INSERT INTO Licenses(studioID,movieID,start,finish,price) VALUES
(1,1,N'2020-10-10',N'2022-12-15',12000),
(1,4,N'2017-01-10',N'2023-12-09',154200),
(2,2,N'2015-01-10',N'2022-11-12',17500),
(3,3,N'2021-01-17',N'2023-05-17',17125),
(4,5,N'1999-01-10',N'2017-02-19',10000),
(5,6,N'1978-01-10',N'2018-02-19',13000),
(6,7,N'2013-01-10',N'2019-03-29',100400),
(7,8,N'2014-01-10',N'2016-03-29',14400),
(8,9,N'2003-01-10',N'2021-03-29',177400),
(9,10,N'2013-01-10',N'2022-03-29',17400),
(10,11,N'2019-01-10',N'2022-03-19',23400),
(2,12,N'2012-01-10',N'2024-03-19',144300),
(10,13,N'2014-31-12',N'2023-05-19',233400),
(11,14,N'2012-31-12',N'2023-10-19',123400),
(12,15,N'2022-31-12',N'2023-10-19',1234),
(9,16,N'2008-31-12',N'2022-10-19',15234),
(3,17,N'2018-31-12',N'2022-10-19',185234),
(9,18,N'2018-31-12',N'2022-10-19',185234)




INSERT INTO Orders(productID,quantity,orderPrice,orderDate,[status]) VALUES
(1,790,3*790,N'2022-01-15','1'),
(2,1550,3100,N'2022-01-15','1'),
(3,430,6*430,N'2022-01-15','1'),
(4,125,125,N'2022-01-15','1'),
(5,50,100,N'2022-01-15','1'),
(6,4570,4570,N'2022-01-15','1'),
(7,7850,7850,N'2022-01-15','1') 

INSERT INTO Halls(colour,capacity) VALUES
('blue',10),
('red',20),
('green',30)
