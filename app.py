from flask import Flask,render_template,request,jsonify
from flask.globals import session
from DBConnection import Database




app = Flask(__name__)
app.secret_key="abc"
static_path = "C:\\Users\\Asus\\OneDrive\\Desktop\\AR_eCommerce\\static\\"



# Login Section
@app.route('/')
def login():
    return render_template("login.html")
@app.route('/login_post', methods=['POST'])
def login_post():
    username = request.form["Uname"]
    password = request.form["pass"]
    db = Database()
    qry = "SELECT * FROM login WHERE username= '"+username+"' AND PASSWORD='"+password+"' "
    res = db.selectOne(qry)
    print(res)
    if res is not None:
        if res["type"] == "admin":
            return render_template("dashboard.html")
        if res["type"] == "patient":
            session['lid']=res['log_id']
            return render_template("patient/dashboard.html")
        if res["type"] == "donor":
            session['lid'] = res['log_id']
            return render_template("donor/dashboard.html")

        else:
            return ''' <script>alert('Invalid username or Password');window.location='/'</script>'''
    else:
        return ''' <script>alert('Invalid username or Password');window.location='/'</script>'''

@app.route('/admin')
def admin():
    return render_template("dashboard.html")



@app.route('/view_donors')
def view_donors():
    db = Database()
    res = db.select("select * from donor join login on donor.id=login.log_id and login.type='pending'")
    return render_template("admin/view_donor.html", data=res)


@app.route('/accept_donor')
def accept_donor():
    id = request.args.get('id')
    db = Database()
    res = db.update("update login set type='donor' where log_id='"+id+"'")
    return ''' <script>alert('Accepted');window.location='/view_donors'</script>'''



@app.route('/reject_donor')
def reject_donor():
    id = request.args.get('id')
    db = Database()
    res = db.update("update login set type='rejected' where log_id='"+id+"'")
    return ''' <script>alert('Rejected');window.location='/view_donors'</script>'''




@app.route('/view_approved_donors')
def view_approved_donors():
    db = Database()
    res = db.select("select * from donor join login on donor.id=login.log_id and login.type='donor'")
    return render_template("admin/view_approved_donor.html", data=res)



@app.route('/organ_management',methods=['get','post'])
def organ_management():

    if request.method=="POST":
        organ = request.form["hair type"]
        des = request.form["des"]
        db = Database()
        db.insert("insert into organ values(null,'"+organ+"','"+des+"')")
        return ''' <script>alert('Inserted');window.location='/organ_management'</script>'''

    else:
        db = Database()
        res = db.select("select * from organ")
        return render_template("admin/organ.html", data=res)


@app.route('/delete_organ')
def delete_organ():
    id = request.args.get('id')
    db = Database()
    res = db.delete("delete from organ where id='" + id + "'")
    return ''' <script>alert('Deleted');window.location='/organ_management'</script>'''



@app.route('/willing_bonors')
def willing_bonors():
    db = Database()
    res = db.select("select donor.*,organ.organ from donor join willing on donor.id=willing.donorid join organ on organ.id=willing.organid")
    return render_template("admin/view_willing_donor.html", data=res)



@app.route('/view_feedback')
def view_feedback():
    db = Database()
    res = db.select("select * from feedback join patients on feedback.lid=patients.id")
    return render_template("admin/viewFeedback.html", data=res)


# -----------patient--------------------


@app.route('/pview_donors',methods=['get','post'])
def pview_donors():
    if request.method=="POST":
        db = Database()
        org = request.form['sel']
        res1 = db.select("select * from organ")
        res = db.select("select * from donor where id in (select donorid from willing where organid='"+str(org)+"')")
        return render_template("patient/view_donor.html", data=res, data1=res1)

    db = Database()
    res1 = db.select("select * from organ")
    res = db.select("select * from donor join login on donor.id=login.log_id")
    return render_template("patient/view_donor.html", data=res,data1=res1)




@app.route('/choose_organ')
def choose_organ():
    id = request.args.get('id')
    session['don_id']=id
    db = Database()
    res = db.select("select organ.* from willing join organ on willing.organid=organ.id where willing.donorid='"+str(id)+"'")
    return render_template("patient/choose_organ.html", data=res)


@app.route('/send_request',methods=['post'])
def send_request():
    ord_id = request.form['select']
    db = Database()
    res = db.insert("insert into request (organid,donorid,patientid,status,date) values ('"+str(ord_id)+"','"+str(session['don_id'])+"','"+str(session['lid'])+"','pending',curdate())")
    return ''' <script>alert('Request Sended');window.location='/pview_donors'</script>'''




@app.route('/view_requests')
def view_requests():
    db = Database()
    res = db.select("select donor.*,organ.organ,request.id as rid,request.status from request join organ on organ.id=request.organid join donor on donor.id=request.donorid where request.patientid='"+str(session['lid'])+"'")
    return render_template("patient/pateintview_request.html", data=res)



@app.route('/send_feedback',methods=['get','post'])
def send_feedback():

    if request.method=="POST":
        organ = request.form["description"]

        db = Database()
        db.insert("insert into feedback values(null,'"+str(session['lid'])+"','"+organ+"',curdate())")
        return ''' <script>alert('Feedback Added');window.location='/send_feedback'</script>'''

    else:
        return render_template("patient/send_feedback.html")



# ----------------------donor----------------------




@app.route('/d_view_organs')
def d_view_organs():
    db = Database()
    res = db.select("select * from organ")
    return render_template("donor/view_organ.html", data=res)





@app.route('/send_willing')
def send_willing():
    id = request.args.get('id')
    db = Database()
    res = db.selectOne("select * from willing where organid='"+id+"' and donorid='"+str(session['lid'])+"'")
    if res is None:
        db.insert("insert into willing (organid,donorid) values('"+id+"','"+str(session['lid'])+"')")
        return ''' <script>alert('Added');window.location='/d_view_organs'</script>'''
    else:
        return ''' <script>alert('Already Added');window.location='/d_view_organs'</script>'''







@app.route('/d_view_request')
def d_view_request():
    db = Database()
    res = db.select("select request.id as rid,request.*,patients.*,organ.* from request join patients on request.patientid=patients.id join organ on request.organid=organ.id where request.donorid='"+str(session['lid'])+"'")
    return render_template("donor/donor_view_request.html", data=res)



@app.route('/accept_request')
def accept_request():
    id = request.args.get('id')
    db = Database()
    res = db.update("update request set status='accepted' where id='"+id+"'")
    return ''' <script>alert('Accepted');window.location='/d_view_request'</script>'''



@app.route('/reject_request')
def reject_request():
    id = request.args.get('id')
    db = Database()
    res = db.update("update request set status='rejected' where id='"+id+"'")
    return ''' <script>alert('Rejected');window.location='/d_view_request'</script>'''





@app.route('/view_paymentdetails')
def view_paymentdetails():
    id = request.args.get('id')
    db = Database()
    res = db.select("select * from payment where reqid='"+str(id)+"'")
    return render_template("donor/view_paymnt.html", data=res)



@app.route('/signUp')
def signUp():
    return render_template("signdashboard.html")



@app.route('/donor_signup',methods=['get','post'])
def donor_signup():
    print(request.form)

    if request.method=="POST":
        name = request.form['name']
        place = request.form['place']
        post = request.form['post']
        pin = request.form['pin']
        age = request.form['age']
        gender = request.form['gender']
        email = request.form['email']
        phone = request.form['phone']
        passw = request.form['pass']
        db = Database()
        lid = db.insert("insert into login (username,password,type) values('"+email+"','"+passw+"','pending')")
        db.insert("insert into donor (id,`name`,place,post,pin,age,gender,email,phone) values('"+str(lid)+"','"+name+"','"+place+"','"+post+"','"+pin+"','"+age+"','"+gender+"','"+email+"','"+phone+"')")
        return ''' <script>alert('Registered');window.location='/donor_signup'</script>'''


    return render_template("donor.html")


@app.route('/patient_signup',methods=['get','post'])
def patient_signup():
    print(request.form)
    if request.method == "POST":
        name = request.form['name']
        place = request.form['place']
        post = request.form['post']
        hname = request.form['hname']
        age = request.form['age']
        email = request.form['email']
        phone = request.form['phone']
        passw = request.form['pass']
        db = Database()
        lid = db.insert("insert into login (username,password,type) values('" + email + "','" + passw + "','patient')")
        db.insert("insert into patients (id,`name`,age,hname,place,post,email,phno) values('" + str(
            lid) + "','" + name + "','" + age + "','" + hname + "','" + place + "','" + post + "','" + email + "','" + phone + "')")
        return ''' <script>alert('Registered');window.location='/patient_signup'</script>'''

    return render_template("patient.html")




@app.route('/payment', methods=['post', 'get'])
def payment():
    rid = request.args.get('id')
    if request.method == "POST":
        account_no = request.form['textfield']
        bank = request.form['textfield5']
        ifsc = request.form['textfield2']
        amnt = request.form['textfield3']

        db = Database()
        s = "select * from bank where user_id='"+str(session['lid'])+"'"
        print(s)
        qry3 = db.selectOne(s)
        if qry3 is not None:
            b=qry3['amount']
            if int(b) < float(amnt):
                return '''<script>alert('check your balance');window.location="/view_requests"</script>'''
            else:
                db.update("update bank set amount=amount+'" + str(amnt) + "' where account_no='" + str(account_no) + "'")

                db.update("update bank set amount=amount-'" + str(amnt) + "' where user_id='" + str(session['lid']) + "'")
                db.insert("insert into payment values(null,'"+str(rid)+"','"+str(amnt)+"',curdate(),curtime())")

                return "<script>alert('Payment successfully');window.location='/view_requests'</script>"

        else:
            return '''<script>alert('wrong bank details');window.location="/view_requests"</script>'''

    else:
        return render_template('patient/payment.html')







if __name__ == '__main__':
    app.run(host='0.0.0.0',debug='true')
