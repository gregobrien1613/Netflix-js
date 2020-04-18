from flask import Flask, jsonify, render_template
import psycopg2
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
import pandas as pd
import json


app = Flask(__name__)

@app.route("/")
def welcome():

    return render_template("index.html")

@app.route("/page1")
def page1():

    return render_template("page1.html")

@app.route("/team")
def team():

    return render_template("team.html")

@app.route("/ppt")
def ppt():

    return render_template("ppt.html")

@app.route("/page2")
def page2():

    return render_template("page2.html")    

@app.route("/page3")
def page3():

    return render_template("page3.html")  

# @app.route("/maps")
# def maps():
#
#     return render_template("")
#
# @app.route("/comparison-by-movies-shows")
# def compareMovies():
#
#     return render_template("")
#
# @app.route("/comparison-by-genre")
# def compareGenres():
#
#     return render_template("")
#


@app.route("/data")
def data():
    con = psycopg2.connect("host='localhost' dbname='Netflix' user='postgres' password='R@dium.33'")
    data = pd.read_sql('''select * from  public."IMDB5000"''', con=con)
    data = data.to_json(orient='records',date_format='iso')
    return jsonify(json.loads(data))

@app.route("/data2")
def data2():
    con = psycopg2.connect("host='localhost' dbname='Netflix' user='postgres' password='R@dium.33'")
    data2 = pd.read_sql('''select * from  public."Budget_Table" where budget is null or budget < 55363200''', con=con)
    data2 = data2.to_json(orient='records',date_format='iso')
    return jsonify(json.loads(data2))    

@app.route("/data3")
def data3():
    con = psycopg2.connect("host='localhost' dbname='Netflix' user='postgres' password='R@dium.33'")
    data3 = pd.read_sql('''SELECT * FROM public."Movie_Map_Final"''', con=con)
    data3 = data3.to_dict(orient="records")
    return jsonify(data3) 

if __name__ == "__main__":
    app.run(debug=True)
