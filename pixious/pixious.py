from flask import Flask, render_template, request, redirect,session
import datetime
from DBConnection import Db

app = Flask(__name__)
app.secret_key="abc"


@app.route('/',methods=['get','post'])
def login():
    if request.method=='POST':
        name=request.form['admin_name']
        password=request.form['admin_password']
        db=Db()
        q=db.selectOne("select * from login where username='"+name+"'and password='"+password+"'")
        if q is not None:
            if q['usertype']=='admin':
                return redirect('/adminhome')
            elif q['usertype']=='user':
                session['lid']=q['login_id']
                return redirect('/creatorhome')
            else:
                return "<script>alert('user not found');window.location='/'</script>"
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


@app.route('/creatorhome')
def creatorhome():
    return render_template('creator/creator_home.html')

@app.route('/addmovpromoreq',methods=['get','post'])
def addmovpromo():
    if request.method=="POST":
        moviename=request.form['movie_name']
        banner=request.form['banner']
        poster=request.form['poster']
        date = datetime.datetime.now().strftime("%y%m%d-%H%M%S")
        banner.save(r"D:\project\Pixious-project\pixious\static\banner\\"+date+'.jpg')
        banner.save(r"D:\project\Pixious-project\pixious\static\poster\\"+date+'.jpg')
        db=Db()
        db.insert("insert into movie_promo_request('','"+date+"','"+moviename+"','"+type+"','pending','"+poster+"','"+banner+"',)")
        return "ok"
    else:
        return render_template('creator/Add movie promo request.html')


@app.route('/addmovie',methods=['get','post'])
def addmovie():
    if request.method=="POST":
        movie=request.files['file']
        moviename=request.form['movie name']
        description=request.form['description']
        directorname=request.form['director_name']
        date=datetime.datetime.now().strftime("%y%m%d-%H%M%S")
        movie.save(r"D:\project\Pixious-project\pixious\static\movie\\"+date+'.mp4')
        path="/static/movie/"+date+'.mp4'
        db=Db()
        db.insert("insert into movie VALUES ('','"+moviename+"','"+description+"','"+str(session['lid'])+"','"+directorname+"','"+str(path)+"','pending')")
        return '''<script>alert("uploaded successfully");window.location="/creatorhome"</script>'''
    else:
        return render_template('creator/Add movie.html')


@app.route('/creatorcomment',methods=['get','post'])
def creatorcomment():
    if request.method=="POST":
        comment=request.form['comment']
        return "ok"
    else:
        return render_template('creator/Comment.html')

@app.route('/hiring')
def hiring():
    db = Db()
    return render_template('creator/Hiring.html.')


@app.route('/movieregister')
def moviereg():
    db = Db()
    return render_template('creator/Movie Register.html')

@app.route('/rate',methods=['get','post'])
def rate():
    if request.method=="POST":
        rating=request.form['rating']
        return "ok"
    else:
        return render_template('creator/Rate.html')

@app.route('/sendfeedback')
def sendfeedback():
    return render_template('creator/Send feedback.html')

@app.route('/sendreply',methods=['get','post'])
def creatorreply():
    if request.method=="POST":
        reply=request.form['reply']
        return "ok"
    else:
        return render_template('creator/Send reply.html')

@app.route('/creatorbug',methods=['get','post'])
def creatorbug():
    if request.method=="POST":
        heading=request.form['heading']
        description=request.form['bug_desc']
        return "ok"
    else:
        return render_template('creator/Send bug.html')

@app.route('/creatorshare',methods=['get','post'])
def creatorshare():
    if request.method=="POST":
        username=request.form['user_name']
        return "ok"
    else:
        return render_template('creator/Share.html')

@app.route('/upi')
def  upi():
    db = Db()
    return render_template('creator/UPI.html')

@app.route('/viewapphiring')
def viewhiring():
    db=Db()
    j=db.select("select * from applied_hiring where applied_hiring.hiring_id=hiring.hiring_id and applied_hiring.sender_id='"+str(session['lid'])+"'")
    return render_template('creator/view applied hiring.html',data=j)

@app.route('/viewbugreply')
def bugreply():
    db = Db()
    i=db.select("select * from bugs where sender_id='"+str(session['lid'])+"'")
    return render_template('creator/view bug reply.html',data=i)

@app.route('/viewcomment/<mid>')
def viewcomment(mid):
    db = Db()
    h=db.select("select * from comment,user where comment.sender_id=user.user_id and comment.movie_id='"+mid+"'")
    return render_template('creator/view comment.html',data=h)

@app.route('/viewfeedback')
def viewfeedback():
    db = Db()
    g=db.select("select * from feedback,user where feedback.sender_id=user.user_id")
    return render_template('creator/view feedback.html',data=g)

@app.route('/viewfollowers')
def followers():
    db = Db()
    f=db.select("select * from followers,user where followers.from_id=user.user_id and followers.to_id='"+str(session['lid'])+"'")
    return render_template('creator/View followers.html',data=f)

@app.route('/viewrating/<mid>')
def viewrating(mid):
    db = Db()
    e=db.select("select * from rating,user where rating.movie_id='"+mid+"' and rating.user_id=user.user_id")
    return render_template('creator/view rating.html',data=e)

@app.route('/viewplaylist')
def viewplaylist():
    db = Db()
    d=db.select("select * from playlist,movie where playlist.movie_id=movie.movie_id")
    return render_template('creator/view playlist.html',data=d)

@app.route('/viewotherscreatorview')
def viewotherscreatorview():
    db = Db()
    return render_template('creator/view others creator view.html')

@app.route('/viewothercreator')
def viewothercreator():
    db = Db()
    c=db.select("select * from creator,user where creator.user_id=user.user_id")
    return render_template('creator/view other creators.html',data=c)

@app.route('/viewmovie')
def viewmovie():
    db = Db()
    b=db.select("select * from movie where creator_id='"+str(session['lid'])+"'")
    return render_template('creator/view movie.html',data=b)

@app.route('/delete_movie/<fid>')
def deletemovie(fid):
    db = Db()
    db.delete("delete from movie where movie_id='"+fid+"'")
    return '''<script>alert("deleted");window.location="/viewmovie"</script>'''


@app.route('/viewmoviereqvideo')
def viewmoviereqvideo():
    db = Db()
    a=db.select("select * from movie_promo ")
    return render_template('creator/view movie req video.html',data=a)

@app.route('/viewhiringandapply')
def viewhiringandapply():
    db = Db()
    qry=db.select("select * from hiring,user where hiring.user_id=user.user_id")
    return render_template('creator/view hiring and apply.html',data=qry)








if __name__ == '__main__':
    app.run()
