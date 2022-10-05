from flask import Flask, request
app = Flask(__name__)

pc: int = -1

@app.route("/")
def index():
    return 'hello'

@app.route("/r")
def r():
    global pc
    pc = -1
    return ""

@app.route("/on")
def ontick():
    o = float(request.args.get('open'))
    h = float(request.args.get('high'))
    l = float(request.args.get('low'))
    c = float(request.args.get('close'))
    global pc

    if pc == -1:
        pc = c

    print(o, h, l, c, pc)
    pc = c

    l = [o, h, l, c, pc]
    return ",".join(l)

if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1', port=8080)
