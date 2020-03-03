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


</head>
<body>
<spring:url value="/addButas" var="ActionUrl" />

<div style="display: inline">
    <button onclick="location.href='/namaslistas'" style="position:absolute; float: left; margin: 10px" class="btn btn-light"><i class="fas fa-home"> </i>  Home</button>

    <!--Dropdown primary-->
    <button class="btn btn-primary dropdown-toggle mr-4" type="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false" style="position:absolute; left: 200px; margin:10px">Sumos Paskirstymas</button>

    <div class="dropdown-menu btn-light">
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modalSuma">Visos paskolos isdalinimas pagal plota</a>
        <a class="dropdown-item" href="#" >Sumos isdalinimas butams pagal Paskolos Likuti</a>
    </div>
    <!--/Dropdown primary-->


    <button style=" position:absolute; right: 0px; margin: 10px" onclick="location.href='?id=new'"  class="btn btn-light" ><i class="fas fa-city"> </i>  Add</button>
</div>

<div class="table-bonas" style="overflow-x:auto;">
    <table id="dtHorizontalVerticalExample" class="table table-striped table-bordered table-sm " cellspacing="0" width="100%">
    <thead class="table-headas">
    <tr>
        <th class="table-headas-txt" style="width: 50px;border-right: solid 1px grey" >ID</th>
<c:if test="${grid.adresas eq true}">
        <th class="table-headas-txt" style="width: 200px;border-right: solid 1px grey">Adresas</th>
</c:if>
<c:if test="${grid.moketojoKodas eq true}">
        <th class="table-headas-txt" style="width: 80px;border-right: solid 1px grey">Moketojo Kodas</th>
</c:if>
    <c:if test="${grid.bendrasPlotas eq true}">
        <th class="table-headas-txt" style="width: 80px;border-right: solid 1px grey">Bendras Plotas</th>
    </c:if>
        <c:if test="${grid.vardasPavarde eq true}">
        <th class="table-headas-txt" style="width: 200px;border-right: solid 1px grey">Vardas Pavarde</th>
        </c:if>
<c:if test="${grid.delspinigiai eq true}">
        <th class="table-headas-txt" style="width: 80px;border-right: solid 1px grey">Delspinigiai</th>
</c:if>
    <c:if test="${grid.spausdinimas eq true}">
        <th class="table-headas-txt" style="width: 80px;border-right: solid 1px grey">Spausdinimas</th>
    </c:if>
        <c:if test="${grid.bankoKoduote eq true}">
        <th class="table-headas-txt" style="width: 80px;border-right: solid 1px grey">Banko Koduote</th>
        </c:if>
<c:if test="${grid.palukanuProcentas eq true}">
        <th class="table-headas-txt" style="width: 70px;border-right: solid 1px grey">Palukanu procentas</th>
</c:if>
    <c:if test="${grid.menesioDiena eq true}">
        <th class="table-headas-txt" style="border-right: solid 1px grey" data-toggle="tooltip" title="Paskolu grazinimo grafikas (menesio diena)">PGG (diena)</th>
    </c:if>
        <c:if test="${grid.dienuSkaiciusMetuose eq true}">
        <th class="table-headas-txt" style="width: 70px;border-right: solid 1px grey">Dienu skaicius metuose</th>
        </c:if>
            <c:if test="${grid.paskolosGrazinimoTerminas eq true}">
        <th class="table-headas-txt" style="width: 250px">Paskolos grazinimo terminas</th>
            </c:if>
<c:if test="${grid.paskolosSuma eq true}">
        <th class="table-headas-txt" style="width: 80px; border-left: solid 1px white">Paskolos Suma</th>
</c:if>
<c:if test="${grid.paskolosLikutis eq true}">
        <th class="table-headas-txt" style="width: 80px; border-right: solid 1px white">Paskolos Likutis</th>
</c:if>
    <c:if test="${grid.palukanuSuma eq true}">
        <th class="table-headas-txt" style="width: 80px; border-left: solid 1px white">Palukanu Suma</th>
    </c:if>
        <c:if test="${grid.palukanuLikutis eq true}">
        <th class="table-headas-txt" style="width: 80px; border-right: solid 1px white">Palukanu Likutis</th>
        </c:if>
            <c:if test="${grid.atidetuPalukanuSuma eq true}">
        <th class="table-headas-txt" style="width: 80px; border-left: solid 1px white">Atidetu Palukanu Suma</th>
            </c:if>
<c:if test="${grid.atidetuPalukanuLikutis eq true}">
        <th class="table-headas-txt" style="width: 80px; border-right: solid 1px white">Atidetu Palukanu Likutis</th>
</c:if>
        <th class="table-headas-txt"></th>
        <th style="text-align: center;  position: fixed; right:81px; width: 150px;  background: white; border: solid 1px gray; border-right: black; border-bottom-right-radius: 5px">
            <button class="btn btn-light btn-sm" style="margin: auto; width: auto" data-toggle="modal" data-target="#fullHeightModalRight"><i class="fas fa-cog"></i></button>
        </th>
    </tr>
    </thead>

    <tbody >
    <c:if test="${not empty butolistas}">
        <c:forEach items="${butolistas}" var="listas">
            <tr style="height: 50px">
                <td style="text-align: center;border-right: solid 1px grey">${listas.id}</td>
                <c:if test="${grid.adresas eq true}">
                <td style="text-align: center;border-right: solid 1px grey">${listas.namas.gatve} ${listas.namas.namoNr}-${listas.butoNr}</td>
                </c:if>
                <c:if test="${grid.moketojoKodas eq true}">
                <td style="text-align: center;border-right: solid 1px grey">${listas.moketojoKodas}</td>
                </c:if>
                <c:if test="${grid.bendrasPlotas eq true}">
                <td style="text-align: center;border-right: solid 1px grey">${listas.bendrasPlotas}</td>
                </c:if>
                <c:if test="${grid.vardasPavarde eq true}">
                <td style="text-align: center;border-right: solid 1px grey">${listas.vardas} ${listas.pavarde}</td>
                </c:if>
                <c:if test="${grid.delspinigiai eq true}">
                <td style="text-align: center;border-right: solid 1px grey">
                    <c:choose>
                        <c:when test="${listas.delspinigiai eq true}">
                            <div style="width: 20px;height: 20px;border-radius: 10px; background: green; margin: auto">
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div style="width: 20px;height: 20px;border-radius: 10px; background: darkred; margin: auto">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </td>
                </c:if>
                <c:if test="${grid.spausdinimas eq true}">
                <td style="text-align: center;border-right: solid 1px grey">
                    <c:choose>
                        <c:when test="${listas.spausdinti eq true}">
                            <div style="width: 20px;height: 20px;border-radius: 10px; background: green; margin: auto">
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div style="width: 20px;height: 20px;border-radius: 10px; background: darkred;margin: auto">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </td>
                </c:if>
                <c:if test="${grid.bankoKoduote eq true}">
                <td style="text-align: center;border-right: solid 1px grey">${listas.namas.bankas.bankoKoduote}</td>
                </c:if>
                <c:if test="${grid.palukanuProcentas eq true}">
                <td style="text-align: center;border-right: solid 1px grey">${listas.namas.palukanuGrazinimoGrafikas.palukanuProcentas}</td>
                </c:if>
                <c:if test="${grid.menesioDiena eq true}">
                <td style="text-align: center;border-right: solid 1px grey">${listas.namas.palukanuGrazinimoGrafikas.paskolosGrazinimoGrafikoMenesioDiena}</td>
                </c:if>
                <c:if test="${grid.dienuSkaiciusMetuose eq true}">
                <td style="text-align: center;border-right: solid 1px grey">${listas.namas.palukanuGrazinimoGrafikas.dienuSkaiciusMetuose}</td>
                </c:if>
                <c:if test="${grid.paskolosGrazinimoTerminas eq true}">
                <td style="text-align: center; width: 150px">${listas.namas.palukanuGrazinimoGrafikas.paskolosGrazinimoTerminas}</td>
                </c:if>

                <c:if test="${grid.paskolosSuma eq true}">
                <td style="text-align: center; border-left: solid 1px darkorange">${listas.paskolosSuma.visaMoketinaSuma}</td>
                </c:if>
                <c:if test="${grid.paskolosLikutis eq true}">
                <td style="text-align: center; border-right: solid 1px darkorange">${listas.paskolosSuma.paskolosLikutis}</td>
                </c:if>
                <c:if test="${grid.palukanuSuma eq true}">
                <td style="text-align: center; border-left: solid 1px darkorange">${listas.paskolosSuma.visosPalukanos}</td>
                </c:if>
                <c:if test="${grid.palukanuLikutis eq true}">
                <td style="text-align: center; border-right: solid 1px darkorange">${listas.paskolosSuma.palukanuLikutis}</td>
                </c:if>
                <c:if test="${grid.atidetuPalukanuSuma eq true}">
                <td style="text-align: center; border-left: solid 1px darkorange">${listas.paskolosSuma.visosAtidetosPalukanos}</td>
                </c:if>
                <c:if test="${grid.atidetuPalukanuLikutis eq true}">
                <td style="text-align: center; border-right: solid 1px darkorange">${listas.paskolosSuma.atidetuPalukanuLikutis}</td>
                </c:if>
                <td style="padding-right:150px"></td>
                <td style=" position: fixed; right:81px; width: 150px; height: 50px; background: white; border: solid 1px gray; border-right: black; border-bottom-right-radius: 5px; margin: auto" ><div class="btn-group btn-group-sm"><button onclick="location.href='${listas.id}/delete'"  class="btn btn-danger"><i class="fas fa-trash-alt"></i> </button><button onclick="location.href='?id=${listas.id}'"  class="btn btn-light"><i class="fas fa-edit"></i></button></div></td>
            </tr>






        </c:forEach>
    </c:if>
    </tbody>

</table>
</div>
<!-- Update Start-->
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalUpdate"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Buto/Kliento Įvedimas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="/addButas" modelAttribute="butas">
                <form:hidden path="namas" value="${id}"></form:hidden>
                <form:hidden path="id"></form:hidden>
                <div class="modal-body mx-3">
                    <div class="md-form mb-5">
                        <i class="fas fa-city prefix grey-text"></i>
                        <spring:bind path="butoNr">
                            <form:input path="butoNr" cssClass="form-control validate" type="text" required="required"/>
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="butoNr">Buto Numeris</label>
                    </div>
                    <div class="md-form mb-5">
                        <i class="fas fa-barcode prefix grey-text"></i>
                        <spring:bind path="moketojoKodas">
                            <form:input path="moketojoKodas" cssClass="form-control validate" type="number" required="required"/>
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="moketojoKodas">Moketojo Kodas</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fab fa-codepen prefix grey-text"></i>
                        <spring:bind path="bendrasPlotas">
                            <form:input path="bendrasPlotas" cssClass="form-control validate" type="number" step="0.01" required="required" />
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="bendrasPlotas">Bendras Buto Plotas</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="far fa-user prefix grey-text"></i>
                        <spring:bind path="vardas">
                            <form:input path="vardas" cssClass="form-control validate" type="text" required="required" />
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="vardas">Vardas</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-user prefix grey-text"></i>
                        <spring:bind path="pavarde">
                            <form:input path="pavarde" cssClass="form-control validate" type="text" required="required" />
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="pavarde">Pavarde</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-hand-holding-usd prefix grey-text"></i>
                        <spring:bind path="delspinigiai">
                            <form:checkbox path="delspinigiai"   />
                        </spring:bind>
                        <label >Delspinigiai</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-print prefix grey-text"></i>
                        <spring:bind path="spausdinti">
                            <form:checkbox path="spausdinti"   />
                        </spring:bind>
                        <label >Saskaitu Spausdinimas</label>
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


<!-- Setting Gridas Start-->
<div class="modal fade right" id="fullHeightModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-full-height modal-right" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="myModalLabel">Modal title</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="/settingsGridFlat/${namas.id}" modelAttribute="gridFlat">
            <div class="modal-body">
                    <form:hidden path="gridid"></form:hidden>
                    <div class="form-check">
                        <spring:bind path="adresas">
                            <form:checkbox path="adresas" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Adresas</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="moketojoKodas">
                            <form:checkbox path="moketojoKodas" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Moketojo Kodas</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="bendrasPlotas">
                            <form:checkbox path="bendrasPlotas" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Bendras Buto Plotas</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="vardasPavarde">
                            <form:checkbox path="vardasPavarde" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Vardas Pavarde</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="delspinigiai">
                            <form:checkbox path="delspinigiai" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Delspinigiai</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="spausdinimas">
                            <form:checkbox path="spausdinimas" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Spausdinimas</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="bankoKoduote">
                            <form:checkbox path="bankoKoduote" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Banko Koduote</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="palukanuProcentas">
                            <form:checkbox path="palukanuProcentas" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Palukanu Procentas</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="menesioDiena">
                            <form:checkbox path="menesioDiena" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Menesio Diena</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="dienuSkaiciusMetuose">
                            <form:checkbox path="dienuSkaiciusMetuose" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Dienu Skaicius Metuose</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="paskolosGrazinimoTerminas">
                            <form:checkbox path="paskolosGrazinimoTerminas" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Paskolos Grazinimo Terminas</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="paskolosSuma">
                            <form:checkbox path="paskolosSuma" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Paskolos Suma</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="paskolosLikutis">
                            <form:checkbox path="paskolosLikutis" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Paskolos Likutis</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="palukanuSuma">
                            <form:checkbox path="palukanuSuma" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Palukanu Suma</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="palukanuLikutis">
                            <form:checkbox path="palukanuLikutis" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Palukanu Likutis</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="atidetuPalukanuSuma">
                            <form:checkbox path="atidetuPalukanuSuma" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Atidetu Palukanu Suma</label>
                    </div>
                <hr>
                    <div class="form-check">
                        <spring:bind path="atidetuPalukanuLikutis">
                            <form:checkbox path="atidetuPalukanuLikutis" cssClass="form-check-input"/>
                        </spring:bind>
                        <label class="form-check-label">Atidetu Palukanu Likutis</label>
                    </div>

            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
            </form:form>
        </div>
    </div>
</div>
<!-- Setting Gridas END -->


<div class="modal fade" id="modalSuma" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Visos paskolos išdalinimas pagal plota</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"    action="/sumapagalplota/${namas.id}" modelAttribute="suma">

                <div class="modal-body mx-3">
                    <div class="md-form mb-5">
                        <i class="far fa-credit-card prefix grey-text"></i>
                        <spring:bind path="kreditas">
                            <form:input path="kreditas" cssClass="form-control validate" type="number" required="required"/>
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="kreditas">Kredito Suma</label>
                    </div>
                    <div class="md-form mb-5">
                        <i class="fas fa-file-invoice-dollar prefix grey-text"></i>
                        <spring:bind path="palukanos">
                            <form:input path="palukanos" cssClass="form-control validate" type="number" required="required"/>
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="palukanos">Palukanu Suma</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-money-check-alt prefix grey-text"></i>
                        <spring:bind path="atidetosPalukanos">
                            <form:input path="atidetosPalukanos" cssClass="form-control validate" type="number" required="required" />
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="atidetosPalukanos">Atidetu Palukanu Suma</label>
                    </div>

                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-deep-orange" type="submit"> Save </button>
                </div>
            </form:form>
        </div>
    </div>
</div>


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



</script>

</body>
</html>
