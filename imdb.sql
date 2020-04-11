-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/tljoTc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


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
    CONSTRAINT "pk_Netflix1" PRIMARY KEY (
        "serial"
     )
);

