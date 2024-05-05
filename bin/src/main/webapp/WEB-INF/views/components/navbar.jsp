<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
          integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
          crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
          integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
          crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
          integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
          crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/b6656cb32d.js" crossorigin="anonymous"></script>
        
         <link rel="stylesheet" href="css/homepage.css"> 
          <link rel="stylesheet" href="css/home.css"> 
         
                   
</head>
<body>

 <div class="row no-gutters" id="homeSection">
 
   <nav class="navbar navbar-expand-lg col-12 navbar-bg-container fixed-top">
    
          <a href="https://itcrats.com/" class="p-0"><img src="images/1024.jpg"
              class="img-fluid ml-3 rounded" height="60" width="140" /></a>
          <button class="navbar-toggler navbar-light " style="border-color:#6c757d;" type="button" data-toggle="collapse"
            data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav m-auto">
              <div>
                <a class="nav-link mx-5  font-weight-bold nav-items anchor-ele" href="/homepage">Home</a>
              </div>
              <div class="div">
                <a class="nav-link mx-5  font-weight-bold nav-items anchor-ele" href="#followUs">Contact Us</a>
    
              </div>
    
              <a class="nav-link mx-5  font-weight-bold nav-items anchor-ele"
                href="resetpassword">Reset Password</a>

               
            </div>

            <div class="mx-5">
            <form action="logout" method="post">
               <input class="btn custom-button font-weight-bold ml-auto zoom-ele"
                  style="border-radius:8px;" type="submit" value="Sign out"/><i
                    class="fa-solid fa-arrow-right-from-bracket ml-2"></i>
                    </form>
            </div>
          </div>
        </nav>
        
 
 </div>
 
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 

</body>
</html>