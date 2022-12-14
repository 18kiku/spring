<%--
  Created by IntelliJ IDEA.
  User: hwangjeonghwan
  Date: 2022/09/07
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Read</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Board Read
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">

                            <div class="form-group">
                                <label>bno</label>
                                <input class="form-control" name="bno" value="<c:out value="${board.bno}"/>" readonly>
                            </div>
                            <div class="form-group">
                                <label>title</label>
                                <input class="form-control" name="title" value="<c:out value="${board.title}"/>" readonly>
                            </div>
                            <div class="form-group">
                                <label>Text area</label>
                                <textarea class="form-control" rows="3" name="content" readonly><c:out value="${board.content}"/></textarea>
                            </div>
                            <div class="form-group">
                                <label>Writer</label>
                                <input class="form-control" name="writer" value="<c:out value="${board.writer}"/>" readonly>
                            </div>
                            <div class="form-group">
                                <label>RegDate</label>
                                <input class="form-control" name="regdate" value="<fmt:formatDate value="${board.regdate}" pattern="yyyy/MM/dd"/>" readonly>
                            </div>
                            <div class="form-group">
                                <label>Update Date</label>
                                <input class="form-control" name="updateDate" value="<fmt:formatDate value="${board.updateDate}" pattern="yyyy/MM/dd"/>" readonly>
                            </div>
                            <button data-oper="modify" class="btn btn-default">Modify Button</button>
                            <button data-oper="list" class="btn btn-info">List</button>
                        <form id="operForm" action="/board/modify" method="get">
                            <input type="hidden" id="bno" name="bno" value="<c:out value="${board.bno}"/>">
                            <input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}"/>">
                            <input type="hidden" name="amount" value="<c:out value="${cri.amount}"/>">
                            <input type="hidden" name="type" value="${pageMaker.cri.type}">
                            <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                        </form>
                    </div>
                </div>
                <!-- /.row (nested) -->
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
    console.log("=========");
    console.log("JS TEST");

    var bnoValue = '<c:out value="${board.bno}"/> ';

    replyService.getList({bno:bnoValue, page:1}, function (list) {

        for (var i = 0, len = list.length||0; i < len; i++)
            })
</script>

<script type="text/javascript">
    $(document).ready(function() {
        console.log(replyService);
    });
</script>
<script type="text/javascript">
    $(document).ready(function (){
        let operForm = $("#operForm");

        $("button[data-oper='modify']").on("click", function(e){
            operForm.attr("action", "/board/modify").submit();
        })

        $("button[data-oper='list']").on("click", function(e){
            operForm.find("#bno").remove();
            operForm.attr("action", "/board/list").submit();
        })
    })
</script>
<%@include file="../includes/footer.jsp"%>