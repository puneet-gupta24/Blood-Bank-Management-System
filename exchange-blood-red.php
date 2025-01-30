<?php
include("connection.php");
session_start();
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Exchange Blood Donor Registration</title>
    <link rel="stylesheet" type="text/css" href="css/exchange_blood_red.css">
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
                <h1 align="center">Exchange Blood Donor Registration</h1>
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
                    <td width="200px" height="50px">Blood Group Donated</td>
                    <td width="200px" height="50px">
                      <select name="bgroup_d">
                        <option> </option>
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
                    <td width="200px" height="50px">Blood Group Recieved</td>
                    <td width="200px" height="50px">
                      <select name="bgroup_e">
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
              $namee=$_POST['name'];
              $age=$_POST['age'];
              $gender=$_POST['gender'];
              $fname=$_POST['fname'];
              $email=$_POST['email'];
              $mobilee=$_POST['mobile'];
              $flat=$_POST['flat'];
              $street=$_POST['street'];
              $city=$_POST['city'];
              $pincode=$_POST['pincode'];
              $state=$_POST['state'];
              $country=$_POST['country'];
              $bgroup_d=$_POST['bgroup_d'];
              $bgroup_e=$_POST['bgroup_e'];
              if ($age >17)
              {
              if($bgroup_e !== $bgroup_d)
              {
              $q5="select * from donor_registration where bgroup = '$bgroup_e'";
              $st=$db->query($q5);
              $num_row=$st->fetch();
              if (!$num_row) {
              echo "<script>alert('Sorry, the required blood group is not available.')</script>";
              } else {
              $q="select * from donor_registration where bgroup = '$bgroup_e'";
              // $st=$db->query($q);
              // echo $num_row=$st->rowcount();
              $st=$db->query($q);
              $num_row=$st->fetch();
              $id=$num_row['id'];
              $name=$num_row['name'];
              $b1=$num_row['bgroup'];
              $mobile=$num_row['mobile'];
              $q1="INSERT INTO out_stoke_b (bgroup,name,mobile) value (?, ?, ?)";
              $st1=$db->prepare($q1);
              $st1->execute([$b1, $name, $mobile]);
              //select and insert end
              //delete code
              $q2="delete from donor_registration where id='$id'";
              $st1=$db->prepare($q2);
              $st1->execute();
              //delete code
              $q=$db->prepare("INSERT INTO exchange_b (id,name,age,gender,fname,email,mobile,bgroup_d,bgroup_e) VALUES (:id,:name,:age,:gender,:fname,:email,:mobile,:bgroup_d,:bgroup_e)" );
              $q->bindValue('id',$id_d);
              $q->bindValue('name',$namee);
              $q->bindValue('age',$age);
              $q->bindValue('gender',$gender);
              $q->bindValue('fname',$fname);
              $q->bindValue('email',$email);
              $q->bindValue('mobile',$mobilee);
              $q->bindValue('bgroup_d',$bgroup_d);
              $q->bindValue('bgroup_e',$bgroup_e);
              if($q->execute()){
              echo "<script>alert('Donor Registration Successfull') </script>";
              }
              else
              {
              echo "<script>alert('Donor Registration Failed') </script>";
              }
              $q1=$db->prepare("INSERT INTO address_r (id,flat,street,pincode,city,state,country) VALUES (:id,:flat,:street,:pincode,:city,:state,:country)" );
              $q1->bindValue('id',$id_d);
              $q1->bindValue('flat',$flat);
              $q1->bindValue('street',$street);
              $q1->bindValue('pincode',$pincode);
              $q1->bindValue('city',$city);
              $q1->bindValue('state',$state);
              $q1->bindValue('country',$country);
              $q2=$db->prepare("INSERT INTO donor_registration (id,name,age,gender,fname,email,mobile,bgroup) VALUES (:id,:name,:age,:gender,:fname,:email,:mobile,:bgroup)" );
              $q2->bindValue('id',$id_d);
              $q2->bindValue('name',$namee);
              $q2->bindValue('age',$age);
              $q2->bindValue('gender',$gender);
              $q2->bindValue('fname',$fname);
              $q2->bindValue('email',$email);
              $q2->bindValue('mobile',$mobilee);
              $q2->bindValue('bgroup',$bgroup_d);
              $q2->execute();
              $q3=$db->prepare("INSERT INTO address_d (id,flat,street,pincode,city,state,country) VALUES (:id,:flat,:street,:pincode,:city,:state,:country)" );
              $q3->bindValue('id',$id_d);
              $q3->bindValue('flat',$flat);
              $q3->bindValue('street',$street);
              $q3->bindValue('pincode',$pincode);
              $q3->bindValue('city',$city);
              $q3->bindValue('state',$state);
              $q3->bindValue('country',$country);
              $q3->execute() ;
              
              if($q1->execute())
              {
                 $stmt = $db->prepare("UPDATE bgroup SET units = units + 1 WHERE bgroup = :bgroup_d");
              $stmt->bindValue(':bgroup_d', $bgroup_d, PDO::PARAM_STR);
              $stmt->execute();
               $stmt1 = $db->prepare("UPDATE bgroup SET units = units - 1 WHERE bgroup = :bgroup_e");
              $stmt1->bindValue(':bgroup_e', $bgroup_e, PDO::PARAM_STR);
              $stmt1->execute();
              echo "<script>alert('Donor Registration Successful. Please Note this ID: $id_d')</script>";
              }
              else
              {
              echo "<script>alert('Donor Registration Failed') </script>";
              }
              //exhange info insert end
              
              }
              //select and insert
              }
              else
              {
              echo "<script>alert('Donated Blood Type And Required Blood Type Cannot Be Same')</script>";
              }
              }
              else
              {
              echo "<script>alert('Age should be greater than 18')</script>";
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