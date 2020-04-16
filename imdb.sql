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
    "gross" float(2)  NULL,
	"budget" float(2) NULL,
    "director_name" VARCHAR   NULL,
    "actor_1_name" VARCHAR   NULL,
    "actor_2_name" VARCHAR   NULL,
    "actor_3_name" VARCHAR   NULL,
    "country" VARCHAR   NULL,
    "imdb_score" FLOAT(2)   NULL,
	"revenue" float(2) NULL,
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

--Populate Budget Table from Master--
INSERT INTO public."Budget_Table" ("movie_title","gross","budget","imdb_score")
SELECT case when "movie_title" is null then 'unknown' else "movie_title" end as "movie_title"
,case when "gross" is null then  0 end as "gross",case when "budget" is null then 0 end as "budget", case when "imdb_score" is null then 0 end as "imdb_score" FROM public."IMDB5000";

--Populate Map Table from Master--
INSERT INTO public."Movie_Map" ("movie_title","gross","director_name","actor_1_name","actor_2_name","actor_3_name","country","imdb_score","budget","revenue")
SELECT case when "movie_title" is null then 'unknown' else "movie_title" end as "movie_title"
,case when "gross" is null then cast(0 as int) else cast("gross" as int) end as "gross"
,case when "director_name" is null then 'unknown' else "director_name" end as "director_name"
,case when "actor_1_name" is null then 'unkown' else "actor_1_name" end as "actor_1_name"
,case when "actor_2_name" is null then 'unkown' else "actor_2_name" end as "actor_2_name"
,case when "actor_3_name" is null then 'unkown' else "actor_3_name" end as "actor_3_name"
,case when "country" is null then 'unkown' else "country" end as "country"
,case when "imdb_score" is null then cast(0 as float(2)) else CAST("imdb_score" AS FLOAT(2)) END AS "imdb_score"
,case when "budget" is null then 0 else "budget" end as "budget"
,"gross" - "budget" as "revenue"
FROM public."IMDB5000"

where "budget" is not null and "gross" is not null;


