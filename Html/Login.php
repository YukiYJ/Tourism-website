<!DOCTYPE html>
<!--
Author: Code Apes.
-->
<html>
<head>
 <?php
session_start();
if (isset($_SESSION['login_tourist'])){
	$id = $_SESSION['login_tourist'];
	header("Location:PersonInfo.html?$id");
}
if (isset($_SESSION['login_admin'])){
	$id = $_SESSION['login_admin'];
	header("Location:Admin.html?$id");
}
?>
	<title>Sign In Your Account</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<link type="text/css" rel="stylesheet" href="css/loginPage.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">

<script>
	function change(){// also need to change php
		document.getElementById("loginLabel").innerHTML = "Administrator";
		document.getElementById("button").innerHTML = "For Tourist";
		document.getElementById("button").onclick = revert;
		document.getElementById("reg").innerHTML="";
		document.getElementById("form").action="php/login_Administrator.php";
	}
	function revert(){
		document.getElementById("loginLabel").innerHTML = "Tourist";
		document.getElementById("button").innerHTML = "For Admin";
		document.getElementById("button").onclick = change;
		document.getElementById("reg").innerHTML="<h4>Register Now!</h4>";
		document.getElementById("form").action="php/login_Tourists.php";
	}
</script>
</head>
<body>

<div class="wrapper">
	<nav class="topnav">
		<div id="logo" class="fl_left">
			<a href="index.php"><img src="img/logo.jpg" alt="Homepage"></a>
		</div>
		<div class="topmenu">
			<li><a href="index.php">Home</a></li>
			<li><a href="attraction.html">Attractions</a></li>
			<li><a href="accommodation.html">Accommodation</a></li>
			<li><a href="food.html">Food</a></li>
			<li><a href="plan.html">Plan</a></li>
			<li><a href="about.html">About</a></li>
			<div id="account" class="fl_right">
			  <li>
				<a href="Login.php"><img src="img/account_icon.png" alt="account"></a>
			  </li>
			</div>
		</div>
	</nav>
</div>
<div class="input_container">
  <h1>Login as <label id="loginLabel">Tourist</label></h1>
  <button id="button" onclick='change()'>For Admin</button>
  <a id="reg" href="Registration.html"><h4>Register Now!</h4></a>
  <form id="form" action="php/login_Tourists.php" method="post">
	<label for="uid">UserID</label>
	<input type="text" id="userid" name="userid" placeholder="Your username.." 
	maxlength="16" required="required">
	<br>
	<label for="psword">Password</label>
	<input type="password" id="password" name="password" placeholder="Your password.."
	maxlength="16" required="required">
	<br>
    <input type="submit" value="Confirm">
  </form>
</div>

<footer>
	<div class="wrapper btm">
		<div id="copyright" class="hoc clear">
			<p>Copyright © 2018 #. All Rights Reserved.</p>
		</div>
	</div>
</footer>

</body>

</html>