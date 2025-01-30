<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="css/admin_home.css">
  </head>
  <body>
    <div id="full">
      <div id="inner_full
        <div id="header
          <div id="full">
            <div id="inner_full">
              <div id="header"><h2 align="center"><a href="admin-home.php" style="text-decoration: none ;color: white;">Blood Bank Management System</a></h2></div>
              <div id="body">
                <br>
                <?php
                $un=$_SESSION['un'];
                if(!$un)
                {
                header("Location:index.php");
                }
                ?>
                <h1 align="center">Welcome Admin</h1><br><br>
                <center><ul>
                  <li><a href="donner-red.php">Donor Registration</a></li>
                  <li><a href="donner-list.php">Donor List</a></li>
                  <li><a href="stoke-blood-list.php">Blood Stock</a></li>
                </ul><br><br><br><br><br>
                <ul>
                  <li><a href="out-stoke-blood-list.php">Blood Used</a></li>
                  <li><a href="exchange-blood-red.php">Exchange Blood Registration</a></li>
                  <li><a href="exchange-blood-list.php">Exchange Blood List</a></li>
                  
                </ul><br><br><br><br><br>
                <ul>
                 <li><a href="search-donor.php">Search Donor</a></li>
                  <li><a href="update-contact.php">Update Donor Contact </a></li>
                   
                </ul>
              </div>
              <div id="footer"><h4 align="center">Thapar University Project 22-23</h4>
                <p align="center" > <a href="logout.php"><font color="white">Logout</font></a></p>
                
              </div>
            </div>
          </div>
        </body>
      </html>