

--Video Game Sales Project 


-----------------------------------------------------------------------

SELECT * 
FROM Videogame 

-----------------------------------------------------------------------

--Playstation, XBOX & PC Exploration

SELECT * 
FROM Videogame 
WHERE Platform LIKE 'PS%'
OR Platform LIKE 'X%' 
OR Platform LIKE 'PC%'
AND Platform NOT LIKE 'PCX%'



--Total Videogame Sales On Playstation,XBOX & PC (In Billions)

SELECT ROUND(SUM(Global_Sales),2) TotalSales 
FROM Videogame 
WHERE Platform LIKE 'PS%'
OR Platform LIKE 'X%' 
OR Platform LIKE 'PC%'
AND Platform NOT LIKE 'PCX%'



--Global Playstation,XBOX & PC Sales By Genre & Year

SELECT Year,
       Genre,
       ROUND(SUM(Global_Sales),2) TotalGlobalSales 
FROM Videogame 
WHERE Platform LIKE 'PS%' 
OR Platform LIKE 'X%'
OR Platform LIKE 'PC%'
AND Platform NOT LIKE 'PCFX%'
	GROUP BY Year,
	         Genre
	ORDER BY TotalGlobalSales DESC



--Global Playstation,XBOX & PC Videogame Sales By Publisher & Year 

SELECT Year,
       Publisher,
       ROUND(SUM(Global_Sales),2) TotalGlobalSales 
FROM Videogame 
WHERE Platform LIKE 'PS%' 
OR Platform LIKE 'X%'
OR Platform LIKE 'PC%'
AND Platform NOT LIKE 'PCFX%'
	GROUP BY Year,
	         Publisher
	ORDER BY TotalGlobalSales DESC



--Global Playstation,XBOX & PC Platform Sales 

SELECT Platform,
       ROUND(SUM(Global_Sales),2) TotalGlobalSales 
FROM Videogame 
WHERE Platform LIKE 'PS%' 
OR Platform LIKE 'X%'
OR Platform LIKE 'PC%'
AND Platform NOT LIKE 'PCFX%'
	GROUP BY Platform
	ORDER BY TotalGlobalSales DESC



--Global Videogame Sales by Title on Playstation, XBOX & PC 


SELECT Platform,
       Name,    
       ROUND(SUM(Global_Sales),2) TotalGlobalSales 
FROM Videogame 
WHERE Platform LIKE 'PS%' 
OR Platform LIKE 'X%'
OR Platform LIKE 'PC%'
AND Platform NOT LIKE 'PCFX%'
	GROUP BY Platform,
	         Name
	ORDER BY TotalGlobalSales DESC



--EU vs. JP vs. NA Playstation,XBOX & PC Videogame Sales by Genre & Platform

SELECT Genre,Platform,
       ROUND(SUM(EU_Sales),2) Total_EU_Sales,
       ROUND(SUM(JP_Sales),2) Total_JP_Sales,
       ROUND(SUM(NA_Sales),2) Total_NA_Sales
FROM Videogame 
WHERE Platform LIKE 'PS%' 
OR Platform LIKE 'X%'
OR Platform LIKE 'PC%'
AND Platform NOT LIKE 'PCFX%'
	GROUP BY Genre,
	         Platform 
	ORDER BY Total_NA_Sales DESC

-------------------------------------------------------------------------------

--Further Exploration of the dataset 

-------------------------------------------------------------------------------

--Videogame Sales Project

SELECT * 
FROM Videogame 



--All Platforms

SELECT DISTINCT(Platform) 
FROM Videogame



--Platforms & # of Games 

SELECT Platform,
       COUNT(Name) NumGames
FROM Videogame
	GROUP BY Platform
	ORDER BY NumGames DESC



--Platform with most sells (In Millions & Billions) 

SELECT Platform, 
       ROUND(SUM(Global_Sales),2) TotalSales 
FROM Videogame 
	GROUP BY Platform 
	ORDER BY TotalSales DESC



--Publisher & # of Games 

SELECT Publisher,
       COUNT(Name) NumGames
FROM Videogame 
	GROUP BY Publisher 
	ORDER BY NumGames DESC



--Highest selling Publisher 


SELECT Publisher,
       ROUND(SUM(Global_Sales),2) TotalSales
FROM Videogame 
	GROUP BY Publisher 
	ORDER BY TotalSales DESC
	


--Genre & # of Games 

SELECT Genre,
       COUNT(Name) NumGames
FROM Videogame 
	GROUP BY Genre 
	ORDER BY NumGames DESC



--Highest Selling Genre

SELECT Genre,
       ROUND(SUM(Global_Sales),2) TotalSales
FROM Videogame 
	GROUP BY Genre
	ORDER BY TotalSales DESC



--Highest Selling Game 

SELECT Name,
       ROUND(SUM(Global_Sales),2) TotalSales 
FROM Videogame 
	GROUP BY Name
	ORDER BY TotalSales DESC



--Year with the most games 

SELECT Year,
       COUNT(Name) NumGames
FROM Videogame 
	GROUP BY Year 
	ORDER BY NumGames DESC



--Which Publisher produced the most games within any given year 

SELECT Year,
       Publisher,
       COUNT(Name) NumGames
FROM Videogame 
	GROUP BY Year,
	         Publisher
	ORDER BY NumGames DESC



--What Genre was the most produced within any given year 

SELECT Year,
       Genre,
       COUNT(Name) TotalGames
FROM Videogame 
	GROUP BY Year,
	         Genre
	ORDER BY TotalGames DESC



--Comparing the different country sales 

SELECT NA_Sales,
       EU_Sales,
       JP_Sales,
       Other_Sales,
       Global_Sales,
       (SELECT AVG(Global_Sales) * 100 FROM Videogame) Avg_Global_Sales
FROM Videogame
	ORDER BY Global_Sales DESC



--NA_Sales make up over half of the sales globally

SELECT ROUND(MAX(NA_Sales) / MAX(Global_Sales),4) * 100 NA_Sales_Percent_Total
FROM Videogame



 --Total Videogames for each platform 
 
SELECT DISTINCT(Platform),
       COUNT(Name) TotalGames
FROM Videogame
WHERE Platform LIKE 'PS%'
	GROUP BY Platform
	ORDER BY TotalGames DESC

SELECT DISTINCT(Platform),
       COUNT(Name) TotalGames
FROM Videogame
WHERE Platform LIKE 'X%'
	GROUP BY Platform
	ORDER BY TotalGames DESC

SELECT DISTINCT(Platform),
       COUNT(Name) TotalGames
FROM Videogame
WHERE Platform LIKE 'PC%'
AND Platform NOT LIKE 'PCFX%'
	GROUP BY Platform
	ORDER BY TotalGames DESC
	
	
	
--Since Shooters were the most sold, lets find which Shooter title made the most money 

SELECT Name,
       SUM(NA_Sales) Highest_Selling_Shooter 
FROM Videogame 
WHERE Genre = 'Shooter'
	GROUP BY Name
	ORDER BY Highest_Selling_Shooter DESC






