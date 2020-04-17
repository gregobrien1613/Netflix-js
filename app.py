from flask import Flask, jsonify, render_template, make_response
import psycopg2
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
import pandas as pd
import simplejson
import json


app = Flask(__name__)

@app.route("/")
def welcome():

    return render_template("index.html")


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
    con = psycopg2.connect("host='localhost' dbname='Netlix-1' user='postgres' password='postgres'")
    data = pd.read_sql('''select * from  public."Netflix1"''', con=con)
    data = data.to_dict(orient="records")
    return jsonify(data)

@app.route("/data2")
def data2():
    con = psycopg2.connect("host='localhost' dbname='Netlix-1' user='postgres' password='postgres'")
    data2 = pd.read_sql('''select * from  public."Budget_Table"''', con=con)
    data2 = data2.to_json(orient='records',date_format='iso')
    return jsonify(json.loads(data2))


if __name__ == "__main__":
    app.run(debug=True)
