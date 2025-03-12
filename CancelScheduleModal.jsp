<%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link
	href="/DLI/resources/app_srv/msip/gl/theme/bootstrap-combined.no-icons.min.css"
	rel="stylesheet">
<link
	href="/DLI/resources/app_srv/msip/gl/theme/bootstrap-responsive.min.css"
	rel="stylesheet">
<link href="/DLI/resources/app_srv/msip/gl/theme/home.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="/DLI/resources/app_srv/msip/gl/theme/jquery-ui.css" />

<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/jquery.hotkeys.js"></script>
<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">

<link href="/DLI/resources/app_srv/msip/gl/theme/editor.css"
	rel="stylesheet">
<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/bootstrap-wysiwyg.js"></script>

<!--   script for number textbox -->
<script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/jquery-ui.js"></script>
<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/data-generator.js"
	type="text/javascript"></script>

<!-- CSS and JS for responsive tables -->
<link href="/DLI/resources/app_srv/msip/gl/theme/bootstrap_foo.css"
	rel="stylesheet" type="text/css" />
<link
	href="/DLI/resources/app_srv/msip/gl/theme/footable.core.css?v=2-0-1"
	rel="stylesheet" type="text/css" />
<link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css"
	rel="stylesheet" type="text/css" />




<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable_v2.js?v=2-0-1"
	type="text/javascript"></script>

<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sort.js?v=2-0-1"
	type="text/javascript"></script>
<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter_v2.js?v=2-0-1"
	type="text/javascript"></script>
<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate_v2.js?v=2-0-1"
	type="text/javascript"></script>


<script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.sticky.js"></script>
<!-- for ios style switch -->
<link rel="stylesheet"
	href="/DLI/resources/app_srv/msip/gl/theme/switchery.css" />
<!-- <link rel="stylesheet" href="dist/switchery.css" /> -->
<script src="/DLI/resources/app_srv/msip/gl/jssrc/switchery.js"></script>

<script type="text/javascript"
	src="/DLI/resources/app_srv/msip/gl/jssrc/charCount.js"></script>
<link rel="stylesheet"
	href="/DLI/resources/app_srv/msip/gl/theme/jquery-labelauty.css"
	type="text/css" media="screen" charset="utf-8" />
<script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery-labelauty.js"></script>

 <script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.ui.widget.js"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.iframe-transport.js"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.fileupload.js"></script>
	<script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.easyui.js"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc//bootstrap.min.js"></script>
	
	
	 <!-- sweet alert css and js -->
<script src="/DLI/resources/app_srv/msip/gl/jssrc/sweetalert2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/DLI/resources/app_srv/msip/gl/theme/sweetalert2.css" />
 <!-- sweet alert css and js -->
<style>
#floatheader {
	background: #C8C8C8;
	color: white;
	text-align: center;
	width: 100%;
	height: 6%;
	box-sizing: border-box;
	z-index: 1;
	position: fixed;
	float: none;
}
</style>

<script>
     
     $(document).ready(function() {
     	
     	$('table').footable();
     	
    	 $("#floatheader").sticky({ });
    	 var v=($(document).innerHeight()/1.07)+"px";
    	 $("#floatheader").css({"margin-top": v}); 
    	 
    	 $("#editor").css("height",$(window).height()-300);
    	 $("#editor").css("max-height",$(window).height()-300);
    	 
    	var elems = Array.prototype.slice.call(document.querySelectorAll('.demo'));

		elems.forEach(function(html) {
		  var switchery = new Switchery(html,{ color: '#0090F1'});
		});

    		$('#smsalert').change(function() {
		        if($(this).is(":checked")) {
		            $('#smsDiv').show();
		            $('#smsInput').val("Y");
		        }
		        else{
		            $('#smsDiv').hide();
		            $('#smsInput').val("N");
		        }
	    	});
	    	
	    	
	    	$('#alluser').change(function() {
		        if($(this).is(":checked")) {
		            $('#alluserDiv').hide();
		        }
		        else{
		            $('#alluserDiv').show();
		        }
	    	});
	    	
	    	$('#attach').change(function() {
		        if($(this).is(":checked")) {
		            $('#attachDiv').show();
		        }
		        else{
		            $('#attachDiv').hide();
		        }
	    	});
	    	
	    	
	    	
	    $("#smsText").charCount({
			allowed: 160,		
			warning: 10,
			counterText: 'Characters left:  '	
		});
		
		  $(".stylish").labelauty({same_width:true,minimum_width: "250px"});
	    	
    	});
     
     
     </script>

<!-- Centering the Pop Up window-->
<script type="text/javascript">
var popupWindow = null;
function centeredPopup(url,winName,w,h,scroll)
{
LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
settings ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable';
popupWindow = window.open(url,winName,settings);
}
</script>

<script>
  function Remove(filename){
	 var answer = confirm('Are you sure you want to delete this file?');
		if(answer){
		  	$.ajax(
		  	{
		  			type: "POST",
			        url: "/DLI/controller/removeNewsLetterDoc/"+filename,
			        success: function(response){
						$('#progress .bar').css(
					        'width',
					        0 + '%'
					     );
						var value_arr = $('#documentIDs').val();
						value_arr = JSON.parse(value_arr);
						var removeItem = filename;
						value_arr = jQuery.grep(value_arr, function(value) {
						  return value != removeItem;
						});

						$('#documentIDs').val(JSON.stringify(value_arr));
			        },
			        
			        error: function(e){
		        	}
		  	});
		  	$(document).on('click', '.removeClass', function(){
						    $(this).closest ('tr').remove ();
						});
		}
  }
  
  </script>
  
  <script>

  </script>

 <script>
 $(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        beforeSend: function(){
	            callMe();
	       },
	       complete: function(){
	           $.unblockUI();
	       },
        done: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        var flag = 0;
            $.each(data.result, function (index, file) {
	           			var rowCount = $('#dataTable tr').length;
				    	$("#dataTable").append("<tr><td>" + (rowCount-1) + "</td><td><a href='controller/getNewsLetterDocument/"+file.documentId+"'>" + file.fileName + "</a></td><td><a href='#!' class='removeClass' onclick='Remove(\""+file.documentId+"\")'><i title='Delete' class='pad-left icon-remove-sign asphalt '></i></a></td></tr>");
	                	var value_arr = $('#documentIDs').val();
	                	if($.trim(value_arr)==''){
	                		var array = [];
	                		array.push(file.documentId);
	                		$('#documentIDs').val(JSON.stringify(array));
	                	}
	                	else{
							value_arr = JSON.parse(value_arr);
							value_arr.push(file.documentId);
							$('#documentIDs').val(JSON.stringify(value_arr));
	                	}
	                	
	                	$('#progress .bar').css(
		    	        'width',
		    	        progress + '%'
		    	    	);
            });
        } 
        });
    });
    
 $(function() {
      $('table').footable();
    });
 
  </script>	
  
<script>
	    function printClick() {
	    	var global='<fieldset>				<div class="whole align-left"><Div class="one tenth align-left">Hello</Div> <div class="green three fourth align-left"><c:out value="<USER_NAME>"></c:out></div></div><br/><br/><div class="whole align-left"><Div class="one fourth align-left">The Meeting scheduled for </Div> <div class="green three fourth align-left"><c:out value="<COMMITEE_NAME>"></c:out></div></div><div class="whole align-left"><Div class="one fourth align-left">Meeting Agenda:</Div> <div class="green three fourth align-left"><c:out value="<MEETING_AGENDA>"></c:out></div></div><div class="whole align-left"><Div class="one fourth align-left">Meeting Time:</Div> <div class="green three fourth align-left"><c:out value="<MEETING_TIME>"></c:out></div></div><div class="whole align-left"><Div class="one fourth align-left">Meeting Date :</Div> <div class="green three fourth align-left"><c:out value="<MEETING_FROM_DATE> - <MEETING_TO_DATE>"></c:out></div></div><div class="whole gap-bottom align-left"><Div class="one fourth align-left">Meeting Venue :</Div> <div class="green three fourth align-left"><c:out value="<MEETING_VENUE>"></c:out></div></div><br/><br/><div class="whole align-left"><strong>has been cancelled</strong> due to</div><br/><br/><div class="align-left">'+$("#editor").html()+'<br/><br/>Thank You, <br/> Team DLI.</div></fieldset>'
	    	 
	    	//var global= '<fieldset> <div class="align-left">'+${MailPreview}+'<br/>'+$("#editor").html()+'<br/><br/>Thank You, <br/> Team DLI.</div></fieldset>'
	    	swal({
				title : 'Preview of Mail',
				width : 1000,
				html : global
			});
		}
    </script>


<script>
    $(document).on('click','#Send',function(e){
    	 var token = $("meta[name='_csrf']").attr("content");
    	 var header = $("meta[name='_csrf_header']").attr("content");
    	 $(document).ajaxSend(function(e, xhr, options) {
    	 	xhr.setRequestHeader(header, token);
    	 }); 
		var smsFlag = $('#smsInput').val();
		var html = $("#editor").html();
		var param = $("#strParam").val();
		if(smsFlag=='Y'){
			var answer = confirm('Are you sure you want to cancel? (Mail will be sent)');
			if(answer){
		 //alert("hello")
	    		 $.ajax(
				        {
					        type: "POST",
					        url: "/DLI/CancelScheduledMeeting",
					        beforeSend: function(){
				        		callMe();
		               	    },
		               	    complete: function(){
		               	    	$.unblockUI();
		               	    },
						    data:{strCancelMailText:html,strParam:param,strMailFlag:smsFlag},
					        success: function(response){
					        	alert("Schedule Cancelled");
					        	window.parent.$.magnificPopup.close();
					        	location.reload();
					         },
					        				        			        
			        	});
			        	
	       	}
       	}
       	else{
       			var answer = confirm('Are you sure you want to cancel? (Mail will not be sent)');
				if(answer){
			 
		    		 $.ajax(
					        {
						        type: "POST",
						        url: "/DLI/CancelScheduledMeeting",
						        beforeSend: function(){
					        		callMe();
			               	    },
			               	    complete: function(){
			               	    	$.unblockUI();
			               	    },
							    data:{strCancelMailText:html,strParam:param,strMailFlag:smsFlag},
						        success: function(response){
						        	alert("Schedule Cancelled");
						        	window.parent.$.magnificPopup.close();
						        	location.reload();
						         },
						        				        			        
				        	});
				        	
		       	}
       	}
	});
		
		</script>



<script src="/DLI/resources/app_srv/msip/gl/jssrc/chosen.jquery.js"
	type="text/javascript"></script>
<script type="text/javascript"> 
    var config = {
      '.chzn-select'           : {},
      '.chzn-select-deselect'  : {allow_single_deselect:true},
      '.chzn-select-no-single' : {disable_search_threshold:10},
      '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chzn-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>



<body>
	<form:form action="" method="post" modelAttribute="" id="newsLetter">
		<div class="align-center">
			<h4 class="asphalt">Schedule Cancellation</h4>
		</div>

<input type="hidden" value="" id="documentIDs" />
    <input type="hidden" id="strParam" value="${schId}"/>

		<div class="whole gap-top gap-left gap-bottom double">
			<div class="one seventh align-left">Send Email Notification ?</div>
			<div class="one tenth align-left">
				<input type="checkbox" class="demo" value="Y" id="smsalert" />
			</div>
			<input type="hidden" value="N" id="smsInput" />
		<div class="whole hide" id="smsDiv">
			<div id="image" class="whole pad-top hide align-center">
				<center>
					<img src="/DLI/resources/app_srv/msip/gl/images/loading.gif"
						alt="loading" class="middle" />
				</center>
			</div>
			<div class="container_editor gapped">
				<!--<div class="hero-unit"> -->
				<fieldset>
				<%--  <div class="whole"><Div class="one tenth">Hello</Div> <div class="green three fourth"><c:out value="<USER_NAME>"></c:out></div></div>
				<br/>
				<br/>
				<div class="whole"><Div class="one fourth">The Meeting scheduled for </Div> <div class="green three fourth"><c:out value="<COMMITEE_NAME>"></c:out></div></div>
				<div class="whole"><Div class="one fourth">Meeting Agenda:</Div> <div class="green three fourth"><c:out value="<MEETING_AGENDA>"></c:out></div></div>
				<div class="whole"><Div class="one fourth">Meeting Time:</Div> <div class="green three fourth"><c:out value="<MEETING_TIME>"></c:out></div></div>
				<div class="whole"><Div class="one fourth">Meeting Date :</Div> <div class="green three fourth"><c:out value="<MEETING_FROM_DATE> - <MEETING_TO_DATE>"></c:out></div></div>
				<div class="whole gap-bottom"><Div class="one fourth">Meeting Venue :</Div> <div class="green three fourth"><c:out value="<MEETING_VENUE>"></c:out></div></div>
				<br/>
				<br/>
				<div class="whole"><strong>has been cancelled</strong> due to</div> --%>  ${MailPreview} 

				</fieldset>
				<div class="btn-toolbar" data-role="editor-toolbar"
					data-target="#editor">
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i
							class="icon-font"></i><b class="caret"></b></a>
						<ul class="dropdown-menu">
						</ul>
					</div>
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown"
							title="Font Size"><i class="icon-text-height"></i>&nbsp;<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
							<li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
							<li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
						</ul>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
							class="icon-bold"></i></a> <a class="btn" data-edit="italic"
							title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a> <a
							class="btn" data-edit="strikethrough" title="Strikethrough"><i
							class="icon-strikethrough"></i></a> <a class="btn"
							data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i
							class="icon-underline"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i
							class="icon-list-ul"></i></a> <a class="btn"
							data-edit="insertorderedlist" title="Number list"><i
							class="icon-list-ol"></i></a> <a class="btn" data-edit="outdent"
							title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
						<a class="btn" data-edit="indent" title="Indent (Tab)"><i
							class="icon-indent-right"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="justifyleft"
							title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
						<a class="btn" data-edit="justifycenter"
							title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
						<a class="btn" data-edit="justifyright"
							title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
						<a class="btn" data-edit="justifyfull"
							title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
							class="icon-undo"></i></a> <a class="btn" data-edit="redo"
							title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
					</div>

					<br> <br> <br> <br> <input
						data-edit="inserttext" id="voiceBtn" x-webkit-speech=""></input>

				</div>


				<div id="editor"></div>
		<br/>
		<div><br/>Thank you,<br/>DLI Team.</div>
				
			</div>

		</div>
		</div>

		<center>
			<input type="button" id="Send" value="Cancel Schedule"
				class="blue gap-right gap-top" name="Send" onclick="callMe()" /><input type="button" value="Close" id="Close" name="Close" class="blue gap-right gap-top" onclick="window.parent.$.magnificPopup.close();">
				 <!--  <input type="button" value="Preview Mail" id="preview" class="blue gap-right gap-top" onclick=" printClick();"/> -->
				
		</center>

	</form:form>


	<script>
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      } else {
        $('#voiceBtn').hide();
      }
	};
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	};
    initToolbarBootstrapBindings();  
	$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
    window.prettyPrint && prettyPrint();
  });
</script>


	<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "http://connect.facebook.net/en_GB/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
 </script>


</body>
