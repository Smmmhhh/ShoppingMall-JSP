<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cart.Cart"%>
<%@ page import="cart.CartDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%

	String memberID = (String) session.getAttribute("memberID");
	if(memberID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../login/login.jsp';");
		script.println("</script>");
	}
	
	request.setCharacterEncoding("UTF-8");

	int cartProdID = Integer.MIN_VALUE;
	int cartProdQuantity = Integer.MIN_VALUE;
	
	if(request.getParameter("prodID") != ""){
		cartProdID = Integer.parseInt(request.getParameter("prodID"));
	}

	if(request.getParameter("prodQuantity") != ""){
		cartProdQuantity = Integer.parseInt(request.getParameter("prodQuantity"));
	}
	
	
	CartDAO cartDAO = new CartDAO();
	int result = cartDAO.cartInsert(cartProdID, memberID, cartProdQuantity);
	
	if (result == 1){}
	
%>	
<!DOCTYPE html>0
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>