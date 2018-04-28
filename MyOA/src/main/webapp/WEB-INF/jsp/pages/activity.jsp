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
            $('#calendar').fullCalendar({
                //设置头部信息，如果不想显示，可以设置header为false
                header: {
                    //日历头部左边：初始化切换按钮
                    left: '',
                    //日历头部中间：显示当前日期信息
                    center: 'title',
                    //日历头部右边：初始化视图
                    right: 'prev,next today'
                },
                //月视图下日历格子宽度和高度的比例
                aspectRatio: 1.35,
                //月视图的显示模式，fixed：固定显示6周高；liquid：高度随周数变化；variable: 高度固定
                weekMode: 'liquid',
                //初始化时的默认视图，month、agendaWeek、agendaDay
                defaultView: 'month',
                //agenda视图下是否显示all-day
                allDaySlot: true,
                //agenda视图下all-day的显示文本
                allDayText: '全天',
                //agenda视图下两个相邻时间之间的间隔
                slotMinutes: 30,
                //区分工作时间
                businessHours: true,
                //非all-day时，如果没有指定结束时间，默认执行120分钟
                defaultEventMinutes: 60,
                //设置为true时，如果数据过多超过日历格子显示的高度时，多出去的数据不会将格子挤开，而是显示为 +...more ，点击后才会完整显示所有的数据
                eventLimit: true,
                //设置是否显示周六和周日，设为false则不显示
                weekends: true,
                //日历初始化时显示的日期，月视图显示该月，周视图显示该周，日视图显示该天，和当前日期没有关系
                //defaultDate: '2016-08-11',
                //设置是否可被单击或者拖动选择
                selectable: true,
                //点击或者拖动选择时，是否显示时间范围的提示信息，该属性只在agenda视图里可用
                selectHelper: true,
                //点击或者拖动选中之后，点击日历外的空白区域是否取消选中状态 true为取消 false为不取消，只有重新选择时才会取消
                unselectAuto: true,
                //Event是否可被拖动或者拖拽
                editable: true,
                //Event被拖动时的不透明度
                dragOpacity: 0.5,
                //月份自定义命名
                monthNames : ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                //天数自定义命名
                dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
                //日程数据
                events: function (start, end, timezone, callback) {
                    var date = new Date();
                    var nowDate = date.Format("yyyyMMdd");
                    var nowTime = date.Format("hhmmss");
                    $.ajax({//通过ajax动态查询要展示的课次数据信息
                        url: 'ajax/activity',
                        dataType: 'json',
                        type: 'post',
                        success: function (result) { // 获取当前月的数据
                            var events = [];
                            if (result.data != null) {//result.data其实就是从后台返回前台的一个活动list，
                                var len = result.data.length;
                                var list = result.data;
                                for (var i = 0; i < len; i++) {
                                	var alist=list[i].activity;
                                    var startDate = getDate(alist.startTime);//通过getDate方法将日期格式进行转化
                                    var ccDate = startDate.replace(/\-/g, "");//去掉日期格式中的“-”
                                    var startTime = getTime(alist.startTimeInfo);
                                    var actEndDate=getDate(alist.endTimeAddOneDay);
                                    var userId=alist.employee.id;//创建者id
                                    var endTime = getTime(alist.endTimeInfo);//通过getTime方法将时间格式进行转化
                                    var ccTime = endTime.replace(/\:/g, "");//去掉时间格式中的“:”
                                    if ((ccDate > nowDate || (ccDate == nowDate && ccTime > nowTime))) {
                                    	if(userId==${loginUser.id}){
                                    		events.push({
                                                id: alist.id,//这里我是将活动id作为fullcalendar中event事件的Id
                                                title: startTime+"-"+endTime+" "+alist.title,//title我显示的是活动的名称
                                                start: startDate,//start表示这个event事件放在哪个日期框中
                                                end:actEndDate,	
                                                color: 'green'//设置event的背景颜色，若该活动还没开始且该活动已经删除则显示为红色
                                            });
                                    	}else{
                                    		events.push({
                                                id: alist.id,//这里我是将活动id作为fullcalendar中event事件的Id
                                                title: startTime+"-"+endTime+" "+alist.title,//title我显示的是活动的名称
                                                start: startDate,//start表示这个event事件放在哪个日期框中
                                                end:actEndDate,	
                                                color: '#ff9f2c'//设置event的背景颜色，若该活动还没开始且该活动已经删除则显示为红色
                                            });
                                    	}
                                    } 
                                    else {
                                        events.push({
                                            id: alist.id,
                                            title: startTime+"-"+endTime+" "+alist.title,
                                            start: startDate,
                                            end:actEndDate,	
                                            color: 'gray'//若该活动已经结束则显示为灰色
                                        });
                                    }
                                }
                            }
                            callback(events);
                        },
                    });
                },
                dayClick : function(date, allDay, jsEvent, view ){
                	if(date._d>new Date){
                		$("#date_begin").datetimepicker('setStartDate', date._d);
                    	$("#date_end").datetimepicker('setStartDate', date._d);
                	}else{
                		$("#date_begin").datetimepicker('setStartDate', new Date);
                    	$("#date_end").datetimepicker('setStartDate', new Date);
                	}
                	$("#myActivity").modal("show");//显示弹出框
                },
                eventClick:function( event, jsEvent, view ) {
                    var id=event.id;
                    $.ajax({//通过ajax动态查询要展示的课次数据信息
                        url: 'ajax/fetchActivity',
                        data : {
                            "id": id
                        },
                        dataType: 'json',
                        type: 'get',
                        success: function (json) { // 获取当前月的数据
                        	$("#date_begin_b").datetimepicker('setStartDate', new Date());
                        	$("#date_end_b").datetimepicker('setStartDate', new Date());
                        	$("#loadId").val(json.id);
                            $("#loadTitle").val(json.title);
                            $("#loadDescription").val(json.description);
                            $("#loadLocation").val(json.location);
                            $("#loadStartTime").val(json.startTimeLong);
                            $("#loadEndTime").val(json.endTimeLong);
                            if(event.color=="green"){
                            	$("#deleBut").show();
                                $("#alter").show();
                                $("#riTitle").html("编辑日程");
                                $("#did").val(json.id);
                            }else{
                            	$("#deleBut").hide();
                                $("#alter").hide();
                                $("#riTitle").html("查看日程");
                            }
                            $("#lookActivity").modal("show");//显示弹出框
                        }
                    });
                }
            });
            function DatePicker(beginSelector,endSelector){
                // 仅选择日期
                $(beginSelector).datetimepicker(
                        {
                            language:  "zh-CN",
                            autoclose: true,
                            startView: 2,
                            format: "yyyy-mm-dd hh:ii",
                            todayBtn:false
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
            DatePicker("#date_begin_b","#date_end_b");
            
            $("#save").click(function(){
            	var flag=true;
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
            $("#titleError").hide();
            $("#alter").click(function(){
                $("#lookEdit").submit();
            });
            $("#deleBut").click(function(){
                $("#deleEdit").submit();
            });
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
	<div class="panel panel-info">
		<div class="panel-heading">
			<h4>
				<i class="fa fa-calendar"></i>&nbsp;我的日程
			</h4>
		</div>
		<div class="panel-body">
			<div id='calendar'></div>
		</div>
		<div class="panel-footer"></div>
	</div>
	<!--添加  -->
	<form id="Edit" action="checkActivity" method="post">	
		<div class="modal fade " id="myActivity" tabindex="-1" role="dialog">
			<div class="modal-dialog " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">
							<i class="fa fa-calendar"></i>&nbsp;新建日程
						</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>活动名称</label> <input class="form-control" id="title" name="title"
								placeholder="请填写活动名称">
						</div>
						<div class="form-group">
							<label id="titleError" class="text-danger">请填写会议名称</label>
						</div>
						<div class="form-group" style="width: 50%; float: left">
							<label>开始时间</label>
							<div class="input-group date " id="date_begin">
								<input type="text" id="startTime" name="startTime" class="form-control"
									readonly> <span class="input-group-addon"><i
									class="glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="form-group" style="width: 45%; float: right">
							<label>结束时间</label>
							<div class="input-group date " id="date_end">
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
								placeholder="请填写活动地点">
						</div>
						<div class="form-group">
							<label>活动描述</label>
							<textarea class="form-control" name="description" rows="3"></textarea>
						</div>
						<div class="clear"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="save">保存</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</form>
	<!--查看  -->
	<form id="lookEdit" action="checkActivity" method="post">
		<div class="modal fade " id="lookActivity" tabindex="-1" role="dialog">
			<div class="modal-dialog " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">
							<i class="fa fa-calendar"></i>&nbsp;<span id="riTitle">日程</span>
						</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>活动名称</label> <input type="hidden" id="loadId" name="id">
							<input class="form-control" id="loadTitle" name="title"
								placeholder="请填写活动名称">
						</div>
						<div class="form-group" style="width: 50%; float: left">
							<label>开始时间</label>
							<div class="input-group date" id="date_begin_b">
								<input type="text" id="loadStartTime" name="startTime"
									class="form-control" readonly> <span
									class="input-group-addon"><i
									class="glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="form-group" style="width: 45%; float: right">
							<label>结束时间</label>
							<div class="input-group date" id="date_end_b">
								<input type="text" id="loadEndTime" name="endTime"
									class="form-control" readonly> <span
									class="input-group-addon"><i
									class="glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="form-group">
							<label>活动地点</label> <input class="form-control" id="loadLocation"
								name="location" placeholder="请填写活动地点">
						</div>
						<div class="form-group">
							<label>活动描述</label>
							<textarea class="form-control" id="loadDescription"
								name="description" rows="3"></textarea>
						</div>
						<div class="clear"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="alter">修改并保存</button>
						<button type="button" class="btn btn-danger" id="deleBut">删除</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</form>
	<!--删除  -->
	<form id="deleEdit" action="checkActivity" method="post">
		<input type="hidden" id="did" name="did">
	</form>

</div>
<!-- /#page-wrapper -->
