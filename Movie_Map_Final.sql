

SELECT DISTINCT A."country",total_movies,total_budget,A."Capital",A."CapitalLatitude",A."CapitalLongitude"
INTO public."Movie_Map_Final"
FROM public."Movie_Map" A
LEFT JOIN (SELECT "country",sum(budget) AS "total_budget" from public."Movie_Map" group by "country") B
	ON A."country"= B."country"
LEFT JOIN (SELECT "country",count(movie_title) AS "total_movies" from public."Movie_Map" group by "country") C
	ON A."country" = C."country"
LEFT JOIN (SELECT "country",avg(imdb_score) AS "avg_imdb"  from public."Movie_Map" group by "country") D
	ON A."country" = D."country"
	
SELECT * FROM public."Movie_Map_Final"