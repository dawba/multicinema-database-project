IF EXISTS(select * from sys.databases where name='Cinema')
	DROP DATABASE Cinema
CREATE DATABASE Cinema

IF OBJECT_ID(N'dbo.Movies', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Movies];  
GO
CREATE TABLE [dbo].[Movies]
(
  [movieID] INT  NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [movieTitle] VARCHAR(100) NOT NULL, 
  [genre] VARCHAR(100) NOT NULL, 
  [releaseYear] INT NOT NULL, 
  [director] VARCHAR(100) NOT NULL, 
  [length] INT NOT NULL,
  [country] VARCHAR(100) NOT NULL,
  [onDisplay] VARCHAR(3) NOT NULL
) 

IF OBJECT_ID(N'dbo.Actors', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Actors];  
GO
CREATE TABLE [dbo].[Actors]
(
  [actorID] INT  NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [actorName] VARCHAR(100) NOT NULL, 
  [actorSurname] VARCHAR(100) NOT NULL, 
  [yearOfBirth] INT NOT NULL, 
  [gender] VARCHAR(1) NOT NULL,
  [country] VARCHAR(100) NOT NULL,
) 

IF OBJECT_ID(N'dbo.Cast', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Cast];  
GO
CREATE TABLE [dbo].[Cast]
(
  [movieID] INT NOT NULL,
  [actorID] INT NOT NULL, 
  [role] VARCHAR(100) NOT NULL
) 

IF OBJECT_ID(N'dbo.Products', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Products];  
GO
CREATE TABLE [dbo].[Products]
(
  [productID] INT  NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [name] VARCHAR(100) NOT NULL, 
  [retailPrice] INT NOT NULL, 
  [wholesalePrice] INT NOT NULL, 
  [pcsInStock] INT NOT NULL
) 

IF OBJECT_ID(N'dbo.Licenses', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Licenses];  
GO
CREATE TABLE [dbo].[Licenses]
(
  [movieID] INT  NOT NULL ,
  [studioID] INT NOT NULL, 
  [beginning] DATE NOT NULL, 
  [end] DATE NOT NULL, 
  [price] INT NOT NULL
) 

INSERT INTO Movies (movieTitle,genre,releaseYear,director,length,country,onDisplay)VALUES
('Godfather','crime',1972,'Francis Ford Coppola',170,'USA','YES'),
(' The Shawshank Redemption','drama',1994,'Frank Darabont',142,'USA','YES'),
('Schindlers List','history',1993,'Steven Spielberg',195,'USA','YES'),
('Forrest Gump','comedy',1994,'Robert Zemeckis',142,'USA','YES'),
('12 Angry Men','crime',1957,'Sidney Lumet',96,'USA','NO'),
('Star Wars: Episode IV - A New Hope','Fantasy',1977,'George Lucas',121,'USA','YES'),
('The Silence of the Lambs','thriller',1991,'Jonathan Demme',118,'USA','YES'),
('Intouchables','comedy',2011,'Oliver Nakache',112,'France','NO'),
('La vita è bella','war',1997,'Roberto Benigni',116,'Italy','YES'),
('Fight Club','thriller',1999,'David Fincher',139,'USA','NO'),
('Joker','action',2019,'Todd Phillips',122,'USA','YES'),
('Django Unchained','western',2012,'Quentin Tarantino',165,'USA','YES'),
('Gran Torino','drama',2008,'Clint Eastwood',116,'USA','YES'),
('Good Will Hunting','drama',1997,'Gus Van Sant',124,'USA','YES'),
('Léon','thriller',1994,'Luc Besson',110,'France','NO'),
('The Good The Bad and The Ugly','western',1966,'Todd Phillips',179,'Italy','NO'),
('Inglourious Basterds','war',2009,'Quentin Tarantino',170,'USA','YES'),
('Avatar: The Way of Water','sci-fi',2022,'James Cameron',192,'USA','YES') 


INSERT INTO Actors(actorName,actorSurname,yearOfBirth,gender,country) VALUES
('Marlon','Brando',1924,'M','USA'),
('Al','Pacino',1940,'M','USA'), 
('Morgan','Freeman',1937,'M','USA'),
('Tim','Robbins',1958,'M','USA'),
('Liam','Neeson',1952,'M','USA'),
('Embeth', 'Davidtz',1965,'F','USA'),
('Tom','Hanks',1956,'M','USA'),
('Robin','Right',1966,'F','USA'),
('Mark','Hamill',1951,'M','USA'),
('Harrison','Ford',1942,'M','USA'),
('Carrie','Fisher',1956,'F','USA'),
('Anthony' ,'Hopkins',1937,'M','USA'),
('Jodie','Foster',1962,'F','USA')

INSERT INTO Cast(movieID,actorID,role) VALUES 
(1,1,'Michael Corleone'),
(1,2,'Don Vito Corleone'),
(2,3,'Ellis Boyd "Red" Redding'),
(2,4,'Andy Dufresne'),
(3,5,'Oskar Schindler'),
(3,6,'Helen Hirsch'),
(4,7,'Forrest Gump'),
(4,8,'Jenny Curran'),
(5,9,'Luke Skywalker'),
(5,10,'Han Solo'),
(5,11,'Princess Leia'),
(6,12,'Dr Hannibal Lecter'),
(6,13,'Clarice Starling') 

INSERT INTO Products(name,retailPrice,wholesalePrice,pcsInStock) VALUES
('fries',15,3,784),
('popcorn',12,2,1542),
('nachos',23,6,422),
('salsa dip',5,1,123),
('cheese dip',6,2,45),
('coke',7,1,4561),
('water',5,1,7842)


