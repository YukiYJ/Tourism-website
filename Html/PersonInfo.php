<!DOCTYPE html>
<!--
Author: Code Apes.
-->
<html>
<head>
	<title>Account Information</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/loginPage.css">
	<script>
	function EditUname(){
		var content = document.getElementById("uname").innerHTML;
		document.getElementById("unameEdit").innerHTML=
		'<div class="button btn btn-small" onclick="RevertUname()">Confirm</div>';
		document.getElementById("uname").innerHTML=
		'<input type="text" id="unameInput" maxlength="16" placeholder="Your username.." onkeydown="if(event.keyCode==13){RevertUname()}" onchange="RevertUname()">';
		document.getElementById("unameInput").value=content;
	}
	function RevertUname(){
		document.getElementById("unameEdit").innerHTML= 
		'<div class="button btn btn-small" onclick="EditUname()">Edit</div>';
		document.getElementById("uname").innerHTML = document.getElementById("unameInput").value;
		// And send it to database, or else throw error;
	}
	
	function EditFname(){
		var content = document.getElementById("fname").innerHTML;
		document.getElementById("fnameEdit").innerHTML=
		'<div class="button btn btn-small" onclick="RevertFname()">Confirm</div>'
		document.getElementById("fname").innerHTML = 
		'<input type="text" id="fnameInput" maxlength="16" placeholder="Your full name.." onkeydown="if(event.keyCode==13){RevertFname()}" onchange="RevertFname()">';
		document.getElementById("fnameInput").value=content;
	}
	function RevertFname(){
		document.getElementById("fnameEdit").innerHTML= 
		'<div class="button btn btn-small" onclick="EditFname()">Edit</div>';
		document.getElementById("fname").innerHTML = document.getElementById("fnameInput").value;
		// And send it to database, or else throw error, and return the value before;
	}
	
	function EditGender(){
		document.getElementById("genderEdit").innerHTML=
		'<div class="button btn btn-small" onclick="RevertGender()">Confirm</div>'
		document.getElementById("gender").innerHTML = 
		'<select id="genderInput">'
		+ '<option value="Male">Male</option>'
		+ '<option value="Female">Female</option>'
		+ '<option value="Other">Other</option>'
		+ '</select>';
	}
	function RevertGender(){
		document.getElementById("genderEdit").innerHTML= 
		'<div class="button btn btn-small" onclick="EditGender()">Edit</div>';
		document.getElementById("gender").innerHTML = document.getElementById("genderInput").value;
		// And send it to database, or else throw error;
	}
	
	function EditAge(){
		document.getElementById("ageEdit").innerHTML=
		'<div class="button btn btn-small" onclick="RevertAge()">Confirm</div>'
		document.getElementById("age").innerHTML = 
		'<select id="ageInput">'
		 + '<option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option><option value="61">61</option><option value="62">62</option><option value="63">63</option><option value="64">64</option><option value="65">65</option><option value="66">66</option><option value="67">67</option><option value="68">68</option><option value="69">69</option><option value="70">70</option><option value="71">71</option><option value="72">72</option><option value="73">73</option><option value="74">74</option><option value="75">75</option><option value="76">76</option><option value="77">77</option><option value="78">78</option><option value="79">79</option><option value="80">80</option><option value="81">81</option><option value="82">82</option><option value="83">83</option><option value="84">84</option><option value="85">85</option><option value="86">86</option><option value="87">87</option><option value="88">88</option><option value="89">89</option><option value="90">90</option><option value="91">91</option><option value="92">92</option><option value="93">93</option><option value="94">94</option><option value="95">95</option><option value="96">96</option><option value="97">97</option><option value="98">98</option><option value="99">99</option><option value="100">100</option>'
		 + '</select>';	
	}
	function RevertAge(){
		document.getElementById("ageEdit").innerHTML= 
		'<div class="button btn btn-small" onclick="EditAge()">Edit</div>';
		document.getElementById("age").innerHTML = document.getElementById("ageInput").value;
		// And send it to database, or else throw error;
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
				<li><a href="home.html">Home</a></li>
				<li><a href="attractions.html">Attractions</a></li>
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
<div class="wrapper">
	<!-- main body -->
	<main class="hoc container clear">
	  <div class="sidebar">
	    <h3>Account Information</h3>
	  </div>
		<div class="content" style="text-align:center;">
		<h1>Account Information</h1><hr>
		<table>
		<tr>
		  <td><h3>User ID:</h3></td>
		  <td><h3 id="uid">#User ID </h3></td><!-- User ID cannot be changed-->
		  <td></td>
		</tr>
		<tr>
		  <td><h3>Username:</h3></td>
		  <td><h3 id="uname">#Username</h3></td>
		  <td id="unameEdit"><div class="button btn btn-small" onclick="EditUname()">Edit</div></td>
		</tr>
		<tr>
		  <td><h3>Full name:</h3></td>
		  <td><h3 id="fname">#Full name </h3></td>
		  <td id="fnameEdit"><div class="button btn btn-small" onclick="EditFname()">Edit</div></td>
		</tr>
		<tr>
		  <td><h3>Gender:</h3></td>
		  <td><h3 id="gender">#Gender </h3></td>
		  <td id="genderEdit"><div class="button btn btn-small" onclick="EditGender()">Edit</div></td>
		</tr>
		<tr>
		  <td><h3>Age:</h3></td>
		  <td><h3 id="age">#Age </h3></td>
		  <td id="ageEdit"><div class="button btn btn-small" onclick="EditAge()">Edit</div></td>
		</tr>
		<tr>
		  <td><h3>My Plan</h3></td>
		  <td><h5><a href="plan.html">(Click here to view and edit)</a><h5></td>
		  <td> </td>
		</tr>
		</table><br>
		<a href="php/logout.php"><div class="button btn btn-small">Log out</div></a><br>
		<h1>Notice Board</h1><hr>
		<p>Curretly nothing here..<p>
		</div>
	</main>
</div>
<footer>
	<div class="footer">
		<div id="copyright">
			<p>Copyright © 2018 #. All Rights Reserved.</p>
		</div>
	</div>
</footer>
</body>
</html>