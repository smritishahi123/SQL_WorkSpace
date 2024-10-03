--1-10

SELECT sname, age
FROM sailor;

SELECT sname AS names_of_sailors, age + 2 AS new_age
FROM sailor;

SELECT sname|| ' '|| mname|| ' '|| surname AS names_of_sailors, age + 2 AS new_age
FROM sailor;

SELECT *
FROM sailor
ORDER BY sname ASC;

SELECT sname
FROM sailor;

SELECT DISTINCT sname
FROM sailor;

SELECT DISTINCT sname, rating
FROM sailor
WHERE rating BETWEEN 5 AND 10;

SELECT *
FROM sailor
ORDER BY rating ASC, age DESC;

SELECT *
FROM sailor
WHERE rating > 7;

SELECT *
FROM sailor
WHERE sname = 'Horatio ' AND age = 35.4;

SELECT *
FROM sailor
WHERE sname = 'Horatio' OR age = 35.4;

--11-25

SELECT s.sname
FROM sailor s
JOIN reserve r ON s.sid = r.sid
WHERE r.bid = 104;

SELECT DISTINCT s.sid
FROM sailor s
JOIN reserve r ON s.sid = r.sid
JOIN boat b ON r.bid = b.bid
WHERE b.color = 'red';

SELECT *
FROM sailor
WHERE sname LIKE 'B%';

SELECT *
FROM sailor
WHERE sname LIKE '%b%';

SELECT sname
FROM sailor
WHERE mname IS NOT NULL;

SELECT sname
FROM sailor
WHERE mname IS NULL;

SELECT DISTINCT b.color
FROM sailor s
JOIN reserve r ON s.sid = r.sid
JOIN boat b ON r.bid = b.bid
WHERE s.sname = 'Lubber';

SELECT COUNT(*) AS no_of_boats_reserved
FROM reserve r
JOIN sailor s ON r.sid = s.sid
WHERE s.sname = 'Fredico';

SELECT DISTINCT s.sid,sname,rating+1 
FROM sailor s, reserve r1 , reserve r2  
WHERE s.sid=r1.sid AND s.sid=r2.sid AND r1.day=r2.day AND r1.bid!=r2.bid;

SELECT sname
FROM sailor
WHERE LENGTH(sname)>=3 AND sname LIKE 'B%b';

SELECT sname
FROM sailor
WHERE LENGTH(sname)>=3 AND sname LIKE 'B_%b';

SELECT DISTINCT s.sname
FROM sailor s
JOIN reserve r ON s.sid=r.sid
JOIN boat b ON r.bid=b.bid
WHERE b.color IN ('red','green');

SELECT DISTINCT s.sname
FROM sailor s
JOIN reserve r ON s.sid=r.sid
JOIN boat b ON r.bid=b.bid
WHERE b.color ='red'
AND s.sid NOT IN (
	SELECT s.sid
	FROM sailor s
	JOIN reserve r ON s.sid=r.sid
	JOIN boat b ON r.bid=b.bid
	WHERE b.color ='green'
);


SELECT DISTINCT s.sname
FROM sailor s
JOIN reserve r ON s.sid=r.sid
JOIN boat b ON r.bid=b.bid
WHERE b.bname IN ='103';
	
	
	
SELECT * 
FROM Sailor
WHERE rating > SOME (
	SELECT rating
	FROM sailor
	WHERE sname LIKE 'Horatio'
);

SELECT * 
FROM Sailor
WHERE rating > ALL (
	SELECT rating
	FROM sailor
	WHERE sname LIKE 'Horatio'
);

SELECT * 
FROM Sailor
WHERE rating < SOME (
	SELECT rating
	FROM sailor
	WHERE sname LIKE 'Horatio'
);

SELECT * 
FROM Sailor
WHERE rating < ALL (
	SELECT rating
	FROM sailor
	WHERE sname LIKE 'Horatio'
);

SELECT *
FROM sailor
WHERE sname NOT IN ('Lubber','Horatio');

SELECT sname
FROM sailor
WHERE rating<ALL (7,8,9);

SELECT sname
FROM sailor
WHERE rating<SOME (7,8,9);

SELECT sname
FROM sailor
WHERE rating>ALL (7,8,9);

SELECT sname
FROM sailor
WHERE rating>SOME (7,8,9);

SELECT AVG(age) AS avg_age
FROM sailor
WHERE rating = 10;

SELECT sname
FROM sailor
WHERE age > (
	SELECT MAX(age)
	FROM sailor
	WHERE rating = 10
);

--40

SELECT rating,AVG(age) AS avg_age
FROM sailor
GROUP BY rating
HAVING COUNT(*) >=2;

SELECT b.bid,COUNT(r.bid) AS num_reservations
FROM boat b
LEFT JOIN reserve r ON b.bid = r.bid
WHERE b.color = 'red'
GROUP BY b.bid;

SELECT sname
FROM sailor
WHERE rating = (
	SELECT MAX(rating)
	FROM sailor
);

SELECT rating
FROM sailor
GROUP BY rating
HAVING AVG(age) = (
	SELECT MIN(AVG(age))
	FROM sailor
	GROUP BY rating
);
	

SELECT sname
FROM sailor s
WHERE NOT EXISTS (
	SELECT b.bid
	FROM boat b
	WHERE NOT EXISTS (
		SELECT 1
		FROM reserve r
		WHERE r.sid=s.sid AND r.bid=b.bid
	)
);

--

SELECT rating, MIN(age) AS youngest_age
FROM sailor
GROUP BY rating;

SELECT rating, sname 
FROM sailor
WHERE age>=18;

SELECT rating, MIN(age) AS youngest_eligible_age
FROM sailor
WHERE age>=18
GROUP BY rating
HAVING COUNT(*)>=2;
