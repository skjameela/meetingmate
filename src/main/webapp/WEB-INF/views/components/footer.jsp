<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <jsp:include page="./components/headerlinks.jsp" /> --%>

<!-- Header part -->
<head>

<title>Meeting Mate Home</title>

<!-- bootstrap 4.5.3 links -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
	integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
	crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>

<!--font awesome kit -->
<script src="https://kit.fontawesome.com/b6656cb32d.js"
	crossorigin="anonymous"></script>

<!-- IT Crats fav icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="images/ITCrats_Logo.png" alt="IT CRATS FAV ICON" />
	
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/homepage.css">
</head>

<!-- body part -->
<body>


 <!-- footer section  -->
        <div class="row footer-bg-container">
          <!-- <div class="col-12 col-md-3  text-center zoom-ele">
            <a href="https://itcrats.com/"><img src="{{url_for('static',filename='images/ITCrats_Image.png')}}"
                class="img-fluid" height="60" width="140" /></a>
      
          </div> -->
          <div class="col-12 col-md-4 text-center pt-4 mb-2 zoom-ele">
      
            <h1 class="phoneno">Phone No.</h1>
            <i class="fa-solid fa-phone icon1"></i><span class="contactdetails pl-2">+91 9573002000</span>
          </div>
          <div class="col-12 col-md-4 text-center pt-4 mb-2 zoom-ele">
            <h1 class="phoneno ">E-mail</h1>
            <i class="fa-solid fa-envelope icon1"></i> <span class="contactdetails pl-2">info@itcrats.com</span>
          </div>
          <div class="col-12 col-md-4 text-center pt-4 mb-2 zoom-ele">
            <h1 class="phoneno">Address</h1>
            <i class="fa-solid fa-map-location icon1"></i><span class="contactdetails pl-2">3rd Floor, N-Heights, Plot No 38, Phase 2, Siddiq Nagar,<br> HITEC City, Hyderabad, Telangana 500081</span>
          </div>
      
        </div>
      
        <!-- follow us section -->
      
        <div class="row no-gutters follow-us-section">
          <div class="col-12" id="followUs">
            <h1 class="follow-us-section-heading">Follow Us</h1>
          </div>
          <div class="col-12">
            <div class="d-flex flex-row justify-content-center">
              <a href="https://www.linkedin.com/company/itcrats/" class="zoom-ele">
      
                <i class="fa-brands fa-linkedin icon"></i>
      
              </a>
              <a href="https://twitter.com/itcrats?lang=en" class="zoom-ele">
      
                <i class="fab fa-twitter icon"></i>
      
              </a>
              <a href="https://www.instagram.com/itcrats/?hl=en" class="zoom-ele">
      
                <i class="fa-brands fa-instagram icon"></i>
      
      
              </a>
              <a href="https://www.facebook.com/ITCrats.Solutions/" class="zoom-ele">
      
                <i class="fa-brands fa-square-facebook icon"></i>
      
      
              </a>
      
            </div>
          </div>
          <hr class="col-12 hr-line">
          <div class="col-12 pb-2 pl-4 text-center">
            <i class="fa-regular fa-copyright icon1"></i><span class="bottom-text pl-2">2020 IT Crats. All rights
              reserved.</span>
          </div>
      
        </div>
  
  <!-- linking javascript file-->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>