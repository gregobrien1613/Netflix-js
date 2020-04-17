--Create Master Table--
CREATE TABLE "IMDB5000" (
    "serial" serial   NOT NULL,
    "color" VARCHAR   NULL,
    "director_name" VARCHAR   NULL,
    "num_critic_for_reviews" INT   NULL,
    "duration" INT   NULL,
    "director_facebook_likes" INT   NULL,
    "actor_3_facebook_likes" INT   NULL,
    "actor_2_name" VARCHAR   NULL,
    "actor_1_facebook_likes" INT   NULL,
    "gross" INT   NULL,
    "genres" VARCHAR   NULL,
    "actor_1_name" VARCHAR   NULL,
    "movie_title" VARCHAR   NULL,
    "num_voted_users" INT   NULL,
    "cast_total_facebook_likes" INT   NULL,
    "actor_3_name" VARCHAR   NULL,
    "facenumber_in_poster" INT   NULL,
    "plot_keywords" VARCHAR   NULL,
    "movie_imdb_link" VARCHAR   NULL,
    "num_user_for_reviews" INT   NULL,
    "language" VARCHAR   NULL,
    "country" VARCHAR   NULL,
    "content_rating" VARCHAR   NULL,
    "budget" FLOAT   NULL,
    "title_year" INT   NULL,
    "actor_2_facebook_likes" INT   NULL,
    "imdb_score" FLOAT   NULL,
    "aspect_ratio" FLOAT   NULL,
    "movie_facebook_likes" INT   NULL,
    CONSTRAINT "pk_IMDB5000" PRIMARY KEY (
        "serial"
     )
);


--Poplate Master Table by Importing IMDB CSV--

--Create Map Table--
CREATE TABLE "Movie_Map" (
    "Serial" Serial   NOT NULL,
    "movie_title" VARCHAR   NULL,
    "gross" INTEGER   NULL,
    "director_name" VARCHAR   NULL,
    "actor_1_name" VARCHAR   NULL,
    "actor_2_name" VARCHAR   NULL,
    "actor_3_name" VARCHAR   NULL,
    "country" VARCHAR   NULL,
    "imdb_score" FLOAT(2)   NULL,
	"budget" FLOAT(2) NULL,
    CONSTRAINT "pk_Movie_Map" PRIMARY KEY (
        "Serial"
     )
);

--Create Budget Table--
CREATE TABLE "Budget_Table" (
    "Serial" Serial   NOT NULL,
    "movie_title" VARCHAR   NULL,
    "gross" FLOAT(2)   NULL,
   	"budget" FLOAT(2)   NULL,
    "imdb_score" FLOAT(2)   NULL,
    CONSTRAINT "pk_Budget_Table" PRIMARY KEY (
        "Serial"
     )
);

--Create Capital Cities Table--
CREATE TABLE "Capital_Cities" (
	"Serial" Serial   NOT NULL,
    "country" VARCHAR   NULL,
    "Capital" VARCHAR   NULL,
   	"CapitalLatitude" FLOAT(10)   NULL,
    "CapitalLongitude" FLOAT(10)   NULL,
    CONSTRAINT "pk_Capital_Cities" PRIMARY KEY (
        "Serial"
     )
);

--Upload Capital Cities using country-capitals-final.csv--

--Populate Budget Table from Master--
INSERT INTO public."Budget_Table" ("movie_title","gross","budget","imdb_score")
SELECT "movie_title","gross","budget","imdb_score" FROM public."IMDB5000";

--Populate Map Table from Master--
INSERT INTO public."Movie_Map" ("movie_title","gross","director_name","actor_1_name","actor_2_name","actor_3_name","country","imdb_score","budget")
SELECT "movie_title","gross","director_name","actor_1_name","actor_2_name","actor_3_name","country",CAST("imdb_score" AS FLOAT(2)) AS "imdb_score","budget"
FROM public."IMDB5000";

--Create Final Movie Map Table--
SELECT DISTINCT A."country",total_movies,case when total_budget is null then 10000 else total_budget end as "total_budget",

case when total_budget is null then '10,000' else to_char(total_budget,'999,999,999,999,999') end as "budget_thousands",

E."Capital",E."CapitalLatitude",E."CapitalLongitude",cast("avg_imdb" as float(2)) as "avg_imdb"

INTO public."Movie_Map_Final"
FROM public."Movie_Map" A
LEFT JOIN (SELECT "country",sum(budget) AS "total_budget" from public."Movie_Map" group by "country") B
	ON A."country"= B."country"
LEFT JOIN (SELECT "country",count(movie_title) AS "total_movies" from public."Movie_Map" group by "country") C
	ON A."country" = C."country"
LEFT JOIN (SELECT "country",avg(imdb_score) AS "avg_imdb"  from public."Movie_Map" group by "country") D
	ON A."country" = D."country"
RIGHT JOIN public."Capital_Cities" E
	ON A."country" = E."country";




