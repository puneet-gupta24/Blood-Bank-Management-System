<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Exchanged Blood Donor List</title>
    <link rel="stylesheet" type="text/css" href="css/exchange_blood_list.css">
    <style type="text/css">
    td{
    width:200px;
    height:30px;
    }
    </style>
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
                <h1 align="center">Exchanged Blood Donor List</h1><br><br>
                <center><div id="form">
                  <table>
                    <tr>
                       <td><center><b><font color="black">S.No</font></b></center></td>
                      <td><center><b><font color="black">Name</font></b></center></td>
                      <td><center><b><font color="black">Age</font></b></center></td>
                      <td><center><b><font color="black">Gender</font></b></center></td>
                      <td><center><b><font color="black">Father Name</font></b></center></td>
                      <td><center><b><font color="black">Email</font></b></center></td>
                      <td><center><b><font color="black">Mobile</font></b></center></td>
                      <td><center><b><font color="black">Address</font></b></center></td>
                      <td><center><b><font color="black">Blood Group Donated</font></b></center></td>
                      <td><center><b><font color="black">Blood Group Exchanged</font></b></center></td>
                    </tr>
                    <?php
                    $q=$db->query("SELECT eb.*, CONCAT('Flat No ', ea.flat, ', ', ea.street, ',', ea.city, ',', ea.pincode, ',', ea.state, ',', ea.country) AS address FROM exchange_b eb INNER JOIN address_r ea ON eb.id = ea.id;");
                    $count=0;
                    while($r1=$q->fetch(PDO::FETCH_OBJ)){
                    $count++; // increment the count
                    ?>
                    <tr>
                      <td><center><?=$count; ?></center></td>
                      <td><center><?= $r1->name; ?></center></td>
                      <td><center><?= $r1->age; ?></center></td>
                      <td><center><?= $r1->gender; ?></center></td>
                      <td><center><?= $r1->fname; ?></center></td>
                      <td><center><?= $r1->email; ?></center></td>
                      <td><center><?= $r1->mobile; ?></center></td>
                      <td><center><?= $r1->address; ?></center></td>
                      <td><center><?= $r1->bgroup_d; ?></center></td>
                      <td><center><?= $r1->bgroup_e; ?></center></td>
                    </tr>
                    <?php
                    }
                    ?>
                    
                  </table>
                </div></center>
                <div id="footer"><h4 align="center">Thapar University Project 22-23</h4>
                  <p align="center" > <a href="logout.php"><font color="white">Logout</font></a></p>
                </div>
              </div>
            </div>
          </body>
        </html>