<?php
    $con=mysqli_connect('localhost','root','','ventas');
    if(!$con) {
        die(' Please Check Your Connection'.mysqli_error($con));
    }
?>