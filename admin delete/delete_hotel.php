
<?php
    $con=mysqli_connect("mysql.comp.polyu.edu.hk","17083686d","fdtwjmfn","17083686d");
    // Check connection
    if (mysqli_connect_errno())
    {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    $HID=$_POST["HID"];

    mysqli_query($con,"DELETE FROM Hotel WHERE HID='$HID'");
                 
    if (mysqli_connect_errno()){
         echo "Failed to connect to MySQL: " . mysqli_connect_error();}
    else{
         echo "New record has been created successfuly";}
                 
    mysqli_close($con);
    ?>
