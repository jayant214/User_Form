<%-- 
    Document   : sahayak
    Created on : Jun 19, 2015, 2:04:35 PM
    Author     : Lenovo
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sahayak Society</title>
        <style>
header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;	 
}
nav {
    line-height:30px;
    background-color:#eeeeee;
    height:500px;
    width:200px;
    float:left;
    padding:5px;	      
}
section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
    padding:5px;	 	 
}
nave {
    line-height:30px;
    background-color:white;
    height:500px;
    width:200px;
    float:left;
    padding:5px;	      
}



</style>
</head>
    <body>
        <header>
<h1>Sahayak Society</h1>
</header>
        <nav>
            
        </nav>
    <nave>
        
    </nave>
        <section>
            <br>
            <br>
<h1>Donor Organisation Details</h1
<br>
<br>
        
        <%!
         public class sahay{
            String URL= "jdbc:mysql://localhost:3306/blood";
            String USERNAME= "root";
            String PASSWORD= "password";
            
            Connection connection= null;
            PreparedStatement insertusers= null;
            ResultSet resultset= null;
            
            public sahay(){
                try{
                    connection= DriverManager.getConnection(URL, USERNAME, PASSWORD);
                    
                    insertusers = connection.prepareStatement("INSERT into organisations( name_of_organisation, address_of_organisation, facilitator, designation, email, phone, phone1, landline, landline1, skype, expected_donors, date, type, landmark, size)" + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    
                    
                }catch (SQLException e){
                    e.printStackTrace();
                }
            }
            
            public int setusers(String first, String second, String third, String fourth, String fifth, String sixth, String seventh, String eigth, String ninth, String tenth, String eleventh, String twelth, String thirteen, String fourteen, String fifteen){
                int result=0;
                try{
                insertusers.setString(1, first);
                insertusers.setString(2, second);
                insertusers.setString(3, third);
                insertusers.setString(4, fourth);
                insertusers.setString(5, fifth);
                insertusers.setString(6, sixth);
                insertusers.setString(7, seventh);
                insertusers.setString(8, eigth);
                insertusers.setString(9, ninth);
                insertusers.setString(10, tenth);
                insertusers.setString(11, eleventh);
                insertusers.setString(12, twelth);
		insertusers.setString(13, thirteen);
		insertusers.setString(14, fourteen);
		insertusers.setString(15, fifteen);
                
                
                result= insertusers.executeUpdate();
                }
 
                catch (SQLException e ){
                    e.printStackTrace();
                }
                return result;
            }
            
            
        }
        %>
        <%!
        public class Read{
            String URL= "jdbc:mysql://localhost:3306/blood";
            String USERNAME= "root";
            String PASSWORD= "password";
            
            Connection connection= null;
            PreparedStatement selectActors= null;
            ResultSet resultset= null;
            
            public Read(){
                try{
                    connection= DriverManager.getConnection(URL, USERNAME, PASSWORD);
                    
                    selectActors = connection.prepareStatement("SELECT available_dates FROM date");
                    
                    
                }catch (SQLException e){
                    System.out.println("connection problem");
                }
            }
            
           public ResultSet getread(){
               
               try{
                   
                   resultset = selectActors.executeQuery();
                   
               } catch (SQLException e){
                    System.out.println("connection problem");
                }
               return resultset;
           }
           }
     %>
        
<%
int result=0;

Read read= new Read();
 
 ResultSet res= read.getread();



String NameOrg= new String();
String AddOrg= new String();
String Facil= new String();
String Desig= new String();
String Mail= new String();
String Phone= new String();
String Skype= new String();
String Expected= new String();
String TypeOrg= new String();
String Landmark= new String();
String DateOrg= new String();
String SizeOrg = new String();
String Phone1 = new String();
String Phone2= new String();
String Phone3= new String();


if (request.getParameter("name") != null)
    NameOrg= request.getParameter("name");
if (request.getParameter("address") != null)
    AddOrg= request.getParameter("address");
if (request.getParameter("facilitator") != null)
    Facil= request.getParameter("facilitator");
if (request.getParameter("designation") != null)
    Desig= request.getParameter("designation");
if (request.getParameter("email") != null)
    Mail= request.getParameter("email");
if (request.getParameter("phone") != null)
    Phone= request.getParameter("phone");
if (request.getParameter("skype") != null)
    Skype= request.getParameter("skype");
if (request.getParameter("expected") != null)
    Expected= request.getParameter("expected");
if (request.getParameter("type") != null)
    TypeOrg= request.getParameter("type");
if (request.getParameter("landmark") != null)
    Landmark= request.getParameter("landmark");
if (request.getParameter("date") != null)
    DateOrg= request.getParameter("date");
  if (request.getParameter("size") != null)
    SizeOrg= request.getParameter("size");
if (request.getParameter("phone1") != null)
    Phone1= request.getParameter("phone1");
if (request.getParameter("phone2") != null)
    Phone2= request.getParameter("phone2");
if (request.getParameter("phone3") != null)
    Phone3= request.getParameter("phone3");



      

    sahay ss= new sahay();
    
    try{
    
        int max=0;
  max = Integer.parseInt(request.getParameter("expected"));
    
 
 
 
 
 
    if (max > 90 ) {
        %>
        
        
        Normal Camps can have maximum 90 donors on a day.
        
        <br> <br>
        
        <%
    
    } 
    
    
    } catch(Exception e){ }
    
    if ((Phone.length() != 0)  &&  (Phone.length() != 10)){
        
       %> 
        
       Enter 10 digit mobile number <br><br>
        
     <%   
        
        
    } else {
    
    
    
       
    ss.setusers(NameOrg, AddOrg, Facil, Desig, Mail, Phone, Phone1, Phone2, Phone3, Skype, Expected, DateOrg, TypeOrg, Landmark, SizeOrg);
     
    }
    
    
    
    
    %>
        
        
       <form name="ssform" action="sahayak.jsp">
       
        <table border="1">
            <thead>
                <tr>
                    <th>Please Fill in Details</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Name of Organisation </td>
                    <td>  <input type="text" name="name" value="" />
                    </td>
                </tr>
                <tr>
                    <td>Address of Organisation  </td>
                    <td>  <input type="text" name="address" value="" />
                    </td>
                </tr>
                <tr>
				<td>Nearest Landmarks</td>
                    <td>  <input type="text" name="landmark" value="" />
                    </td>
                </tr>
				
				
                     <td>Name of Key Facilitator  </td>
                    <td>  <input type="text" name="facilitator" value="" />
                    </td>
                </tr>
                <tr>
                    <td>Designation/ Post of Facilitator in the Organisation </td>
                    <td>  <input type="text" name="designation" value="" />
                    </td>
                </tr>
                <tr>
                    <td>Email </td>
                    <td>  <input type="text" name="email" value="" />
                    </td>
                </tr>
                <tr>
                    <td>Mobile No.(10 digit) </td>
                    <td>  <input type="text" name="phone" value="" />
                    </td>
                </tr>
				
				
                <tr>
				 <td>Alternate Mobile No. </td>
                    <td>  <input type="text" name="phone1" value="" />
                    </td>
                </tr>
				
				
                <tr>
				 <td>Landline No. (with STD code) </td>
                    <td>  <input type="text" name="phone2" value="" />
                    </td>
                </tr>
                
				
				<tr>
				 <td>Alternate Landline No. </td>
                    <td>  <input type="text" name="phone3" value="" />
                    </td>
                </tr>
				
				
				
                   <tr>
                    <td>Skype Id (if any) </td>
                    <td>  <input type="text" name="skype" value="" />
                    </td>
                </tr>
                <tr>
                    <td>Expected number of donors </td>
                    <td>  <input type="text" name="expected" value="" />
                    </td>
                </tr>
                
                
                
                
                <tr>
                   <td>Type of Organisation </td>
                    <td>  
                         <select name="type">
            
            
                             <option> Blood Bank</option>                
             <option> Defense Camp </option> 
             <option>Government Office</option>
             <option> Hospital </option>
             <option> Housing Society </option>
              <option> MNC </option>
              <option> NCC </option>
               <option> NGO </option>
               <option> NSS </option>
             <option> Pathological Lab </option>
              <option> Police Station  </option>
              <option> Union Group </option>
               <option> Others </option>
             
            
            
            
           
            
            
        </select>
                        
                    </td>
                </tr>
                    
                    
                    
                    
                
                
                
                <tr>
                   <td>Date of Donation (yyyy-mm-dd) <sup> &#10035; </sup></td>
                    <td>  
                         <select name="date">
            
            <% while(res.next()) {  %>
            <option><%= res.getDate("available_dates")   %></option>
            
            <%    }  %>
            
            
        </select>
                        
                    </td>
                </tr>
                
                <tr>
                   <td> Normal/Mega Camp </td>
                    <td>  
                         <select name="size">
            
            
            <option>Normal Camp</option>
            <option>Mega Camp</option>
            
             </select>
                        
                    </td>
                </tr>
                
                
                
            </tbody>
        </table>
            <br>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input type="submit" style="float:center;" value="Submit" /> <br> <br> <br>
         </form>
        </section>
            
            
            
            
   
        
            
            <footer>
                Your single gesture can create a million smiles
            </footer>
            
        </body>
</html>
