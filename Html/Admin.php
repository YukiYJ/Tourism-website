<!DOCTYPE html>
<!--
Author: Code Apes.
-->
<html>
<head>
	<title>Administration</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<style>
	h3{font-weight:normal;}
	h2{font-size:130%;}
	</style>
</head>

<body>
<div class="wrapper">
		<nav class="topnav">
			<div id="logo" class="fl_left">
				<a href="index.php"><img src="img/logo.jpg" alt="Homepage"></a>
			</div>
			<div class="topmenu">
				<li><a href="index.php">Home</a></li>
				<a href="attraction.html">Attraction</a></li>
				<li><a href="accommodation.html">Accommodation</a></li>
				<li><a href="food.html">Food</a></li>
				<li><a href="plan.html">Plan</a></li>
				<li><a href="about.html">About</a></li>
				<div id="account" class="fl_right">
					<li><a href="Login.php"><img src="img/account_icon.png" alt="account"></a></li>
				</div>
			</div>
		</nav>
</div>
<div class="wrapper">
  <main class="container">
	  <div class="sidebar">
	    <h3 style="font-weight:bolder;">Information Management</h3><!-- To be added later-->
	  </div>
    <div class="content">
			<h1>User</h1><hr>
			<div class="searchbar">  
				<div class="search-container">
				<form action="/action_page#.php">
					<input type="text" placeholder="Keyword..." name="search">
					<button type="submit">Search</button>
				</form>
				</div>
			</div><br>
			<table>
			  <tr>
				<td><h2>UserID</h2></td>
				<td><h2>Username</h2></td>
				<td><h2>Email</h2></td>
				<td><h2>Name</h2></td>
				<td><h2>Gender</h2></td>
				<td><h2>Age</h2></td>
				<td><div class="button"><a href="admin_addAttr.php" target="_blank" class="btn btn-small">+</a></div></td><td></td>
			  </tr>
			  <tr>
				<td><h3>#UserID</h3></td>
				<td><h3>#Username</h3></td>
				<td><h3>#Email</h3></td>
				<td><h3>#Name</h3></td>
				<td><h3>#Gender</h3></td>
				<td><h3>#Age</h3></td>
				<td id="Edit1"><div class="button btn btn-small" onclick="EditAge()">Edit</div></td>
				<td id="Delete1"><div class="button btn btn-small" onclick="DeleteAge()">Delete</div></td>
			  </tr>
			  <tr>
			    <td><h3>#UserID</h3></td>
				<td><h3>#Username</h3></td>
				<td><h3>#Email</h3></td>
				<td><h3>#Name</h3></td>
				<td><h3>#Gender</h3></td>
				<td><h3>#Age</h3></td>
				<td id="Edit1"><div class="button btn btn-small" onclick="EditAge()">Edit</div></td>
				<td id="Delete1"><div class="button btn btn-small" onclick="DeleteAge()">Delete</div></td>
			  </tr>
			</table>
			
			<h1>Attraction</h1><a href="attraction.php"><h4>Click here for reference</h4></a><hr>
			<div class="searchbar">  
				<div class="search-container">
				<form action="/action_page#.php">
					<input type="text" placeholder="Keyword..." name="search">
					<button type="submit">Search</button>
				</form>
				</div>
			</div><br>
			<table>
			  <tr>
				<td><h2>Name</h2></td>
				<td><h2>Area</h2></td>
				<td><h2>Level</h2></td>
				<td><div class="button"><a href="admin_addAttr.php" target="_blank" class="btn btn-small">+</a></div></td><td></td>
			  </tr>
			  <tr>
				<td><h3>#Name1</h3></td>
				<td><h3>#Area1</h3></td>
				<td><h3>#Level1</h3></td>
				<td id="Edit1"><div class="button btn btn-small" onclick="EditAge()">Edit</div></td>
				<td id="Delete1"><div class="button btn btn-small" onclick="DeleteAge()">Delete</div></td>
			  </tr>
			  <tr>
			    <td><h3>#Name2</h3></td>
				<td><h3>#Area2</h3></td>
				<td><h3>#Level2</h3></td>
				<td id="Edit2"><div class="button btn btn-small" onclick="EditAge()">Edit</div></td>
				<td id="Delete2"><div class="button btn btn-small" onclick="DeleteAge()">Delete</div></td>
			  </tr>
			</table>
			<h1>Restaurant</h1><a href="restaurant.html"><h4>Click here for reference</h4></a><hr>
			<div class="searchbar">  
				<div class="search-container">
				<form action="/action_page#.php">
					<input type="text" placeholder="Keyword..." name="search">
					<button type="submit">Search</button>
				</form>
				</div>
			</div><br> 
			<table>
			  <tr>
				<td><h2>Name</h2></td>
				<td><h2>Area</h2></td>
				<td><h2>Price</h2></td>
				<td><div class="button"><a href="admin_addAttr.php" target="_blank" class="btn btn-small">+</a></div></td><td></td>
			  </tr>
			  <tr>
				<td><h3>#Name1</h3></td>
				<td><h3>#Area1</h3></td>
				<td><h3>#Price1</h3></td>
				<td id="Edit1"><div class="button btn btn-small" onclick="EditAge()">Edit</div></td>
				<td id="Delete1"><div class="button btn btn-small" onclick="DeleteAge()">Delete</div></td>
			  </tr>
			  <tr>
			    <td><h3>#Name2</h3></td>
				<td><h3>#Area2</h3></td>
				<td><h3>#Price2</h3></td>
				<td id="Edit2"><div class="button btn btn-small" onclick="EditAge()">Edit</div></td>
				<td id="Delete2"><div class="button btn btn-small" onclick="DeleteAge()">Delete</div></td>
			  </tr>
			</table>
			<h1>Accommodation</h1><a href="accommodation.php"><h4>Click here for reference</h4></a><hr>
			<div class="searchbar">  
				<div class="search-container">
				<form action="/action_page#.php">
					<input type="text" placeholder="Keyword..." name="search">
					<button type="submit">Search</button>
				</form>
				</div>
			</div><br> 
			<table>
			  <tr>
				<td><h2>Name</h2></td>
				<td><h2>Area</h2></td>
				<td><h2>AvgPrice</h2></td>
				<td><h2>Type</h2></td>
				<td><div class="button"><a href="admin_addAttr.php" target="_blank" class="btn btn-small">+</a></div></td><td></td>
			  </tr>
			  <tr>
				<td><h3>#Name1</h3></td>
				<td><h3>#Area1</h3></td>
				<td><h3>#AvgPrice1</h3></td>
				<td><h3>#Type1</h3></td>
				<td id="Edit1"><div class="button btn btn-small" onclick="EditAge()">Edit</div></td>
				<td id="Delete1"><div class="button btn btn-small" onclick="DeleteAge()">Delete</div></td>
			  </tr>
			  <tr>
			    <td><h3>#Name2</h3></td>
				<td><h3>#Area2</h3></td>
				<td><h3>#AvgPrice2</h3></td>
				<td><h3>#Type1</h3></td>
				<td id="Edit2"><div class="button btn btn-small" onclick="EditAge()">Edit</div></td>
				<td id="Delete2"><div class="button btn btn-small" onclick="DeleteAge()">Delete</div></td>
			  </tr>
			</table>
	</div>
  </main>
</div>
</body>
</html>