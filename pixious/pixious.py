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
    db=Db()
    t=db.select("select * from movie,creator,user where movie.creator_id=creator.creator_id and creator.user_id=user.user_id")
    return render_template('admin/Approve movies.html',data=t)


@app.route('/adm_approve_movie/<mid>')
def adm_approve_movie(mid):
    db = Db()
    db.update("update movie set movie_status='approved' where movie_id='"+mid+"'")
    return '''<script>alert("Approved");window.location="/Approve_movies"</script>'''

@app.route('/movierej/<fid>')
def movierej(fid):
    db = Db()
    db.update("update movie set movie_status='rejected' where movie_id='" + fid + "'")
    return '''<script>alert("rejected");window.location="/Approve_movies"</script>'''


@app.route('/bugs')
def bugs():
    db=Db()
    res=db.select("select * from bugs,user where bugs.sender_id=user.user_id")
    return render_template('admin/Bugs.html',data=res)

@app.route('/bugsreply/<fid>',methods=['get','post'])
def bugsreply(fid):
    if request.method == 'POST':
        r= request.form['textarea']
        db=Db()
        db.update("update bugs set reply='"+r+"',reply_date='curdate()' where bugs_id='"+fid+"'")
        return '<script>alert("send successfully");window.location="/bugs"</script>'
    else:
        return render_template("admin/Reply.html")

@app.route('/changepass',methods=['get','post'])
def changepass():
    if request.method == 'POST':
        current = request.form['admin_name']
        new = request.form['old_password']
        confirm=request.form['admin_password']
        db = Db()
        a=db.selectOne("select * from login where  password='"+current+"'and usertype='admin'")
        if a is not None:
            if new==confirm:
                db=Db()
                db.update("update login set password='"+confirm+"' where usertype='admin'")
                return "<script>alert('password changed sucessfully');window.location='/changepass'</script>"
            else:
                return "<script>alert('password mis match');window.location='/changepass'</script>"
        else:
            return "<script>alert('password changed sucessfully');window.location='/changepass'</script>"
    else:
        return render_template('admin/Change Password.html')

@app.route('/comment')
def comment():
    db=Db()
    g=db.select("select * from comment,movie where comment.movie_id=movie.movie_id")
    return render_template('admin/Comment.html',data=g)

@app.route('/verification')
def verification():

        db = Db()
        w= db.select("select * from user where user.user_id")
        return render_template('admin/Creator Verification.html',data=w)

@app.route('/feedback')
def feedback():
    db=Db()
    b=db.select("select * from feedback,user where feedback.user_id=user.user_id")

    return render_template('admin/Feedback.html',data=b)

@app.route('/reply/<fid>',methods=['get','post'])
def reply(fid):
    if request.method == 'POST':
        r= request.form['textarea']
        db=Db()
        db.update("update feedback set reply='"+r+"',reply_date='curdate()' where feedback_id='"+fid+"'")
        return '<script>alert("send successfully");window.location="/feedback"</script>'
    else:
        return render_template("admin/Reply.html")

@app.route('/report')
def report():
    db = Db()
    p=db.select("select * from film_report,movie where film_report.movie_id=movie.movie_id")
    return render_template('admin/Filim Report.html',data=p)

@app.route('/delete/<fid>')
def delete(fid):
    db = Db()
    db.delete("delete from film_report where film_report_id='"+fid+"'")
    return '''<script>alert("deleted");window.location="/report"</script>'''

@app.route('/comdelete/<fid>')
def comdelete(fid):
    db = Db()
    db.delete("delete from comment where comment_id='"+fid+"'")
    return '''<script>alert("deleted");window.location="/comment"</script>'''


@app.route('/promo',methods=['get','post'])
def promo():
    if request.method == 'POST':
        name = request.form['promo_name']
        description = request.form['promo_desc']
        poster=request.form['promo_poster']
        banner=request.form['promo_banner']
        video=request.form['promo_video']
        db = Db()

    return render_template('admin/Movie Promo.html')

@app.route('/promorequest')
def promorequest():

    return render_template('admin/Promo Request.html')

@app.route('/view')
def view():
    return render_template('admin/view user and creator.html')









if __name__ == '__main__':
    app.run()
