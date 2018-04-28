<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<script>
    $(document).ready(function() {
        $("#save").click(function(){
        	var flag=true;
        	if($("#title").val()==""){
            	$("#titleError").show();
            	flag=false;
            }else{
            	$("#titleError").hide();
            }
        	if(flag){
        		$("#status").val(1);
                $("#lookEdit").submit();
            }
        })
        $("#cao").click(function(){
        	var flag=true;
        	if($("#title").val()==""){
            	$("#titleError").show();
            	flag=false;
            }else{
            	$("#titleError").hide();
            }
        	if(flag){
        		$("#status").val(0);
                $("#lookEdit").submit();
            }
        })
        $("#titleError").hide();
        $("button.save").click(function(){
        	$("#titleError").hide();
        	var id= $(this).attr("data-id");
            $.ajax({
                url: 'ajax/fetchAnnouncementById',
                data : {
                    "id": id
                },
                dataType: 'json',
                type: 'get',
                success: function (json) {
                	var date=json.data;
                    $("#id").val(date.id);
                    $("#title").val(date.title);
                    CKEDITOR.instances.content.setData(date.content);
                    $("#lookActivity").modal("show");//显示弹出框
                }
            });
        })
        $("a.dele").click(function(){
            if(!confirm("确认要删除？")){
                return false;
            }
        })
    });
    </script>
    <div id="page-wrapper">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4>
                <i class="fa fa-edit"></i>&nbsp;公告拟草
            </h4>
        </div>
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-heading">
                    公告草稿
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover" >
                            <thead >
                            <tr>
                                <th>公告标题</th>
                                <th>创建时间</th>
                                <th>最后修改时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="a" items="${alist1 }">
                            <tr >
                                <td style="vertical-align: middle">
                                <c:if test="${fn:length(a.title)>10 }">  
                         			${fn:substring(a.title, 0, 12)}...  
                   				</c:if>  
                  				<c:if test="${fn:length(a.title)<=10 }">  
                         			${a.title }  
                   				</c:if> 
                                </td>
                                <td style="vertical-align: middle">${a.createTimeLong }</td>
                                <td style="vertical-align: middle">${a.lastEditTimeLong }</td>
                                <td>
                                    <button type="button" class="btn btn-primary save" data-id="${a.id }" >修改</button>
                                    <a href="deleAnnouncement?deleid=${a.id }" class="dele"><button type="button" class="btn btn-danger" >删除</button></a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-heading">
                    审核不通过
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>公告标题</th>
                                <th>创建时间</th>
                                <th>最后修改时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="a" items="${alist2 }">
                            <tr>
                                <td style="vertical-align: middle">
                                <c:if test="${fn:length(a.title)>10 }">  
                         			${fn:substring(a.title, 0, 12)}...  
                   				</c:if>  
                  				<c:if test="${fn:length(a.title)<=10 }">  
                         			${a.title }  
                   				</c:if> 
                                </td>
                                <td style="vertical-align: middle">${a.createTimeLong }</td>
                                <td style="vertical-align: middle">${a.lastEditTimeLong }</td>
                                <td>
                                    <button type="button" class="btn btn-primary save" data-id="${a.id }" >修改</button>
                                    <a href="deleAnnouncement?deleid=${a.id }" class="dele"><button type="button" class="btn btn-danger" >删除</button></a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <div class="panel-footer text-right"></div>
    </div>

    <form id="lookEdit" action="checkAnnouncement" method="post">
            <div class="modal fade " id="lookActivity" tabindex="-1" role="dialog" >
                <div class="modal-dialog " role="document">
                    <div class="modal-content" >
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"><i class="fa fa-pencil"></i>&nbsp;<span id="riTitle">编辑公告</span></h4>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="id" name="id" value="">
                            <input type="hidden" name="no" value="0">
                            <input type="hidden" id="status" name="status" value="0">
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
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="cao">保存至草稿</button>
                            <button type="button" class="btn btn-success" id="save">保存并申请</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </form>
</div>