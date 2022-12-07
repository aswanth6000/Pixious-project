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

# @app.route('/bugsreply/<fid>',methods=['get','post'])
# def bugsreply(fid):
#     if request.method == 'POST':
#         r= request.form['textarea']
#         db=Db()
#         db.update("update bugs set reply='"+r+"',reply_date='curdate()' where bugs_id='"+fid+"'")
#         return '<script>alert("send successfully");window.location="/bugs"</script>'
#     else:
#         return render_template("admin/Reply.html")

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
#------------comment---------------------
@app.route('/comment')
def comment():
    db=Db()
    g=db.select("select * from comment,movie where comment.movie_id=movie.movie_id")
    return render_template('admin/Comment.html',data=g)

@app.route('/comdelete/<fid>')
def comdelete(fid):
    db = Db()
    db.delete("delete from comment where comment_id='"+fid+"'")
    return '''<script>alert("deleted");window.location="/comment"</script>'''
#------------------------creator verification------------------------------------------------------------
@app.route('/verification')
def verification():

        db = Db()
        w= db.select("select * from user,creator where user.user_id=creator.user_id")
        return render_template('admin/Creator Verification.html',data=w)

@app.route('/adm_verification/<uid>')
def adm_verification(uid):
    db = Db()
    db.update("update creator set status='approved' where creator_id='"+uid+"'")
    return '''<script>alert("Approved");window.location="/verification"</script>'''

@app.route('/creator_rej/<fid>')
def creator_rej(fid):
    db = Db()
    db.update("update creator set status='rejected' where creator_id='" + fid + "'")
    return '''<script>alert("rejected");window.location="/verification"</script>'''
#----------------------------feed back-----------------------
@app.route('/feedback')
def feedback():
    db=Db()
    b=db.select("select * from feedback,user where feedback.sender_id=user.user_id")

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



#----------------film promo----------
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
#-------promo request---------
@app.route('/promorequest')
def promorequest():
    db = Db()
    p = db.select("select * from movie_promo_request,user where movie_promo_request.sender_id=user.user_id")
    return render_template('admin/Promo Request.html',data=p)

@app.route('/promo_acc/<uid>')
def promo_acc(uid):
    db = Db()
    db.update("update movie_promo_request set promo_status='approved'  where promo_request_id='"+uid+"'")
    return '''<script>alert("Approved");window.location="/promorequest"</script>'''
@app.route('/promo_rej/<uid>')
def promo_rej(uid):
    db = Db()
    db.update("update movie_promo_request set promo_status='rejected' where promo_request_id='"+uid+"'")
    return '''<script>alert("rejected");window.location="/promorequest"</script>'''

#------------------view users------------------

@app.route('/view',methods=['get','post'])
def view():
    if request.method=="POST":
        s=request.form['select']
        n=request.form['t']
        db = Db()
        p = db.select("select * from user,creator where creator.user_id=user.user_id  and creator.status='"+s+"' and user.name='"+n+"' ")
        return render_template('admin/view user and creator.html',data=p)

    else:
        db=Db()
        db = Db()
        p = db.select("select * from user,creator where creator.user_id=user.user_id ")
        return render_template('admin/view user and creator.html',data=p)
def user_block(uid):
    db = Db()
    db.update("update user set user_status='blocked' where user_id='"+uid+"'")
    return '''<script>alert("blocked");window.location="/view"</script>'''


# ======================================================================================================================================
#                                                      CREATOR MODULE
# =====================================================================================================================================

@app.route('/addmovpromoreq')
def addmovpromo():
    return render_template('creator/Add movie promo request.html')

@app.route('/viewrating')
def viewrating():
    return render_template('creator/view rating.html')

@app.route('/viewplaylist')
def viewplaylist():
    return render_template('creator/view playlist.html')

@app.route('/viewotherscreatorview')
def viewotherscreatorview():
    return render_template('creator/view others creator view.html')

@app.route('/viewothercreator')
def viewothercreator():
    return render_template('creator/view other creators.html')

@app.route('/viewmovie')
def viewpmovie():
    return render_template('creator/view movie.html')

@app.route('/viewmoviereqvideo')
def viewmoviereqvideo():
    return render_template('creator/view movie req video.html')

@app.route('/viewhiringandapply')
def viewhiringandapply():
    return render_template('creator/view hiring and apply.html')








if __name__ == '__main__':
    app.run()
