from flask import Flask



app = Flask(__name__)

@app.route("/")
def hello_world():
    return "{\"message\": \"Jay's HWorld! v2\"}"

#run at port 5000
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

