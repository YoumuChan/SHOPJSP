<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String language = request.getParameter("lang");
    
    if (language == null || language.trim().isEmpty()) {
        language = "ko";
    }
    
    // JSTL용 로케일 세션 저장 및 현재 상태 보존용 세션 추가
    session.setAttribute("javax.servlet.jsp.jstl.fmt.locale.session", language);
    session.setAttribute("currentLang", language);
    
    String referer = request.getHeader("Referer");
    if (referer != null && !referer.isEmpty()) {
        response.sendRedirect(referer);
    } else {
        response.sendRedirect("main.jsp");
    }
%>