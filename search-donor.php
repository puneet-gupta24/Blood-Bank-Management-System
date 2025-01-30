<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Search Donor</title>
    <link rel="stylesheet" type="text/css" href="css/searchdonor.css">
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
                <h1 align="center">Search Donor</h1>
                <center><div id="form">
                  <form action="" method="post">
                    <table>
                      
                      <tr>
                        <td width="200px" height="50px">Select Blood Group</td>
                        <td width="200px" height="50px">
                          <select name="bgroup">
                            <option>Select</option>
                            <option>O+</option>
                            <option>O-</option>
                            <option>Oh+</option>
                            <option>Oh-</option>
                            <option>A+</option>
                            <option>A-</option>
                            <option>B+</option>
                            <option>B-</option>
                            <option>AB+</option>
                            <option>AB-</option>
                          </select>
                        </td>
                        <td width="200px" height="50px">Select State</td>
                        <td width="200px" height="50px">
                          <select name="state">
                            <option>Select</option>
                            <option>Andaman & Nicobar Islands</option>
                            <option>Andhra Pradesh</option>
                            <option>Arunachal Pradesh</option>
                            <option>Assam</option>
                            <option>Bihar</option>
                            <option>Chandigarh</option>
                            <option>Chattisgarh</option>
                            <option>Dadra & Nagar Haveli</option>
                            <option>Daman & Diu</option>
                            <option>Delhi</option>
                            <option>Goa</option>
                            <option>Gujarat</option>
                            <option>Haryana</option>
                            <option>Himachal Pradesh</option>
                            <option>Jammu and Kashmir</option>
                            <option>Jharkhand</option>
                            <option>Karnataka</option>
                            <option>Kerala</option>
                            <option>Ladakh</option>
                            <option>Lakshdweep</option>
                            <option>Madhya Pradesh</option>
                            <option>Maharashtra</option>
                            <option>Manipur</option>
                            <option>Meghalaya</option>
                            <option>Mizoram</option>
                            <option>Nagaland</option>
                            <option>Odisha</option>
                            <option>Puducherry</option>
                            <option>Punjab</option>
                            <option>Rajasthan</option>
                            <option>Sikkim</option>
                            <option>Tamil Nadu</option>
                            <option>Telangana</option>
                            <option>Tripura</option>
                            <option>Uttarakhand</option>
                            <option>Uttar Pradesh</option>
                            <option>West Bengal</option>
                          </select>
                        </td> </td>
                      </tr>
                      <tr>
                        <td><input type="submit" name="sub" value="Submit"></td>
                        <tr>
                          <td><center><b><font color="black">S.No.</font></b></center></td>
                          <td><center><b><font color="black">Name</font></b></center></td>
                          <td><center><b><font color="black">Age</font></b></center></td>
                          
                          <td><center><b><font color="black">Mobile</font></b></center></td>
                          
                          <td><center><b><font color="black">Blood Group</font></b></center></td>
                        </tr>
                      </tr>
                      <?php
                      if(isset($_POST['sub'])) {
                      $bgroup = $_POST['bgroup'];
                      $state = $_POST['state'];
                      $count=0;
                      $q2 = $db->prepare("SELECT dr.bgroup, ad.state, COUNT(*) AS total_donors FROM donor_registration dr JOIN address_d ad ON dr.id = ad.id GROUP BY dr.bgroup, ad.state HAVING dr.bgroup = :bgroup AND ad.state = :state");
                      $q2->bindParam(":bgroup", $bgroup);
                      $q2->bindParam(":state", $state);
                      
                      $q2->execute();
                      //PROCEDURE IS CALLED
                      $q = $db->prepare("CALL search_donor(:bgroup, :state)");
                      $q->bindParam(":bgroup", $bgroup);
                      $q->bindParam(":state", $state);
                      // Iterate over the result set and display the data
                      $q->execute();
                      // Fetch the result set
                      $result = $q->fetchAll();
                      echo "Total donors found: " . $q2->fetch(PDO::FETCH_ASSOC)['total_donors'];
                      foreach ($result as $row) {
                      $count++;
                      ?>
                      <tr>
                        <td><center><?php echo $count; ?></center></td>
                        <td><center><?php echo $row['name']; ?></center></td>
                        <td><center><?php echo $row['age']; ?></center></td>
                        <td><center><?php echo $row['mobile']; ?></center></td>
                        <td><center><?php echo $row['bgroup']; ?></center></td>
                      </tr>
                      <?php
                      
                      }
                      }
                      ?>
                      
                      
                      
                    </table>
                  </form>
                  
                  
                </div></center>
                <div id="footer"><h4 align="center">Thapar University Project 22-23</h4>
                  <p align="center" > <a href="logout.php"><font color="white">Logout</font></a></p>
                </div>
              </div>
            </div>
          </body>
        </html>