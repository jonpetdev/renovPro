<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ tag import="org.springframework.util.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="pagedListHolder" required="true"
              type="org.springframework.beans.support.PagedListHolder"%>
<%@ attribute name="pagedLink" required="true" type="java.lang.String"%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/css/mdb.min.css">
<link rel="stylesheet" href="${contextPath}/css/style.css">

<script type="text/javascript" src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/mdb.min.js"></script>

<link rel="stylesheet" type="text/css" href="${contextPath}/src/DateTimePicker.css" />
<script type="text/javascript" src="${contextPath}/src/DateTimePicker.js"></script>

<c:if test="${pagedListHolder.pageCount > 1}">
    <div class="btn-group btn-group-sm" style="margin-left: 40px">

        <c:if test="${!pagedListHolder.firstPage}">
            <button class="btn btn-light"
                    onclick="location.href='<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() - 1))%>'"><</button>
        </c:if>
        <c:if test="${pagedListHolder.firstLinkedPage > 0}">
            <button class="btn btn-light"  onclick="location.href='<%=StringUtils.replace(pagedLink, "~", "0")%>'">1</button>
        </c:if>
        <c:if test="${pagedListHolder.firstLinkedPage > 1}">
        <span class="btn btn-primary">...</span>

            </c:if>
            <c:forEach begin="${pagedListHolder.firstLinkedPage}"
                       end="${pagedListHolder.lastLinkedPage}" var="i">
            <c:choose>
            <c:when test="${pagedListHolder.page == i}">
        <button class="btn btn-primary"  onclick="location.href='#'">${i+1}</button>
        </c:when>
        <c:otherwise>
            <button class=" btn btn-light"
                    onclick="location.href='<%=StringUtils.replace(pagedLink, "~", String.valueOf(jspContext.getAttribute("i")))%>'">${i+1}</button>

        </c:otherwise>
        </c:choose>
        </c:forEach>
        <c:if
                test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 2}">
            <span class="btn btn-primary">...</span>
        </c:if>
        <c:if
                test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 1}">
            <button
                    onclick="location.href='<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPageCount() - 1))%>'">${pagedListHolder.pageCount}</button>
        </c:if>
        <c:if test="${!pagedListHolder.lastPage}">
            <button class="btn btn-light"
                    onclick="location.href='<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() + 1))%>'">></button>
        </c:if>

    </div>
</c:if>