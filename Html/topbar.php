<div class="wrapper">
		<nav class="topnav">
			<div id="logo" class="fl_left">
				<a href="index.html"><img src="img/logo.jpg" alt="Homepage"></a>
			</div>
			<div class="topmenu" id="topmenu">
				<li><a href="index.php">Home</a></li>
				<li><a href="attraction.php">Attraction</a></li>
				<li><a href="accommodation.php">Accommodation</a></li>
				<li><a href="food.php">Food</a></li>
				<li><a href="plan.php">Plan</a></li>
				<li><a href="about.php">About</a></li>
				<div id="account" class="fl_right">
					<li><a href="Login.html"><img src="img/account_icon.png" alt="account"></a></li>
				</div>
			</div>
			<div class="searchbar">  
				<div class="search-container">
					<form action="/action_page#.php">
					  <input type="text" placeholder="Keyword..." name="search">
					  <button type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>
</div>

<script type="text/javascript">
// Add active class to the current button (highlight it)
$( ".wrapper .topnav .topmenu a" ).on( "click", function () {
	$( ".wrapper .topnav .topmenu" ).find( "li.active" ).removeClass( "active" );
	$( this ).parent( "li" ).addClass( "active" );
});
</script>