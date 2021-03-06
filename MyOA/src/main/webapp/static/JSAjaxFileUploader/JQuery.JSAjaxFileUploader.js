/*The MIT License (MIT)
Copyright (c) 2014 https://github.com/JSEver/JSAjaxFileUploader/

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.*/


(function($,undefined){
 var defaults = {
	uploadUrl:null,	//URL to which file must be uploaded Ex: upload.php
	fileName:'file', //File name of the uploade file 
    	inputText:'Select Files...', //Text on file select button
    	formData:{},		//Any extra data to be sent with each uploaded file
	allowExt: 'gif|jpg|jpeg|png|bmp|mp4|mp3|pdf|doc|docx|xcl|txt',	//File extension to be allowed for upload you can specify n number file types
	maxFileSize: 5242880,	//Restric each file size, default 5 MB in Bytes
	beforesend:function(file){}, //function to be executed before each upload for more info please refer https://api.jquery.com/jQuery.ajax/
	always:function(file){}, //function to be executed always each upload for more info please refer https://api.jquery.com/jQuery.ajax/
	done:function(file,xhr){}, //function to be executed on each upload is done for more info please refer https://api.jquery.com/jQuery.ajax/
	fail:function(response){}, //function to be executed on each upload fails for more info please refer https://api.jquery.com/jQuery.ajax/
	progress:function(file,event){}, //function to be executed on each upload is in progress for more info please refer https://api.jquery.com/jQuery.ajax/
	complete:function(file,xhr){}, //function to be executed on each upload completes for more info please refer https://api.jquery.com/jQuery.ajax/
	success:function(response){}, //function to be executed on each upload ajax success for more info please refer https://api.jquery.com/jQuery.ajax/
	error:function(response){}, //function to be executed on each upload ajax error for more info please refer https://api.jquery.com/jQuery.ajax/
	showProgress: true,	//to show or hide progressbar
	closeAnimationSpeed:500, //animation speed to close the file information in mili seconds
	zoomPreview:true,	//Enable/Disable Image enlarge on mouse over
	zoomWidth:160,		//width of enlarged photo
	zoomHeight:170		//height of enlarged photo
 };
 $.filePool = [];
 var uploadStarted = false,elementId=0;
 
 $.fn.JSAjaxFileUploader = function(options) {
	 var settings = $.extend( {}, defaults, options );
	 var JSAjaxFileUploader = this;
	 var form = ['<form method="post" class="JSUploadForm" enctype="multipart/form-data" action=',settings.url,'>',
				'<label class="JSFileChoos"><input type="file" multiple style="display:none"/>',settings.inputText,'</label><ul class="JSpreveiw"></ul></form>'];
	 this.onChange = function(JSNode,e){
		for (var i = 0; i < e.originalEvent.target.files.length; i++){
			var file = e.originalEvent.target.files[i];
			var re = new RegExp('.('+settings.allowExt+')$', "i");
			var $JSView = $('form ul.JSpreveiw',JSNode);
			elementId++;
			var oprIcons = ['<span class="JSOprIcons"><img src="../../Content/JSAjaxFileUploader/img/icons/stop.png" id="stop', elementId, '" title="Stop Upload"><img id="close', elementId, '" src="img/icons/delete.png" title="Close"></span>'];
			if(!(re.test(file.name))) {
				var errMsg = '<span class="JSnotAllowed">File Type Not Suppoted!</span>';
				$JSView.append(prepareLi(_icon(file),file,elementId,true,errMsg));
				_closeStopHandler(elementId,settings.closeAnimationSpeed);
				continue;
			}else if(file.size > settings.maxFileSize){
				var errMsg = '<span class="JSnotAllowed">�ļ���СΪ '+getFileSize(file.size)+' �������ߴ� '+getFileSize(settings.maxFileSize)+' ������!</span>';
				$JSView.append(prepareLi(_icon(file),file,elementId,true,errMsg));
				_closeStopHandler(elementId,settings.closeAnimationSpeed);
				continue;
			}
			if(!!file.type.match(/image.*/)) $.JSRender(JSNode,file,settings,elementId,oprIcons);
			else{
				var li = $(prepareLi(_icon(file),file,elementId,true,''));
				$('form ul.JSpreveiw',JSNode).append(li);
				var data = {
					JSNode:JSNode,
					file:file,
					settings:settings,
					id:elementId
				};
				$.filePool.push(data);
			}
		}
		if(!uploadStarted && $.filePool.length > 0){
			uploadStarted = true;
			_upload($.filePool.shift());
		}
		if(settings.zoomPreview)
			$('form ul li table td img.JSThumbnail',this).JSEnlargeImage({zoomWidth:settings.zoomWidth,zoomHeight:settings.zoomHeight});
	 };
	return this.each(function(){
		var JSNode = $(this);
		JSNode.append(form.join(''));
		$('form input[type="file"]',JSNode).change(function(event){
			JSAjaxFileUploader.onChange(JSNode,event);
		});
	});
 };

 $.JSRender = function(JSNode,file,settings,id,oprIcons) {
	 var img = document.createElement("img");
     var reader = new FileReader();
     reader.onloadend = function() {
         img.src = reader.result;
         $('#thimbImg'+id).attr('src',img.src);
     };
     reader.readAsDataURL(file);
     $('form ul.JSpreveiw',JSNode).append(prepareLi(img.src,file,id,true,''));
     $('form ul.JSpreveiw span#fileId'+(id)+'_spanPercent',JSNode).html('<p style="font-size:9px;margin:0px">Waiting...</p>');
     var data = {
        JSNode:JSNode,
     	file:file,
     	settings:settings,
     	id:id
     };
     $.filePool.push(data);
 };

 
var JSEnlargeImageDefaults = {
	zoomWidth:'160',
	zoomHeight:'170'
};
$.fn.JSEnlargeImage = function(options) {
	 settings = $.extend( {}, JSEnlargeImageDefaults, options );
	 return this.each(function(){
		$(this).off('mouseover,mouseout');
		$(this).on('mouseover',function(e){
			var y = e.pageY < settings.zoomHeight ? settings.zoomHeight : e.pageY;
			var mouseX = e.pageX+20; 
			var mouseY = (y - $(window).scrollTop() - settings.zoomHeight);
			var pho = ['<div id="JSEnlargePhotoTarget" style="display:none;position:fixed;z-index: 9999;width:',settings.zoomWidth,'px;height:',settings.zoomHeight,'px;border: 5px solid rgba(189, 189, 189, 0.59);"><img src="',$(this).attr('src'),'" style="width: inherit;height: inherit;"></img></div>'];
			$(pho.join('')).insertAfter(this);
			$('#JSEnlargePhotoTarget').css({'top':mouseY,'left':mouseX}).fadeIn(200);
		}).on('mouseout',function(){$('#JSEnlargePhotoTarget').remove();});
	});
 };
 

 
function JSStartUpload(opt) {
 return $.ajax({
		url:opt.url,
		type:'POST',
		data: opt.formData,
		processData: false,  // tell jQuery not to process the data
		contentType: false,   // tell jQuery not to set contentType
		xhr: opt.progress,
		beforeSend : function (){if(isValidFunction(opt.beforesend)) opt.beforesend(opt.file);},
		success:function(response){if(isValidFunction(opt.onSuccess)) opt.onSuccess(response);},
		error:function(xhr,textStatus,errorThrown){if(isValidFunction(opt.onError)) opt.onError(xhr, textStatus, errorThrown);}
	 });
 };

 
function getFileSize(bytes){
	 if (typeof bytes !== 'number') return '';
     if (bytes >= 1000000000) return (bytes / 1000000000).toFixed(2) + ' GB';
     if (bytes >= 1000000) return (bytes / 1000000).toFixed(2) + ' MB';
     return (bytes / 1000).toFixed(2) + ' KB';
}


var _upload = function(param){
	var JSNode = param.JSNode,file = param.file,settings = param.settings,id = param.id;
	var formData = false;
	if(window.FormData) {
		formData = new FormData();
	}else alert('Sorry file upload not supported in this browser!');
	formData.append(settings.fileName, file,file.name);
	$.each(settings.formData,function(i,v){formData.append(i, v);});
	if(formData){
		var $sizeSpan = $('#fileId'+(id)+'_span',JSNode);
		var $percentSpan = $('#fileId'+(id)+'_spanPercent',JSNode);
		var $progressBar = $('#fileId'+(id),JSNode); 
		var $stop = $('img#stop'+id,JSNode); 
		var $close = $('img#close'+id,JSNode); 
		var progress = function(){
		    var xhr = new window.XMLHttpRequest();
		    xhr.upload.addEventListener("progress", function(evt){
		      if(isValidFunction(settings.progress)) settings.progress(file,evt);
		      if (settings.showProgress && evt.lengthComputable) {
		        var percentComplete = ((evt.loaded / evt.total)*100).toFixed();
		        $sizeSpan.html(getFileSize(evt.loaded)+' / '+getFileSize(evt.total));
		        $progressBar.css('width',percentComplete+'%');
		        $percentSpan.html(percentComplete+'% ');
		        if(percentComplete >= 100){
		        	var $eml = $('form ul.JSpreveiw li#JSfileLi'+(id),JSNode); 
					$eml.slideUp(settings.closeAnimationSpeed,function(){$eml.remove();});
		        }
		      }
		    }, false);
		    return xhr;
		  };
		var JSxhr = JSStartUpload({url:settings.uploadUrl,file:file,formData:formData,progress:progress,beforesend:settings.beforesend,onSuccess:settings.success,onError:settings.success});
		$stop.on('click',function(){
			if(JSxhr && JSxhr.readystate != 4) JSxhr.abort();
			$stop.off('click');
			$progressBar.css('background-image','linear-gradient(rgb(255, 129, 129) 20%, rgb(199, 5, 5) 90%)');
			$percentSpan.append('Canceled...').css({'font-size':'12px',color:'red'});
			$stop.remove();
		});
		$close.on('click',function(){
			if(JSxhr && JSxhr.readystate != 4) JSxhr.abort();
			var $eml = $('form ul.JSpreveiw li#JSfileLi'+(id),JSNode); 
			$eml.slideUp(settings.closeAnimationSpeed,function(){$eml.remove();});
		});
		if(isValidFunction(settings.always)) JSxhr.always(function(){settings.always(file);});
		if(isValidFunction(settings.complete)) JSxhr.complete(function(){
			if($.filePool.length > 0){
				uploadStarted = true;
				_upload($.filePool.shift());
			}else{
				uploadStarted = false;
			}
			settings.complete(file,JSxhr);
		});
		if(isValidFunction(settings.done)) JSxhr.done(function(){settings.done(file,JSxhr);});
		if(isValidFunction(settings.fail)) JSxhr.fail(function(){settings.fail(file,JSxhr);});
	}
};//end of upload
var _icon = function(file){
	var arr = file.name.split('.');
	var ext = arr[arr.length - 1].toLowerCase();
	switch(ext){
		case 'pdf':return 'img/icons/pdf.png';
		case 'doc':return 'img/icons/doc.png';
		case 'docx':return 'img/icons/docx.png';
		case 'xls':return 'img/icons/excel.png';
		case 'xlsx':return 'img/icons/excel.png';
		case 'xml':return 'img/icons/xml.png';
		case 'txt':return 'img/icons/txt.png';
		default: if(!!file.type.match(/audio.*/)) return 'img/icons/music.png';
				 if(!!file.type.match(/video.*/)) return 'img/icons/media.png';
				 return 'img/icons/unknown.png';
	}
}
function prepareLi(imgSrc,file,id,isUploading,errMsg){
	var li;
	if($(window).width() > 350){
		li = ['<li id="JSfileLi',id,'"><table style="width:100%"><tr><td rowspan=3 style="width: 60px;"><div style="width: 12px;text-align: center;"><img class="JSThumbnail" id="thimbImg',id,'" src="',imgSrc,'" width=50 height=50></div></td><td><span class="JSfilename">',_trimFileName(file.name,30),'</span><td>',
	          (isUploading ? ('<span class="JSOprIcons"><img src="img/icons/stop.png" id="stop'+id+'" title="Stop Upload">') : '' ),'<img id="close',id,'" src="img/icons/delete.png" title="Close"></span></td></tr>',//end of 1st Row
	          '<tr><td style="width:70%"><span class="JSpercent" id="fileId',id,'_spanPercent"></span>',errMsg,'</td><td><span class="JSsize" id="fileId',id,'_span"></span></td></tr>',//end of 2nd Row
	          '<tr><td colspan=2><div><div id="fileId',id,'" class="JSFileProgress"></div></div></td></tr></table></li>'];
	}else{//for Mobile devices change layout
		li = ['<li id="JSfileLi',id,'"><table style="width:100%"><tr><td><span class="JSfilename">',_trimFileName(file.name,20),'</span><td>',
		          (isUploading ? ('<span class="JSOprIcons"><img src="img/icons/stop.png" id="stop'+id+'" title="Stop Upload">') : '' ),'<img id="close',id,'" src="img/icons/delete.png" title="Close"></span></td></tr>',//end of 1st Row
		          '<tr><td colspan=2 style="width: 60px;"><div style="text-align: center;"><img class="JSThumbnail" id="thimbImg',id,'" src="',imgSrc,'" width=30 height=30></div></td></tr>',//end of 2nd row
		          '<tr><td><span class="JSpercent" id="fileId',id,'_spanPercent"></span>',errMsg,'</td></tr>',//end of 3rd Row
		          '<tr><td><span class="JSsize" id="fileId',id,'_span"></span></td></tr>',//end of 4th Row
		          '<tr><td colspan=2><div><div id="fileId',id,'" class="JSFileProgress"></div></div></td></tr></table></li>'];
	}
	return li.join("");
}
var _closeStopHandler = function(id,closeAnimationSpeed){
	$('#close'+id).on('click',function(e){
		var $li = $('#JSfileLi'+id);
		$li.slideUp(closeAnimationSpeed,function(){$li.remove();});
	});
};
var _trimFileName = function(string,length){
	if(string.length > length)
   	 return string.substring(0, 5)+'...'+string.substr(string.length - 6);
   	return string;
};
var isValidFunction = function(fn){
	return (fn !== undefined && fn !== null && typeof fn === 'function');
};
})(jQuery);	
