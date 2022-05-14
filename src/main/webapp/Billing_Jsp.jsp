<%@page import="util.DBConnection"%>
<%@page import="recources.Consumption"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Consumption Monitoring Management</title>
	
	<!-- Linking the css scripts -->
	<link rel="stylesheet" href="Views/bootstrap.min.css">
	<link rel="stylesheet" href="Views/form.css">
	
	<!-- Linking the js files -->
	<script src="Components/jquery-3.2.1.min.js"></script>
	<script src="Components/concept.js"></script>
	
</head>
<body>

	<% DBConnection userConn = new DBConnection(); %>
		
	<div class="container">
	<div class="row">
	<div class="col-12">
		<h1 align="center">Consumption Monitoring Management</h1>
		
		<!--------------------- Start of form  ------------------------------->
		<form id="formCon" name="formCon">
			<select id = "userID" name = "userID" class="form-control form-control-sm">
            	<option class="dropdown-menu">User ID</option>
                    <%
                    	try{
                    		Connection con = userConn.connect();
                    		Statement st = con.createStatement();
                    		String query = "select * from users";
                    		ResultSet rs = st.executeQuery(query);
                    			
                    		while(rs.next()){
                    			%>
                    			<option value="<%=rs.getString("userID")%>"><%=rs.getString("userID") %></option>
                    				<%
                    		}
                    		con.close();
                    	}catch(Exception e){
                    			
                   		}
                   	%>
            </select>
			<br> 
		
			<input id="month" name="month" type="month" class="form-control form-control-sm" placeholder="Month">
			<br> 
            
            <input id="premonreading" name="premonreading" type="text" class="form-control form-control-sm" placeholder="Previous Month Reading">
			<br> 
			
			<input id="curmonreading" name="curmonreading" type="text" class="form-control form-control-sm" placeholder="Current Month Reading">
			<br> 
            
			<input id="btnSave" name="btnSave" type="button" value="Add Consumption" class="btn btn-primary">
            <input type="hidden" id="hidConIDSave" name="hidConIDSave" value="">
		</form>
		<!--------------------- End of form  ------------------------------->
		
		<br>
		<!--------------------- Alerts  ------------------------------->
		<div id="alertSuccess" class="alert alert-success"></div>
		<div id="alertError" class="alert alert-danger"></div>
		<br>
		
		<!--------------------- Display concepts  ------------------------------->
		<div id="divItemsGrid">
		<%
			Consumption consumptionObj = new Consumption();
			out.print(consumptionObj.readConsumption());
		%>
		</div>

	</div>
	</div> 
	</div>
</body>
</html>