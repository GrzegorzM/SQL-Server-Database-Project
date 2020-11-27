-- ABS
Select ABS(-11.5); -- returns: 11.5

-- CEILING
Select CEILING(13.6); -- returns: 14
Select CEILING(-13.6); -- returns: -13

-- FLOOR
Select FLOOR(13.6); -- returns: 13
Select FLOOR(-13.6); -- returns: -14

-- POWER
Select POWER(2, 3); -- returns: 8

-- SQUARE
Select SQUARE(9); -- returns: 81

-- SQRT
Select SQRT(9); -- returns: 3

-- RAND
Select RAND(1); -- returns: Always the same number between (0,1)
Select RAND(); -- returns: Diffrent number between (0,1)
Select RAND() * 100; -- returns: Diffrent decimal number between (0,100)
Select FLOOR(RAND() * 100); -- returns: Diffrent integer number between (0,100)

Declare @Counter INT;
Set @Counter = 1;
While (@Counter <= 10)
Begin
	Print FLOOR(RAND() * 100);
	Set @Counter = @Counter + 1;
End; -- returns: 10 Diffrent integer numbers between <0,99>

-- ROUND
Select ROUND(535.276, 2) -- returns: 535.280
Select ROUND(535.276, 2, 1) -- returns: 535.270
Select ROUND(535.276, 1) -- returns: 535.300
Select ROUND(535.276, 1, 1) -- returns: 535.200
Select ROUND(535.276, -2) -- returns: 500.000
Select ROUND(535.276, -1) -- returns: 540.000