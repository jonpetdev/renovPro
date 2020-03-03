<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<jsp:include page="nav.jsp" />
<head>
    <title>Title</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="${contextPath}/src/DateTimePicker.css" />
    <script type="text/javascript" src="${contextPath}/src/DateTimePicker.js"></script>
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
<spring:url value="/addNamas1" var="ActionUrl" />
<c:if test="${not empty error}">
    <div class="errorblock">
            ${error}
    </div>
</c:if>

    <jsp:useBean id="namasadd" scope="request"
                 type="org.springframework.beans.support.PagedListHolder" />
    <c:url value="/namaslistas" var="pagedLink">
        <c:param name="p" value="~" />
    </c:url>

    <div style="display: inline">

        <button style="float: right; margin: 10px" onclick="location.href='?id=new'" class="btn btn-light" ><i class="fas fa-home"></i>  Add</button>

        <div style="float: left;margin-top: 35px"><tg:paging pagedListHolder="${namasadd}" pagedLink="${pagedLink}"  /></div>
    </div>




<div class="table-bonas" style="overflow-x:auto;">

<table id="dtHorizontalVerticalExample" class="table table-striped table-bordered table-sm " cellspacing="0" width="100%">
    <thead class="table-headas">
    <tr>

        <th class="table-headas-txt">ID</th>
        <th class="table-headas-txt">Gatve</th>
        <th class="table-headas-txt">Namo numeris</th>
        <th class="table-headas-txt">Namo Kodas</th>
        <th class="table-headas-txt">Banko Pavadinimas</th>
        <th class="table-headas-txt">Kaupiamu lesu saskaita banke</th>
        <th class="table-headas-txt">Palukanu procentas</th>
        <th class="table-headas-txt">Paskolos Grazinimo Grafiko Menesio Diena</th>
        <th class="table-headas-txt">paskolos Grazinimo Terminas</th>
        <th scope="col" style="width: 150px"></th>

    </tr>
    </thead>

    <tbody >
    <c:if test="${not empty namasadd}">
        <c:forEach items="${namasadd.pageList}" var="listas">
            <tr>
                <td style="text-align: center">${listas.id}</td>
                <td style="text-align: center">${listas.gatve}</td>
                <td style="text-align: center">${listas.namoNr}</td>
                <td style="text-align: center">${listas.namoKodas}</td>
                <td style="text-align: center">${listas.bankas.bankoPavadinimas}</td>
                <td style="text-align: center">${listas.kaupLesuSakaitaBanke}</td>
                <td style="text-align: center">${listas.palukanuGrazinimoGrafikas.palukanuProcentas}</td>
                <td style="text-align: center">${listas.palukanuGrazinimoGrafikas.paskolosGrazinimoGrafikoMenesioDiena}</td>
                <td style="text-align: center">${listas.palukanuGrazinimoGrafikas.paskolosGrazinimoTerminas}</td>
                <td style="text-align: center"><div class="btn-group btn-group-sm" ><button onclick="location.href='/butai/${listas.id}'" class="btn btn-light"><i class="fas fa-city"></i></button> <button onclick="location.href='/namasadd/${listas.id}/delete'"  class="btn btn-danger"><i class="fas fa-trash-alt"></i></button> <button onclick="location.href='?id=${listas.id}'" class="btn btn-light"><i class="far fa-edit"></i></button></div></td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
</div>

    <tg:paging pagedListHolder="${namasadd}" pagedLink="${pagedLink}" />

<!-- Update Start-->
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalUpdate"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Namo Įvedimas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="/addNamas1" modelAttribute="namo1">
                <form:hidden path="namas.id"></form:hidden>
                <form:hidden path="palukanuGrazinimoGrafikas.id"></form:hidden>
                <form:hidden path="palukanuGrazinimoGrafikas.namas"></form:hidden>
                <div class="modal-body mx-3">
                    <div class="md-form mb-5">
                        <i class="fas fa-road prefix grey-text"></i>
                        <spring:bind path="namas.gatve">
                            <form:input path="namas.gatve" cssClass="form-control validate" type="text" required="required"/>
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="namas.gatve">Gatvė</label>
                    </div>
                    <div class="md-form mb-5">
                        <i class="fas fa-home prefix grey-text"></i>
                        <spring:bind path="namas.namoNr">
                            <form:input path="namas.namoNr" cssClass="form-control validate" type="text" required="required"/>
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="namas.namoNr">Namo Numeris</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-barcode prefix grey-text"></i>
                        <spring:bind path="namas.namoKodas">
                            <form:input path="namas.namoKodas" cssClass="form-control validate" type="text" required="required" />
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="namas.namoKodas">Namo Kodas</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-piggy-bank prefix grey-text"></i>
                        <spring:bind path="namas.kaupLesuSakaitaBanke">
                            <form:input path="namas.kaupLesuSakaitaBanke" cssClass="form-control validate" type="text" required="required" />
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="namas.kaupLesuSakaitaBanke">Kaupiamų lėšų saskaita banke</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-university prefix grey-text"></i>
                        <div style="margin-left:30px">
                        <spring:bind path="namas.bankas">
                            <form:select path="namas.bankas" required="required" cssClass="browser-default custom-select">
                                <form:option value="0" label="--Please Select--"/>
                                <form:options items="${bankailist}" itemValue="id" itemLabel="bankoPavadinimas"/>
                            </form:select>
                            <form:errors path="namas.bankas" cssClass="error" />
                        </spring:bind>
                        </div>
                    </div>


                    <div class="md-form mb-4">
                        <i class="fas fa-percent prefix grey-text"></i>
                        <spring:bind path="palukanuGrazinimoGrafikas.palukanuProcentas">
                            <form:input path="palukanuGrazinimoGrafikas.palukanuProcentas" cssClass="form-control validate" type="number" step="0.01" required="required" />
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="palukanuGrazinimoGrafikas.palukanuProcentas">Palukanu procentas</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="far fa-calendar-alt prefix grey-text"></i>
                        <spring:bind path="palukanuGrazinimoGrafikas.paskolosGrazinimoGrafikoMenesioDiena">
                            <form:input path="palukanuGrazinimoGrafikas.paskolosGrazinimoGrafikoMenesioDiena" cssClass="form-control validate" type="number" required="required" />
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="palukanuGrazinimoGrafikas.paskolosGrazinimoGrafikoMenesioDiena">Paskolos Grazinimo Grafiko Menesio Diena</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-calendar-check prefix grey-text"></i>
                        <spring:bind path="palukanuGrazinimoGrafikas.paskolosGrazinimoTerminas">
                            <form:input path="palukanuGrazinimoGrafikas.paskolosGrazinimoTerminas" type="text" data-field="date" data-format="yyyy-MM-dd" readonly="true" />
                        </spring:bind>
                        <div id="dtBox"></div>
                        <label data-error="wrong" data-success="right" for="palukanuGrazinimoGrafikas.paskolosGrazinimoTerminas">paskolos Grazinimo Terminas</label>
                    </div>


                    <div class="md-form mb-4">
                        <i class="far fa-calendar prefix grey-text"></i>
                        <spring:bind path="palukanuGrazinimoGrafikas.dienuSkaiciusMetuose">
                            <form:input path="palukanuGrazinimoGrafikas.dienuSkaiciusMetuose" cssClass="form-control validate" type="number" required="required" />
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="palukanuGrazinimoGrafikas.dienuSkaiciusMetuose">Dienu Skaicius Metuose</label>
                    </div>

                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-deep-orange" type="submit"> Save </button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<!-- Update END -->

<script>
    $(document).ready(function () {
        $('#dtHorizontalVerticalExample').DataTable({
            "scrollX": true,
            "scrollY": true,
        });
        $('.dataTables_length').addClass('bs-select');
    });

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })


    $(window).on('load',function(){
        if(${modaladd} === true) {
            $('#modalUpdate').modal('show');
        }
        if(${modalupdate} === true) {
            $('#modalUpdate').modal('show');
        }
    });


    $(document).ready(function()
    {
        $("#dtBox").DateTimePicker();

    });


</script>

</body>
</html>