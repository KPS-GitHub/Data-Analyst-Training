-- overall instructions: for each table that is made up of only an id column and multiple columns for the same type of data (all tables except "basics"), create a new table that consists of only an id column and a single main data column so that it's easier to query because you only have one column to deal with (might be other reasons for doing this but that's what makes intuitive sense to me)

-- inspect old table to see how many columns to pull from below
SELECT * FROM netflix_data.directors;

DROP TABLE IF EXISTS netflix_data.netflix_directors;

CREATE TABLE netflix_data.netflix_directors as
(
	SELECT * 
	FROM
	(
		SELECT id, director_1 as director FROM netflix_data.directors
		UNION
		SELECT id, director_2 as director FROM netflix_data.directors
		UNION
		SELECT id, director_3 as director FROM netflix_data.directors
		UNION
		SELECT id, director_4 as director FROM netflix_data.directors
		UNION
		SELECT id, director_5 as director FROM netflix_data.directors
		UNION
		SELECT id, director_6 as director FROM netflix_data.directors
		UNION
		SELECT id, director_7 as director FROM netflix_data.directors
		UNION
		SELECT id, director_8 as director FROM netflix_data.directors
		UNION
		SELECT id, director_9 as director FROM netflix_data.directors
		UNION
		SELECT id, director_10 as director FROM netflix_data.directors
		UNION
		SELECT id, director_11 as director FROM netflix_data.directors
		UNION
		SELECT id, director_12 as director FROM netflix_data.directors
		UNION
		SELECT id, director_13 as director FROM netflix_data.directors
		UNION
		SELECT id, director_14 as director FROM netflix_data.directors
		UNION
		SELECT id, director_15 as director FROM netflix_data.directors
		UNION
		SELECT id, director_16 as director FROM netflix_data.directors
		UNION
		SELECT id, director_17 as director FROM netflix_data.directors
		UNION
		SELECT id, director_18 as director FROM netflix_data.directors
		UNION
		SELECT id, director_19 as director FROM netflix_data.directors
		UNION
		SELECT id, director_20 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_21 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_22 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_23 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_24 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_25 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_26 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_27 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_28 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_29 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_30 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_31 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_32 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_33 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_34 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_35 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_36 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_37 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_38 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_39 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_40 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_41 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_42 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_43 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_44 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_45 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_46 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_47 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_48 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_49 as director FROM netflix_data.directors
-- 		UNION
-- 		SELECT id, director_50 as director FROM netflix_data.directors
	) AS tempTable
	WHERE director IS NOT NULL AND director NOT LIKE '%NULL%'
)
;

-- CAUTION - only once you have confirmed that the new table is created correctly, then drop the old table
-- DROP TABLE netflix_data.directors;


-- inspect new table to see if it looks right
SELECT *
FROM netflix_data.netflix_directors
-- WHERE id="s10"
;


