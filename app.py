from flask import Flask, jsonify, render_template
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
import pandas as pd
import psycopg2

# rds_connection_string = "postgres:postgres@localhost:5432/netflix_db"
# engine = create_engine(f'postgresql://{rds_connection_string}')
#
# pd.read_sql_query('select * from Netflix1', con=engine)
#
#
# # Save reference to the table
# netflix = Base.classes.Netflix1

app = Flask(__name__)

# @app.route("/")
# def welcome():

#     return render_template("index.html")

# @app.route("/maps")
# def maps():

#     return render_template("")

# @app.route("/comparison-by-movies-shows")
# def compareMovies():

#     return render_template("")

# @app.route("/comparison-by-genre")
# def compareGenres():

#     return render_template("")

    

@app.route("/data")
def data():
    con = psycopg2.connect("host='localhost' dbname='Netflix-1' user='postgres' password='R@dium.33'")
    cur = con.cursor()
    cur.execute('''select * from public."Netflix1"''')
    data = [col for col in cur]
    cur.close()
    return jsonify(data)

if __name__ == "__main__":
    app.run(debug=True)