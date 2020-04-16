from flask import Flask, jsonify, render_template
import pandas as pd
import psycopg2

app = Flask(__name__)

@app.route("/")
def welcome():

    return render_template("index.html")

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
    con = psycopg2.connect("host='localhost' dbname='Netflix' user='postgres' password='R@dium.33'")
    data = pd.read_sql('''select * from  public."IMDB5000"''', con=con)
    data = data.to_dict(orient="records")
    return jsonify(data)

@app.route("/data2")
def data2():
    con = psycopg2.connect("host='localhost' dbname='Netflix' user='postgres' password='R@dium.33'")
    data2 = pd.read_sql('''SELECT * FROM public."Movie_Map"''', con=con)
    data2 = data2.to_dict(orient="records")
    return jsonify(data2)

@app.route("/data3")
def data3():
    con = psycopg2.connect("host='localhost' dbname='Netflix' user='postgres' password='R@dium.33'")
    data3 = pd.read_sql('''SELECT * FROM public."Budget_Table"''', con=con)
    data3 = data3.to_dict(orient="records")
    return jsonify(data3)

if __name__ == "__main__":
    app.run(debug=True)