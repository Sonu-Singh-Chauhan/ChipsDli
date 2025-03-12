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
<link rel="stylesheet"
	href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">

<script>

$(document).on('change','#numSchemeId',function(e){
	var id = $(this).find(":selected").val();
	if(id!=0)
		{
				getCommitteeDetails(id);
		}
	else
		{
			 $("#CommitteeId").empty();
			 $("#CommitteeId").trigger("liszt:updated");
		}
		
});
</script>


<script>

 function getCommitteeDetails(id){
	 
	 var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	 
  	var schemeId= id;
   	$.ajax(
            {
                 type: "POST",
                 url: "/DLI/CommitteebyschemeID",
                 data: "schemeID="+schemeId,
                 success: function(response) {
                	         	 
                	 $("#CommitteeId").empty();
                	 $('#CommitteeId').append('<option value=-1>--------------------Select Scheme----------------------</option>');
                	 for (var i = 0; i < response.length; ++i) 
                     {
                		 $('#CommitteeId').append('<option value='+response[i].numCommitteeTypeId+'>'+response[i].strCommitteeName+'</option>');
                     }
			       },
			       complete: function(){
			    	   $("#CommitteeId").trigger("liszt:updated");
             	   },
  			                error: function(e){
  					        	alert('Error in getting Committee : ' + e);
  			                }
  		                });	 
                   } 
</script>



<script>
	  $(document).on('click','#Save',function(e)
	  {
		   var commt = $("#CommitteeId").find(":selected").val();
		     var scheme=$("#schemeid").find(":selected").val();
		     var call=$("#specialCallId").find(":selected").val();
		     if(commt == -1)
		    	 {
		    	 alert('Please Select the Commettee');
		    	 return false;
		    	 }
		     if(scheme == -1)
			 {
			 alert('Please Select the Commettee');
			 return false;
			 }
		     if(call == -1)
			 {
			 alert('Please Select the Commettee');
			 return false;
			 }
		  
		$('#text_data').val($('#editor').html()); 
		
	   
	    	  if($('#schemeid').val()==0)
	    	     {
	    	     	alert("please select a Scheme");
	    	     }
	    	     else{
	    					$("#frm").attr("action","SaveCallInstructionTemplete");
	    				 	$("#frm").submit();
	    		 } 
		});
	  
	
	  
    </script>
      <script>
	  $(document).on('click','#Use',function(e)
			  {
		  
		  var token = $("meta[name='_csrf']").attr("content");
	 		var header = $("meta[name='_csrf_header']").attr("content");
	 		$(document).ajaxSend(function(e, xhr, options) {
	 			xhr.setRequestHeader(header, token);
	 		});
		  
		  var value = $('#proID1').val();
		  $.ajax(
			   		{
				        type: "POST",
				        url: "/DLI/getVariable",
				        data:"numTempleteVariableId="+value,
			   		success: function(response)
			   		{
				        	$("#editor").append(response);
				        },
				        
				        error: function(e){
			    		}
					});
			    		
				});

	  
    </script>

<script>
    
     $(document).on('change','#CommitteeId',function(e){
     var commt = $(this).find(":selected").val();
     var scheme=$("#numSchemeId").find(":selected").val();
     var call=$("#specialCallId").find(":selected").val();
     if(commt == -1)
    	 {
    	 alert('Please Select the Commettee');
    	 return false;
    	 }
     if(scheme == -1)
	 {
	 alert('Please Select the Commettee');
	 return false;
	 }
     if(call == -1)
	 {
	 alert('Please Select the Commettee');
	 return false;
	 }
     
	     var html = $("#editor").html();
	     if($.trim(html)=="")
	     {
	     	populateTemplate($.trim(call),$.trim(scheme),$.trim(commt));
	     }
     	else
     	{
		 	var answer = confirm('Are you sure you want to overwrite?');
			if (answer)
			{
				populateTemplate($.trim(call),$.trim(scheme),$.trim(commt));
			}
			else
			{
			  console.log('cancel');
			}
			
	 }
	});
    
    </script>


<script>
   
   function populateTemplate(callId,scheme,commt){
	   
	   var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	   
		$.ajax(
        {
	        type: "POST",
	        url: "/DLI/ShowCallInstructions/"+callId+"/"+scheme+"/"+commt,
	        success: function(response)
	        {     
	         $('#editor').html(response); 
	        },
	        
	        error: function(e){
	        	//alert('Error: ' + e);
        	}
        
        });
	}

    </script>

<script>
     $(document).ready(function() {
    	 

    	          $('#userinfo-message').delay(5000).fadeOut();
    	   
    	 
    	 $("#frm").submit(function() {
    	    	   // Retrieve the HTML from the plugin
    	    	   var html = $('#editor').html();
    	    	   // Put this in the hidden field
    	    	   $("#html").val(html);
    	    	});
    	 var htmltext=$("#html").val();
    	 $('#editor').html(htmltext);
    	 
    	 
      	 $("#editor").css("height",$(window).height()/2);
    	 $("#editor").css("max-height",$(window).height());
      	 $("#editor").css("width",$(window).width()-20);
    
     
            });
    
    </script>


<script>
	    function printClick() {
	    var value = $('#schemeid').val();
     		var html = $("#editor").html();
     if($.trim(html)=="")
     {
     	alert("please select a Document");
     }
     	else{
		 var w = window.open();
		  var html = "<input type='button' value='Print Page' onclick='window.print()'>" + $("#editor").html();
		  $(w.document.body).html(html);
	 	}
	    
		  
		}
    </script>
    <script >
    function reload()
    {
      $('.chzn-select').val(0).trigger('liszt:updated');
      
    }


</script>

</head>
<body onload="reload()">

	<form:form action="AddSchemeInstruction" id="frm" name="frm" method="post" modelAttribute="callSchemeCommtModel">
		
    	 <c:if test="${Message != null && Message != ''}">
       				           <div id="userinfo-message"><p class="msg msgbg">${Message}</p></div> 
        </c:if>	
            	
            	
            	
            <div class="align-center">
            <h4 class="asphalt pad-top">
                Call Scheme wise Instruction Form
            </h4>
          </div>
          
          
          
			<div class="whole">
			<div class="one half centered">
			<div class="one fifth pad-top-half">
				<form:label path="numCallId" for="numCallId">Select Call</form:label>
			</div>
			<div class="four fifth pad-top-half pad-bottom">
				<form:select path="numCallId" name="numCallId" id="specialCallId" class="chzn-select whole">
					<form:option value="-1">--------------------Select Call----------------------</form:option>
					<c:forEach items="${CallList}" var="l">

						<form:option value="${l.numSpecialCallId}">${l.strSpecialCallTitle}</form:option>

					</c:forEach>

				</form:select>
			</div>
						
		</div>
		</div> 
			<div class="whole">
			<div class="one half centered">
			<div class="one fifth pad-top-half">
				<form:label path="numSchemeId" for="numSchemeId">Select Scheme</form:label>
			</div>
			<div class="four fifth pad-top-half pad-bottom">
				<form:select path="numSchemeId" name="numSchemeId" class="chzn-select whole">
					<form:option value="-1">--------------------Select Scheme----------------------</form:option>
					<c:forEach items="${schemeList}" var="l">

						<form:option value="${l.numSchemeId}">${l.strSchemeName}</form:option>
					</c:forEach>
				</form:select>
			</div>
						
		</div>
		</div>
		
	    			<div class="whole">
			<div class="one half centered">
			<div class="one fifth pad-top-half">
				<form:label path="numCommetteeId" for="numCommetteeId">Select Committee</form:label>
			</div>
			<div class="four fifth pad-top-half pad-bottom">
			<form:select class="four sixth chzn-select whole" id="CommitteeId" path="numCommetteeId" > 
			</form:select>	
			</div>
						
		</div>
		</div> 

<div class="container_editor gapped">
			<!--<div class="hero-unit"> -->

			<br>

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
					<a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i
						class="icon-align-justify"></i></a>
				</div>
				<!-- <div class="btn-group">
		  <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
		    <div class="dropdown-menu input-append">
			    <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
			    <button class="btn" type="button">Add</button>
        </div>
        <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>

      </div> -->

				<!-- <div class="btn-group">
        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
      </div> -->
				<div class="btn-group">
					<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
						class="icon-undo"></i></a> <a class="btn" data-edit="redo"
						title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
				</div>

				<br> <br> <br> <br>

				<form:input data-edit="inserttext" id="voiceBtn" x-webkit-speech=""
					path=""></form:input>
				<form:hidden id="text_data" path="text_data" />

			</div>

			<div id="editor" contentEditable="true">Type Instruction Content&hellip;</div>
		</div>
		
		
		<div class="whole align-center pad-top double gap-bottom">
			<input type="button" id="Save" value="Save"
				class="blue gap-right gap-top" name="Save" />
		</div> 

		<!--  </div>  -->
	</form:form>
	<c:out value="${inserted}">${inserted}</c:out>

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

</body>

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


