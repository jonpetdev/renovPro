<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<jsp:include page="nav.jsp" />
<head>
    <title>Title</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="${contextPath}/js/scriptas.js"></script>

    <style>
        .error {
            color: #ff0000;
        }

        .errorblock {
            color: #000;
            background-color: #ffEEEE;
            border: 3px solid #ff0000;
            padding: 8px;
            margin: 16px;
        }
    </style>
</head>
<body>
<spring:url value="/addBankas" var="ActionUrl" />

<c:if test="${not empty error}">
    <div class="errorblock">
            ${error}
    </div>
</c:if>


<button style="margin: 10px; float: right" class="btn btn-seconadry" data-toggle="modal" data-target="#modalRegisterForm"><i class="glyphicon glyphicon-piggy-bank"></i>  Add</button>
<div class="table-bonas">
<table class="table table-hover" >
    <thead class="table-headas">
    <tr>

        <th class="table-headas-txt">ID</th>
        <th class="table-headas-txt">Banko koduote</th>
        <th class="table-headas-txt">Banko kodas</th>
        <th class="table-headas-txt">Banko Pavadinimas</th>
        <th scope="col" style="width: 100px"></th>

    </tr>
    </thead>

    <tbody >
    <c:if test="${not empty bankulistas}">
        <c:forEach items="${bankulistas}" var="listas">
            <tr>
                <td style="text-align: center">${listas.id}</td>
                <td style="text-align: center">${listas.bankoKoduote}</td>
                <td style="text-align: center">${listas.bankoKodas}</td>
                <td style="text-align: center">${listas.bankoPavadinimas}</td>
                <td style="text-align: center"><div class="btn-group" ><button onclick="location.href='bankulistas/${listas.id}/delete'"  class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i></button></div></td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
</div>











<div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Pridėti Banką</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"    action="${ActionUrl}" modelAttribute="bankas">

            <div class="modal-body mx-3">
                <div class="md-form mb-5">
                    <i class="fas fa-user prefix grey-text"></i>
                    <spring:bind path="bankoKoduote">
                        <form:input path="bankoKoduote" cssClass="form-control validate"></form:input>
                    </spring:bind>
                    <label data-error="wrong" data-success="right" for="bankoKoduote">Banko Koduote</label>
                </div>
                <div class="md-form mb-5">
                    <i class="fas fa-envelope prefix grey-text"></i>
                    <spring:bind path="bankoKodas">
                        <form:input path="bankoKodas" cssClass="form-control validate"></form:input>
                    </spring:bind>
                    <label data-error="wrong" data-success="right" for="bankoKodas">Banko Kodas</label>
                </div>

                <div class="md-form mb-4">
                    <i class="fas fa-lock prefix grey-text"></i>
                    <spring:bind path="bankoPavadinimas">
                        <form:input path="bankoPavadinimas" cssClass="form-control validate"></form:input>
                    </spring:bind>
                    <label data-error="wrong" data-success="right" for="bankoPavadinimas">Banko Pavadinimas</label>
                </div>

            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button class="btn btn-deep-orange" type="submit"> Save </button>
            </div>
            </form:form>
        </div>
    </div>
</div>




</body>
</html>
