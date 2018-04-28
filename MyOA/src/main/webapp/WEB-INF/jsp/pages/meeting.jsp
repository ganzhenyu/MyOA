<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
        Date.prototype.Format = function(format){
            var o = {
                "M+" : this.getMonth()+1, //month
                "d+" : this.getDate(), //day
                "h+" : this.getHours(), //hour
                "m+" : this.getMinutes(), //minute
                "s+" : this.getSeconds(), //second
                "q+" : Math.floor((this.getMonth()+3)/3), //quarter
                "S" : this.getMilliseconds() //millisecond
            };
            if(/(y+)/.test(format)) {
                format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
            }
            for(var k in o) {
                if(new RegExp("("+ k +")").test(format)) {
                    format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
                }
            }
            return format;
        };
        //将数据库的时间戳转成 *年*月*日 字符串
        function getDate(DBTime){
            var date = new Date(DBTime);
            var year = date.getFullYear();
            var month = date.getMonth()+1;
            var day = date.getDate();
            var dateStr;
            if(month<10&&day<10){
                dateStr = year+"-0"+month+"-0"+day;
            }else if(month<10&&day>=10){
                dateStr = year+"-0"+month+"-"+day;
            }else if(month>=10&&day<10){
                dateStr = year+"-"+month+"-0"+day;
            }else if(month>=10&&day>=10){
                dateStr = year+"-"+month+"-"+day;
            }
            return dateStr;
        }
        //将数据库的时间戳转成 *时*分 字符串
        function getTime(DBTime){
            var time = DBTime.substring(0,2)+":"+DBTime.substring(3,5);
            return time;
        }
        $(document).ready(function() {
            $("#save").click(function(){
            	var flag=true;
            	var count = 0;
                var checkArry = $("input[name='actorId']");
                for (var i = 0; i < checkArry.length; i++) {
                    if(checkArry[i].checked == true){
                        count++;
                    }
                }
                if( count == 0 ){
                    $("#soError").show();
                    flag=false;
                }else{
                	$("#soError").hide();
                }
                if($("#title").val()==""){
                	$("#titleError").show();
                	flag=false;
                }else{
                	$("#titleError").hide();
                }
                if($("#startTime").val()=="" || $("#endTime").val()==""){
                	$("#timeError").show();
                	flag=false;
                }else{
                	$("#timeError").hide();
                }
                if(flag){
                	$("#Edit").submit();
                }
            });
            $("#timeError").hide();
            $("#soError").hide();
            $("#titleError").hide();
            $("#soename").click(function(){
            	var name=$("#soso").val();
            	$.ajax({//通过ajax动态查询要展示的课次数据信息
                    url: 'ajax/fetchEname',
                    data : {
                        "name":name
                    },
                    dataType: 'json',
                    type: 'get',
                    success: function (json) {
                    	$("#enamebox").children().remove();
                    	var len=json.data.length;
                    	var list = json.data;
                    	for (var i = 0; i < len; i++) {
                    		var d=list[i];
                    		var item="<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#accordion' href='#collapse"
                    		+d.id+"'>"+d.name+"</a></h4></div><div id='collapse"
                    		+d.id+"' class='panel-collapse collapse in'><div class='panel-body'>";
                    		var elen=d.employees.length;
                    		var elist=d.employees;
                    		for (var j = 0; j < elen; j++) {
                    			var e=elist[j];
                    			item+="<div class='checkbox'><label><input type='checkbox' name='actorId' value='"+e.id+"'>"
                    			+e.name+"</label></div>";
                    		}
                    		item+="</div></div></div>";
                            $("#enamebox").append(item);
                    	}
                    }
            	});   
			});
            function DatePicker(beginSelector,endSelector){
                // 仅选择日期
                $(beginSelector).datetimepicker(
                        {
                            language:  "zh-CN",
                            autoclose: true,
                            startView: 2,
                            format: "yyyy-mm-dd hh:ii",
                            todayBtn:false,
                            startDate:new Date()
                        }).on('changeDate', function(ev){
                            if(ev.date){
                                $(endSelector).datetimepicker('setStartDate', new Date(ev.date.valueOf()))
                            }else{
                                $(endSelector).datetimepicker('setStartDate',null);
                            }
                        });
                $(endSelector).datetimepicker(
                        {
                            language:  "zh-CN",
                            autoclose: true,
                            startView:2,
                            format: "yyyy-mm-dd hh:ii",
                            todayBtn:false
                        }).on('changeDate', function(ev){
                            if(ev.date){
                                $(beginSelector).datetimepicker('setEndDate', new Date(ev.date.valueOf()))
                            }else{
                                $(beginSelector).datetimepicker('setEndDate',new Date());
                            }

                        })
            }

            DatePicker("#date_begin","#date_end");
            
        });
    </script>
<style>
#calendar {
	max-width: 900px;
	margin: 0 auto;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

.clear {
	clear: both;
}
</style>
<div id="page-wrapper">
	<form id="Edit" action="checkActivity" method="post">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4>
					<i class="fa fa-calendar-o"></i>&nbsp;定制会议
				</h4>
			</div>
			<div class="panel-body">
				<div class="col-lg-8 ">
					<div class="form-group">
						<label>会议名称</label> <input class="form-control" id="title" name="title"
							placeholder="会议名称">
					</div>
					<div class="form-group">
						<label id="titleError" class="text-danger">请填写会议名称</label>
					</div>
					<div class="form-group" style="width: 50%; float: left">
						<label>开始时间</label>
						<div class="input-group date" id="date_begin">
							<input type="text" id="startTime" name="startTime" class="form-control" readonly>
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</div>
					<div class="form-group" style="width: 45%; float: right">
						<label>结束时间</label>
						<div class="input-group date" id="date_end">
							<input type="text" id="endTime" name="endTime" class="form-control" readonly>
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</div>
					<div class="form-group">
						<label id="timeError" class="text-danger">请选择时间</label>
					</div>
					<div class="form-group">
						<label>活动地点</label> <input class="form-control" name="location"
							placeholder="活动地点">
					</div>
					<div class="form-group">
						<label>活动描述</label>
						<textarea class="form-control" name="description" rows="3"></textarea>
					</div>
				</div>
				<div class="col-lg-4 ">
				<div class="form-group">
					<label>员工列表</label>
					<div class="form-group input-group">
						<input type="text" id="soso" class="form-control"> <span
							class="input-group-btn">
							<button class="btn btn-default" id="soename" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
					<div class="panel panel-default">
						<div class="col-lg-12 form-group" id="enamebox"
							style="height: 250px; overflow: auto">
								<c:forEach var="d" items="${dlist }">
								<div class="panel panel-default">
				                    <div class="panel-heading">
				                        <h4 class="panel-title">
				                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse${d.id }">${d.name }</a>
				                        </h4>
				                    </div>
				                    <div id="collapse${d.id }" class="panel-collapse collapse in">
				                        <div class="panel-body">
				                        	<c:forEach var="e" items="${d.employees }">
				                            <div class="checkbox">
				                                <label>
				                                    <input type="checkbox" name="actorId" value="${e.id }">${e.name }
				                                </label>
				                            </div>
				                            </c:forEach>
				                        </div>
				                    </div>
				                </div>
								</c:forEach>
						</div>
						<div class="clear"></div>
					</div>
					<label id="soError" class="text-danger">请选择员工</label>
				</div>
			</div>
			<div class="clear"></div>
			</div>
			
		</div>
		<div class="panel-footer" style="text-align: right;padding: 15px">
			<button type="button" class="btn btn-primary" id="save" style="margin-right:20px">保存</button>
			<a href="meeting"><button type="button" class="btn btn-warning" style="margin-right:20px">重置</button></a>
			<a href="activity"><button type="button" class="btn btn-default" style="margin-right:20px">返回</button></a>
		</div>
	</form>
</div>
<!-- /#page-wrapper -->
