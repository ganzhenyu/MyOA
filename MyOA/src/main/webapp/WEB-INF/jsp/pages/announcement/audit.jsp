<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script>
	$(document).ready(function() {
		$("#save").click(function(){
			$("#status").val(2);
            $("#lookEdit").submit();
        })
        $("#re").click(function(){
			$("#status").val(3);
            $("#lookEdit").submit();
        })
        $("button.look").click(function(){
        	var id= $(this).attr("data-id");
            $.ajax({//通过ajax动态查询要展示的课次数据信息
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
	});
</script>
<div id="page-wrapper">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4>
				<i class="fa fa-comments"></i>&nbsp;公告审核
			</h4>
		</div>
		<div class="panel-body">
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>公告标题</th>
						<th>创建时间</th>
						<th>最后修改时间</th>
						<th>申请者</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="a" items="${list }">
						<tr class="odd gradeX">
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
							<td class="center" style="vertical-align: middle">${a.creator.name }</td>
							<td class="center">
								<button type="button" class="btn btn-primary look"
									data-id="${a.id }">查看</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- /.table-responsive -->
		</div>
		<div class="panel-footer text-right"></div>
	</div>
	<!-- /.panel -->
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
                            <input type="hidden" name="no" value="1">
                            <input type="hidden" id="status" name="status" value="1">
                            <div class="form-group">
                                <label>公告标题</label>
                                <input class="form-control" readonly id="title" name="title" placeholder="公告标题">
                            </div>
                            <div class="form-group">
                                <label>公告内容</label>
                                <textarea id="content" readonly name="content" class="ckeditor form-control"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="save">通过</button>
                            <button type="button" class="btn btn-danger" id="re">不通过</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </form>

<script>
	var table = $('#dataTables-example').DataTable({
		responsive : true,
		//设置是否自动宽度默认true）
		autoWidth : true,
		//每页行数显示（默认true）
		paging : true,
		//控制是否显示表格左下角的信息（默认true）
		info : true,
		//左上改变表格每页显示的记录数（默认true）
		"lengthChange" : true,
		//左上表格显示数
		"lengthMenu" : [ 5, 10, 25 ],
		//排序是否开启（默认true）
		"ordering" : true,
		//设置列数不允许排序,禁止列数参与搜索
		"columnDefs" : [ {
			"orderable" : false,
			"targets" : 0
		}, {
			"targets" : 1,
			"searchable" : false
		}, {
			"targets" : 2,
			"searchable" : false
		}, {
			"orderable" : false,
			"targets" : 3,
			"searchable" : false
		}, {
			"orderable" : false,
			"targets" : 4,
			"searchable" : false
		}, ],
		//开启本地搜索（默认true）
		"searching" : true,
		'language' : {
			'emptyTable' : '没有数据',
			'loadingRecords' : '加载中...',
			'processing' : '查询中...',
			'search' : '搜索:',
			'lengthMenu' : '每页显示 _MENU_ 条记录',
			'zeroRecords' : '查询不到任何相关数据',
			'paginate' : {
				'first' : '第一页',
				'last' : '最后一页',
				'next' : '下一页',
				'previous' : '上一页'
			},
			'info' : '第 _PAGE_ 页 / 总 _PAGES_ 页 共 _TOTAL_条记录',
			'infoEmpty' : '没有数据',
			'infoFiltered' : '(过滤总件数 _MAX_ 条)'
		}
	});
	//使用一维数组设置表格排序，第二列升序排列并且重绘
	table.order([ 1, 'asc' ]).draw();
</script>