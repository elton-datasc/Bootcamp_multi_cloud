from flask import render_template
from flask import Flask

app = Flask(__name__)

# en = English
# pt = Portuguese

language = 'pt'

@app.route('/')
@app.route('/<name>')
def index(name=None):
    return render_template('index-'+language+'.html', name=name)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')