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
    data = pd.read_sql('''select * from  public."Netflix1"''', con=con)
    data = data.to_dict(orient="records")
    return jsonify(data)
if __name__ == "__main__":
    app.run(debug=True)