<%@page import="util.DBConnection"%>
<%@page import="resources.Billing_Resource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Billing Management Service</title>
	
	<!-- Linking the css files -->
	<link rel="stylesheet" href="Views/bootstrap.min.css">
	<link rel="stylesheet" href="Views/form.css">
	
	<!-- Linking the js files -->
	<script src="Components/jquery-3.2.1.min.js"></script>
	<script src="Components/billingJS.js"></script>
	
</head>
<body>

	<% DBConnection userConn = new DBConnection(); %>
		
	<div class="container">
	<div class="row">
	<div class="col-12">
		<h1 align="center">Billing Management Service</h1>
		
		<!--------------------- Start of form  ------------------------------->
		<form id="formCon" name="formCon">
			<!-- 
            <input id = "power_consumption_ID" name = "power_consumption_ID" class="form-control form-control-sm">
            <br>
            <input id = "User_Name" name = "User_Name" class="form-control form-control-sm"> -->
            
            
            <select id = "power_consumption_ID" name = "power_consumption_ID" class="form-control form-control-sm">
            	<option class="dropdown-menu">Consumption ID</option>
                    <%
                    	try{
                    		Connection con = userConn.connectRoot();
                    		Statement st = con.createStatement();
                    		String query = "select * from consumption";
                    		ResultSet rs = st.executeQuery(query);
                    			
                    		while(rs.next()){
                    			%>
                    			<option value="<%=rs.getString("conID")%>"><%=rs.getString("conID") %></option>
                    				<%
                    		}
                    		con.close();
                    	}catch(Exception e){
                    			
                   		}
                   	%>
            </select>
            
			<br> 
			
			<select id = "User_Name" name = "User_Name" class="form-control form-control-sm">
            	<option class="dropdown-menu">User's Name </option>
                    <%
                    	try{
                    		Connection con = userConn.connectRoot();
                    		Statement st = con.createStatement();
                    		String query = "select * from users";
                    		ResultSet rs = st.executeQuery(query);
                    			
                    		while(rs.next()){
                    			%>
                    			<option value="<%=rs.getString("name")%>"><%=rs.getString("name") %></option>
                    				<%
                    		}
                    		con.close();
                    	}catch(Exception e){
                    			
                   		}
                   	%>
            </select> 
			<br>
			<input id="NIC" name="NIC" type="text" class="form-control form-control-sm" placeholder="NIC">
			
			<br>
			
			<input id="address" name="address" type="text" class="form-control form-control-sm" placeholder="Address">
				
			<br>
			<input id="month" name="month" type="text" class="form-control form-control-sm" placeholder="Month">
			<br> 
            
            <input id="monthly_units" name=monthly_units type="text" class="form-control form-control-sm" placeholder="Monthly Units">
			<br>
			
			<input id="rate" name="rate" type="text" class="form-control form-control-sm" placeholder="Rate">
			<br> 
            
			<input id="btnSave" name="btnSave" type="button" value="Save Bill" class="btn btn-primary">
			
			<!-- Hold Bill ID for Update operation -->
            <input type="hidden" id="hidBillIDSave" name="hidBillIDSave" value="">
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
			Billing_Resource objectBill = new Billing_Resource();
			out.print(objectBill.viewAllBills());
		%>
		</div>

	</div>
	</div> 
	</div>
</body>
</html>