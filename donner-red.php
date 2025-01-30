<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Donor Registration</title>
    <link rel="stylesheet" type="text/css" href="css/donner_reg.css">
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
               
                <h1 align="center">Donor Registration</h1>
                <center><div id="form">
                  <form action="" method="post">
                    <table>
                      
                      <tr>
                        <td width="200px" height="50px">Name</td>
                        <td width="200px" height="50px"><input type="text" name="name" placeholder="Enter Name"></td>
                        <td width="200px" height="50px">Age</td>
                        <td width="200px" height="50px"><input type="text" name="age" placeholder="Enter Age">
                      </td>
                    </tr>
                    
                    <tr>
                      <td width="200px" height="50px">Gender</td>
                      <td width="200px" height="50px">
                        <select name="gender">
                          <option>Select</option>
                          <option>Male</option>
                          <option>Female</option>
                          <option>Other</option>
                          
                        </select>
                      </td>
                      
                      <td width="200px" height="50px">Father Name</td>
                      <td width="200px" height="50px"><input type="text" name="fname" placeholder="Enter Father Name">
                    </td>
                  </tr>
                  
                  <tr>
                    <td width="200px" height="50px">E-Mail</td>
                    <td width="200px" height="50px"><input type="text" name="email" placeholder="Enter E-Mail"></td>
                    <td width="200px" height="50px">Mobile No</td>
                    <td width="200px" height="50px"><input type="text" name="mobile" placeholder="Enter Mobile No"></td>
                  </tr>
                  
                  <tr>
                    <td width="200px" height="50px">Flat No</td>
                    <td width="200px" height="50px"><input type="text" name="flat" placeholder="Enter Flat No"></td>
                    <td width="200px" height="50px">Street</td>
                    <td width="200px" height="50px"><textarea name="street"  cols="20.9" rows="7"></textarea></td>
                    <tr> <td width="200px" height="50px">City</td>
                    <td width="200px" height="50px"><input type="text" name="city" placeholder="Enter City Name"></td>
                    <td width="200px" height="50px">Pincode</td>
                    <td width="200px" height="50px"><input type="text" name="pincode" placeholder="Enter Pincode"></td>
                  </tr>
                  
                  <tr>
                    <td width="200px" height="50px">State</td>
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
                    </td>
                    <td width="200px" height="50px">Country</td>
                    <td width="200px" height="50px"><input type="text" name="country" placeholder="Enter Country"></td>
                  </tr>
                  
                  <tr>
                    <td width="200px" height="50px">Blood Group</td>
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
                  </tr>
                  <tr>
                    <td><input type="submit" name="sub" value="Save"></td>
                  </tr>
                </table>
              </form>
              
              <?php
              if(isset($_POST['sub']))
              {
              
              $id_d = uniqid();
              $name=$_POST['name'];
              $age=$_POST['age'];
              $gender=$_POST['gender'];
              $fname=$_POST['fname'];
              $email=$_POST['email'];
              $mobile=$_POST['mobile'];
              $flat=$_POST['flat'];
              $street=$_POST['street'];
              $city=$_POST['city'];
              $pincode=$_POST['pincode'];
              $state=$_POST['state'];
              $country=$_POST['country'];
              $bgroup=$_POST['bgroup'];
              $q=$db->prepare("INSERT INTO donor_registration (id,name,age,gender,fname,email,mobile,bgroup) VALUES (:id,:name,:age,:gender,:fname,:email,:mobile,:bgroup)" );
              $q->bindValue('id',$id_d);
              $q->bindValue('name',$name);
              $q->bindValue('age',$age);
              $q->bindValue('gender',$gender);
              $q->bindValue('fname',$fname);
              $q->bindValue('email',$email);
              $q->bindValue('mobile',$mobile);
              $q->bindValue('bgroup',$bgroup);
              if($q->execute()){
                 $stmt = $db->prepare("UPDATE bgroup SET units = units + 1 WHERE bgroup = :bgroup");
              $stmt->bindValue(':bgroup', $bgroup, PDO::PARAM_STR);
              $stmt->execute();
              echo "<script>alert('Donor Registration Successfull') </script>";
              }
              else{
              echo "<script>alert('Donor Registration Failed') </script>";
              }

              $q1=$db->prepare("INSERT INTO address_d (id,flat,street,pincode,city,state,country) VALUES (:id,:flat,:street,:pincode,:city,:state,:country)" );
              // $id_query=$db->query("SELECT max(id) FROM donor_registration");
              // $id_result = $id_query->fetch();
              // $id = $id_result[0];
              $q1->bindValue('id',$id_d);
              $q1->bindValue('flat',$flat);
              $q1->bindValue('street',$street);
              $q1->bindValue('pincode',$pincode);
              $q1->bindValue('city',$city);
              $q1->bindValue('state',$state);
              $q1->bindValue('country',$country);
               if($q1->execute()){
              // assuming $q1 is a PDO statement object
  echo "<script>alert('Donor Registration Successful. Please Note this ID: $id_d')</script>";
              }
              else{
              echo "<script>alert('Donor Registration Failed') </script>";
              }
              
             
             
              }
              
              ?>
            </div></center>
            <div id="footer"><h4 align="center">Thapar University Project 22-23</h4>
              <p align="center" > <a href="logout.php"><font color="white">Logout</font></a></p>
            </div>
          </div>
        </div>
      </body>
    </html>