import boto3
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

# AWS cred
BUCKET = "bucketpassportdocument"
AWS_ACCESS_KEY = "AKIA32FEE72LNRIFLZNH"
AWS_SECERT_KEY = "fMBigKgciu+WeGTFph6UMiu5Kh3JaHm5D+Df78jy"

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


@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if session['loggedin'] == True:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM client')
        clients = cursor.fetchall()
        clients_list = []
        for i in range(0, len(clients)):
            a = {
                "idno": clients[i]['id'],
                "name": clients[i]['name1'],
                "number": clients[i]['number1'],
                "number_alt": clients[i]['number_alt'],
                "email": clients[i]['email'],
                "wpgroup": clients[i]['wa_group_name']
            }
            clients_list.append(a)
        
        

    return render_template('dashboard.html', result=clients_list)


@app.route('/addclient', methods=['GET', 'POST'])
def addclient():
    if request.method == 'GET':
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM client')
        clients = cursor.fetchall()
        clients_list = []
        for i in range(0, len(clients)):
            a = {
                "idno": clients[i]['id'],
                "name": clients[i]['name1'],
                "number": clients[i]['number1'],
                "number_alt": clients[i]['number_alt'],
                "email": clients[i]['email'],
                "wpgroup": clients[i]['wa_group_name']
            }
            clients_list.append(a)

        return render_template('add_client.html', result=clients_list)

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
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        result = cursor.execute(
            "INSERT INTO client (name1, number1, number_alt, email, email_alt, location, source1, referred_by, process_type, first_registration_of, lead_type, search_required, assigned_to, search_location, wa_group, wa_group_name, address) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            (name, number, number_alt, email, email_alt, location, source, referred, process_type, first_register,
             lead_type, search_req, assign_to, search_location, wa_group, wa_group_name, address))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('document'))

@app.route('/document', methods=['GET', 'POST'])
def document():
    if request.method == 'POST':
        client_id = request.form['client_id']
        registration = request.form['registration']
        to_register = request.form['to_register']
        document = request.form['document']
        document_of = request.form['document_of']
        name = request.form['name']
        place = request.form['place']
        date = request.form['date']
        registered_date = request.form['registered_date']
        doc_available = request.form['doc_available']
        doc_in_office = request.form['doc_in_office']
        sac_date = request.form['sac_date']
        billable = request.form['billable']
        at_date = request.form['a/t_date']
        translation_date = request.form['translation_date']
        notary_date = request.form['notary_date']
        collector_date = request.form['collector_date']
        apostle_date = request.form['apostle_date']
        send_to_pt_date = request.form['send_to_pt_date']
        doc_reached_pt = request.form['doc_reached_pt']
        received_in_pt_date = request.form['received_in_pt_date']
        submitted_date = request.form['submitted_date']
        concluded_date = request.form['concluded_date']
        doc_issue_date = request.form['doc_issue_date']
        reg_bill = request.form['reg_bill']
        submitted = request.form['submitted']
        attachment = request.files['file']
        attachment.save(attachment.filename)
        comment = request.form['comment']
        #filename = "C:\Users\rthapa5\Downloads\mycovid.pdf"

        session = boto3.Session(
            aws_access_key_id=AWS_ACCESS_KEY,
            aws_secret_access_key=AWS_SECERT_KEY,
        )

        s3 = session.resource('s3')

        result_s3 = s3.meta.client.upload_file(Filename=attachment.filename, Bucket=BUCKET, Key="documents/"+attachment.filename)

        dowloadurl = "https://bucketpassportdocument.s3.amazonaws.com/documents/"+attachment.filename
        # results3 = upload_file(attachment.filename, BUCKET)
        print(result_s3)
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        result = cursor.execute(
            "INSERT INTO document (client_id, registration, to_register, document, document_of, name, place, date, registered_date, doc_available, doc_in_office, sac_date, at_date, translation_date, notary_date, collector_date, apostle_date, send_to_pt_date, doc_reached_pt, received_in_pt_date, submitted_date, concluded_date, doc_issue_date, reg_bill, submitted, attachment, comment, billable) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            (client_id, registration, to_register, document, document_of, name, place, date, registered_date,
             doc_available, doc_in_office, sac_date, at_date, translation_date, notary_date, collector_date,
             apostle_date, send_to_pt_date, doc_reached_pt, received_in_pt_date, submitted_date, concluded_date,
             doc_issue_date, reg_bill, submitted, dowloadurl, comment, billable))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('document'))
        
    doc_list = []
    if request.method == 'GET':
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM document')
        doc_details = cursor.fetchall()
        
        for i in range(0, len(doc_details)):
            a = {
                "client_id": doc_details[i]['client_id'],
                "registration": doc_details[i]['registration'],
                "to_register": doc_details[i]['to_register'],
                "document": doc_details[i]['document'],
                "document_of": doc_details[i]['document_of'],
                "name": doc_details[i]['name'],
                "place": doc_details[i]['place'],
                "date": doc_details[i]['date'],
                "registered_date": doc_details[i]['registered_date'],
                "doc_available": doc_details[i]['doc_available'],
                "doc_in_office": doc_details[i]['doc_in_office'],
                "sac_date": doc_details[i]['sac_date'],
                "billable": doc_details[i]['billable'],
                "at_date": doc_details[i]['at_date'],
                "translation_date": doc_details[i]['translation_date'],
                "notary_date": doc_details[i]['notary_date'],
                "collector_date": doc_details[i]['collector_date'],
                "apostle_date": doc_details[i]['apostle_date'],
                "send_to_pt_date": doc_details[i]['send_to_pt_date'],
                "doc_reached_pt": doc_details[i]['doc_reached_pt'],
                "received_in_pt_date": doc_details[i]['received_in_pt_date'],
                "submitted_date": doc_details[i]['submitted_date'],
                "concluded_date": doc_details[i]['concluded_date'],
                "doc_issue_date": doc_details[i]['doc_issue_date'],
                "reg_bill": doc_details[i]['reg_bill'],
                "submitted": doc_details[i]['submitted'],
                "attachment": doc_details[i]['attachment'],
                "comment": doc_details[i]['comment'],
                "idno":doc_details[i]['id']
            }
            doc_list.append(a)
        print(doc_list)

    return render_template('document.html', result=doc_list)


@app.route('/editusers', methods=['GET', 'POST'])
def editusers():
    if request.method == 'GET':
        idno = request.args.get('id')
        print(idno)
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE id = %s', (idno,))
        # Fetch one record and return result
        user_data = cursor.fetchone()
        print(user_data)
        return render_template('editusers.html', result = user_data)

    if request.method == 'POST':
        idno = request.form['id']
        name = request.form['name']
        mail = request.form['email']
        user_type = request.form['user_type']

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute("UPDATE user SET name=%s, email=%s, user_type=%s WHERE id=%s", (name, mail, user_type, idno))

        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('dashboard'))

@app.route('/adduser', methods=['GET', 'POST'])
def adduser():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        password = request.form['password']
        user_type = request.form['user_type']
        submit = request.form['submit']

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        result = cursor.execute("INSERT INTO user (name, email, password, user_type) VALUES (%s, %s, %s, %s)",(name, email, password, user_type))
        
        mysql.connection.commit()
        cursor.close()
    user_list = []
    if request.method == 'GET':
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user')
        user_details = cursor.fetchall()

        for i in range(0, len(user_details)):
            a = {
                "idno":user_details[i]['id'],
                "name": user_details[i]['name'],
                "email": user_details[i]['email'],
                "password": user_details[i]['password'],
                "user_type": user_details[i]['user_type']
            }
            user_list.append(a)
        print(user_list)
    return render_template('add_user.html', result=user_list)
    # return render_template('add_user.html')


@app.route('/customreport', methods=['GET', 'POST'])
def customreport():
    if request.method == 'POST':
        print(request.form)
    return render_template('custom_report.html')

@app.route('/editclients', methods=['GET', 'POST'])
def editclients():
    if request.method == 'POST':
        idno = request.form['id']
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

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute("UPDATE client SET name1=%s, number1=%s, number_alt=%s, email=%s, email_alt=%s, location=%s, source1=%s, referred_by=%s, process_type=%s, first_registration_of=%s, lead_type=%s, search_required=%s, assigned_to=%s, search_location=%s, wa_group=%s, wa_group_name=%s, address=%s WHERE id=%s", (name, number, number_alt, email, email_alt, location, source, referred, process_type, first_register, lead_type, search_req, assign_to, search_location, wa_group, wa_group_name, address,idno))

        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('dashboard'))
    if request.method == 'GET':
        idno = request.args.get('id')
        print(idno)
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM client WHERE id = %s', (idno,))
        # Fetch one record and return result
        client_data = cursor.fetchone()

        return render_template('editclientdetails.html',result = client_data)
    
@app.route('/deleteclient', methods=['GET', 'POST'])
def deleteclient():
    if request.method == 'GET':
        idno = request.args.get('id')
        print(idno)
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        result = cursor.execute("DELETE FROM client WHERE id = %s", (idno,))

        mysql.connection.commit()
        cursor.close()

    return redirect(url_for('dashboard'))


@app.route('/deleteuser', methods=['GET', 'POST'])
def deleteuser():
    if request.method == 'GET':
        idno = request.args.get('id')

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        result = cursor.execute("DELETE FROM user WHERE id = %s", (idno,))

        mysql.connection.commit()
        cursor.close()
    return redirect(url_for('adduser'))

if __name__ == '__main__':
    app.run()
