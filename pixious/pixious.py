from flask import Flask, render_template, request, redirect
from DBConnection import Db

app = Flask(__name__)


@app.route('/',methods=['get','post'])
def login():
    if request.method=='POST':
        name=request.form['admin_name']
        password=request.form['admin_password']
        db=Db()
        q=db.selectOne("select * from login where username='"+name+"'and password='"+password+"'and usertype='admin'")
        if q is not None:
           return redirect('/adminhome')
        else:
            return "<script>alert('user not found');window.location='/'</script>"
    return render_template('admin_login.html')



@app.route('/adminhome')
def adminhome():
    return render_template('admin/admin home.html')


@app.route('/Approve_movies')
def Approve_movies():
    return render_template('admin/Approve movies.html')


@app.route('/bugs')
def bugs():
    return render_template('admin/Bugs.html')

@app.route('/changepass')
def changepass():
    return render_template('admin/Change Password.html')

@app.route('/comment')
def comment():
    return render_template('admin/Comment.html')

@app.route('/verification')
def verification():
    return render_template('admin/Creator Verification.html')

@app.route('/feedback')
def feedback():
    return render_template('admin/Feedback.html')

@app.route('/report')
def report():
    return render_template('admin/Filim Report.html')

@app.route('/promo')
def promo():
    return render_template('admin/Movie Promo.html')

@app.route('/promorequest')
def promorequest():
    return render_template('admin/Promo Request.html')

@app.route('/view')
def view():
    return render_template('admin/view user and creator.html')









if __name__ == '__main__':
    app.run()
