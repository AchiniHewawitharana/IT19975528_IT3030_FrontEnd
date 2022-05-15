package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import resources.Billing_Resource;


@WebServlet("/billingAPI")
public class billingAPI extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	
	Billing_Resource billObj = new Billing_Resource();   
    
	
    public billingAPI() {
        super();
        
    }
   
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 // Read the values from the Form
		
		String output = billObj.insertBill( 
				request.getParameter("hidBillIDSave"),
				request.getParameter("power_consumption_ID"),
				request.getParameter("User_Name"), 
				request.getParameter("NIC"), 
				request.getParameter("address"),
				request.getParameter("month"),
				request.getParameter("monthly_units"),
				request.getParameter("rate")
				//request.getParameter("amount")
				);
		
		
		// return the output of the insertItem() method to the client from Java Class
			response.getWriter().write(output);
	}

	//// Convert request parameters to a Map
	// Used for Put and Delete requests
	
	private static Map getParasMap(HttpServletRequest request)
    {
	    Map<String, String> map = new HashMap<String, String>();
	    try
	    {
		    Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
		    String queryString = scanner.hasNext() ?
		    scanner.useDelimiter("\\A").next() : "";
		    scanner.close();
		    String[] params = queryString.split("&");
		    for (String param : params)
		    {
		    	String[] p = param.split("=");
		    	map.put(p[0], p[1]);
		    }
		}
	    catch (Exception e)
	    {		    
	    	
	    }
		return map;
    }
	
	
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map paras = getParasMap(request);
		
		String output = billObj.updateBill(
				paras.get("hidBillIDSave").toString(), 
				
				paras.get("power_consumption_ID").toString(),
				paras.get("User_Name").toString(),
				paras.get("NIC").toString(),
				paras.get("address").toString(),
				paras.get("month").toString(),
				paras.get("monthly_units").toString(),
				paras.get("rate").toString()); 
				
		response.getWriter().write(output);
	}

	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map paras = getParasMap(request);
		
		String output = billObj.deleteBill(paras.get("bill_ID").toString());
		
		response.getWriter().write(output);
	}

}
