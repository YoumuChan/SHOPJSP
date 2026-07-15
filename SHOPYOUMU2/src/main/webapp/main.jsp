<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="nav.jsp" />

<div style="min-height: 400px; padding: 50px 0; text-align: center; background-color: #f8f9fa;">
    <% request.setAttribute("currentPage", "홈"); %>
    <%!
        String greeting ="Welcome to Zay Shoppingmaill";
        String tagline  ="쇼핑을 즐긴다, Zay Shopping";
    %>
    
    <h1><%=greeting %></h1>
    <h3><%=tagline %></h3>
    
</div>
<jsp:include page="footer.jsp" />