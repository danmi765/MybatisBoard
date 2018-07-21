<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="paginate">
    <a href="${url }?page=${param.firstPageNo}" class="first">맨처음</a>
    <a href="${url }?page=${param.prevPageNo}" class="prev">&lt;</a>
    <span>
        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq param.pageNo}"><a href="${url }?page=${i}" class="choice">${i}</a></c:when>
                <c:otherwise><a href="${url }?page=${i}">${i}</a></c:otherwise>
            </c:choose>
        </c:forEach>
    </span>
    <a href="${url }?page=${param.nextPageNo}" class="next">&gt;</a>
    <a href="${url }?page=${param.finalPageNo}" class="last">맨끝</a>
</div>
