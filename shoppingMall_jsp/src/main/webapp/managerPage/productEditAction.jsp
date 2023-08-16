<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");

int prodID = Integer.MIN_VALUE;
String prodName = "";
int selectedCategory = Integer.MIN_VALUE;
int prodPrice = Integer.MIN_VALUE;
int prodStock = Integer.MIN_VALUE;
String prodDetail = "";
String prodSize = "";
String prodOrigin = "";
String prodDate = "";

if (request.getParameter("prodID") != "") {
	prodID = Integer.parseInt(request.getParameter("prodID"));
}

if (request.getParameter("prodName") != "") {
	prodName = (String) request.getParameter("prodName");
}

if (request.getParameter("selectedCategory") != "") {
	selectedCategory = Integer.parseInt(request.getParameter("selectedCategory"));
}

if (request.getParameter("prodPrice") != "") {
	prodPrice = Integer.parseInt(request.getParameter("prodPrice"));
}
if (request.getParameter("prodStock") != "") {
	prodStock = Integer.parseInt(request.getParameter("prodStock"));
}
if (request.getParameter("prodDetail") != "") {
	prodDetail = (String) request.getParameter("prodDetail");
}
if (request.getParameter("prodSize") != "") {
	prodSize = (String) request.getParameter("prodSize");
}
if (request.getParameter("prodOrigin") != "") {
	prodOrigin = (String) request.getParameter("prodOrigin");
}
if (request.getParameter("prodDate") != "") {
	prodDate = (String) request.getParameter("prodDate");
}
// abnormal Case
if (prodPrice == Integer.MIN_VALUE || prodPrice == 0) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('상품가격 0보다 크게 입력해주세요.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}

// normal Case 시퀀스 진행
ProductDAO productDAO = new ProductDAO();
int result = productDAO.updateProductEdit(prodName, selectedCategory, prodPrice, prodStock, prodDetail, prodSize, prodOrigin,
		prodDate, prodID);

if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('상품수정이 완료되었습니다.');");
	script.println("location.href = 'productEditSelect.jsp';");
	script.println("</script>");
	script.close();

	return;
} else {
	out.println("실패 result = " + result);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼 : 상품수정</title>
</head>
<body>

</body>
</html>