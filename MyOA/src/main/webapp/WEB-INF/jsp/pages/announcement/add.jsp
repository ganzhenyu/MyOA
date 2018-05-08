<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    $(document).ready(function() {
        $("#re").click(function(){
            $("#title").val("");
            $("#titleError").hide();
            CKEDITOR.instances.content.setData('');
        });
        $("#save").click(function(){
        	var flag=true;
        	$("#status").val(0);
        	if($("#title").val()==""){
            	$("#titleError").show();
            	flag=false;
            }else{
            	$("#titleError").hide();
            }
        	if(flag){
        		$("#Exit").submit();
            }
            
        })
        $("#titleError").hide();
        $("#cao").click(function(){
        	var flag=true;
        	$("#status").val(0);
        	if($("#title").val()==""){
            	$("#titleError").show();
            	flag=false;
            }else{
            	$("#titleError").hide();
            }
        	if(flag){
        		$("#Exit").submit();
            }
        })
    });
</script>
<div id="page-wrapper">
<form action="addAnnouncement" method="post" id="Exit">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4>
                <i class="fa fa-paperclip"></i>&nbsp;公告申请
            </h4>
        </div>
        <div class="panel-body">
            <input type="hidden" id="status" name="status" value="1">
            <div class="form-group">
                <label>公告标题</label>
                <input class="form-control" id="title" name="title" placeholder="请填写公告标题">
            </div>
            <div class="form-group">
				<label id="titleError" class="text-danger">请填写公告标题</label>
			</div>
            <div class="form-group">
                <label>公告内容</label>
                <textarea id="content" name="content" class="ckeditor form-control"></textarea>
            </div>
            <c:if test="${message!=null }">
            <p class="text-danger">${message}</p>
            </c:if>
        </div>
        <div class="panel-footer text-right">
            <button type="button" class="btn btn-success" id="save" style="margin-right:20px">申请</button>
            <button type="button" class="btn btn-primary" id="cao" style="margin-right:20px">保存至草稿</button>
            <button type="button" class="btn btn-danger" id="re" style="margin-right:20px">重置</button>
        </div>
    </div>
    </form>
    </div>