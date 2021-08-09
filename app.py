from flask import Flask, render_template, request, session, redirect, url_for
from flask_mysqldb import MySQL
import MySQLdb.cursors

app = Flask(__name__)


app.secret_key = 'your secret key'

# Enter your database connection details below
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'passport1'

# Intialize MySQL
mysql = MySQL(app)


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        username = request.form['name']
        password = request.form['password']
        print(username)
        print(password)
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE email = %s AND password = %s', (username, password,))
        # Fetch one record and return result
        account = cursor.fetchone()
        if account:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['id'] = account['id']
            session['username'] = account['email']
            # Redirect to home page
            return redirect(url_for('dashboard'))
        else:
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'
    return render_template('index.html')


@app.route('/dashboard',methods=['GET', 'POST'])
def dashboard():
    if session['loggedin'] == True :
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM client')
        clients = cursor.fetchall()
        print(clients)
        print(type(clients))
        clients_list = []
        for i in range(0,len(clients)):
            a = {
                "idno" : clients[i]['id'],
                "name" : clients[i]['name1'],
                "number" : clients[i]['number1'],
                "number_alt" : clients[i]['number_alt'],
                "email" : clients[i]['email'],
                "wpgroup" : clients[i]['wa_group_name']
            }
            clients_list.append(a)
            print(clients[i]['id'])
            print("=======================================================")

        print(clients_list)
    return render_template('dashboard.html', result = clients_list)


@app.route('/addclient',methods=['GET', 'POST'])
def addclient():
    if request.method == 'POST':
        name = request.form['name']
        number = request.form['number']
        number_alt = request.form['number_alt']
        email = request.form['email']
        email_alt = request.form['email_alt']
        location = request.form['location']
        date = request.form['date']
        source = request.form['source']
        referred = request.form['referred']
        process_type = request.form['process_type']
        first_register = request.form['First_register']
        lead_type = request.form['lead_type']
        search_req = request.form['search_req']
        assign_to = request.form['assign_to']
        search_location = request.form['search_location']
        wa_group = request.form['wa_group']
        wa_group_name = request.form['wa_group_name']
        address = request.form['address']
        submit = request.form['submit']

        if session['loggedin'] == True:
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            result = cursor.execute("INSERT INTO client (name1, number1, number_alt, email, email_alt, location, source1, referred_by, process_type, first_registration_of, lead_type, search_required, assigned_to, search_location, wa_group, wa_group_name, address) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (name, number, number_alt, email, email_alt, location, source, referred, process_type, first_register, lead_type, search_req, assign_to, search_location, wa_group, wa_group_name, address))
            mysql.connection.commit()
            cursor.close()
            return redirect(url_for('dashboard'))
        else:
            print("no")
    return render_template('add_client.html')

@app.route('/document',methods=['GET', 'POST'])
def document():
    return render_template('document.html')

@app.route('/adduser',methods=['GET', 'POST'])
def adduser():
    return render_template('add_user.html')

@app.route('/customreport',methods=['GET', 'POST'])
def customreport():
    return render_template('custom_report.html')


if __name__ == '__main__':
    app.run()
