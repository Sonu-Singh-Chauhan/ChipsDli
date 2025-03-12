<%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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


<script>
	$(document).on('click', '#Save', function(e) {

		$('#text_data').val($('#editor').html());
		//alert($('#editor').html());
		//alert($('#text_data').val());

		//alert("in else");
		$("#frm").attr("action", "SaveNewLetterTemplete");
		$("#frm").submit();

	});

	$(document).on('click', '#Back', function(e) {
		$("#frm").attr("action", "BackfromNewLetterTemplete");
		$("#frm").submit();

	});
</script>

<script>
	$(document).on('click', '#Use', function(e) {

		var value = $('#proID1').val();
		//alert(value);
		$.ajax({
			type : "POST",
			url : "/DLI/getVariable",
			data : "numTempleteVariableId=" + value,
			success : function(response) {
				//alert(response);
				$("#editor").append(response);
				//insertAtCaret('editor',response);
			},

			error : function(e) {
			}
		});

	});

	/*  function insertAtCaret(areaId,text) {
	  //alert("in insert");
	    var txtarea = document.getElementById(areaId);
	    //alert("1");
	    var scrollPos = txtarea.scrollTop;
	    //alert("2");
	    var strPos = 0;
	  //  alert("3");
	    var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ? "ff" : (document.selection ? "ie" : false ) );
	   // alert("4");
	    if (br == "ie") { 
	  	 // alert("5");
	        txtarea.focus();
	        var range = document.selection.createRange();
	        range.moveStart ('character', -txtarea.value.length);
	        strPos = range.text.length;
	        //alert("6");
	    }
	    else if (br == "ff") 
	  	  strPos = txtarea.selectionStart;
	   // alert("7");
	    var front = (txtarea.value).substring(0,strPos);  
	    var back = (txtarea.value).substring(strPos,txtarea.value.length); 
	    txtarea.value=front+text+back;
	    strPos = strPos + text.length;
	    //alert("second if");
	    if (br == "ie") { 
	  	 // alert("8");
	        txtarea.focus();
	        var range = document.selection.createRange();
	        range.moveStart ('character', -txtarea.value.length);
	        range.moveStart ('character', strPos);
	        range.moveEnd ('character', 0);
	        range.select();
	       // alert("9");
	    }
	    else if (br == "ff") {
	  	 // alert("10");
	        txtarea.selectionStart = strPos;
	        txtarea.selectionEnd = strPos;
	        txtarea.focus();
	        //alert("11");
	    }
	    txtarea.scrollTop = scrollPos;
	    //alert("after function");
	} 
	 */
</script>


<script>
	function populateTemplate(index) {
		$.ajax({
			type : "POST",
			url : "/DLI/ShowTemplates/" + index,
			success : function(response) {
				$('#editor').html(response);
			},

			error : function(e) {
				alert('Error: ' + e);
			}

		});
	}
</script>

<script>
	$(document).ready(function() {
		$("#editorform").submit(function() {
			// Retrieve the HTML from the plugin
			var html = $('#editor').html();
			// Put this in the hidden field
			$("#html").val(html);
		});
		var htmltext = $("#html").val();
		$('#editor').html(htmltext);

		$("#editor").css("height", $(window).height() / 2);
		$("#editor").css("max-height", $(window).height() / 2);
		$("#editor").css("width", $(window).width());
		$('#schemeDiv').hide();
		
		/*toggle scheme div*/
		$(document).on('change','#numScheme',function(){
		 var checkEle=$(this).prop('checked');
			if(checkEle)
				{
				$('#schemeDiv').slideToggle();
				}
			else
				$('#schemeDiv').slideToggle();
		});
		
	});
</script>


<script>
	function printClick() {
		var value = $('#proID').val();
		var html = $("#editor").html();
		if ($.trim(html) == "") {
			alert("please select a Document");
		} else {
			var w = window.open();
			var html = "<input type='button' value='Print Page' onclick='window.print()'>"
					+ $("#editor").html();
			$(w.document.body).html(html);
		}

	}
</script>

<script>
	$(document).on('click', '#View', function(e) {
		printClick();
	});

	function resetval() {
		$('#proID').val(0);
		$('#proID1').val(0);

	}
</script>



</head>
<body>

	<form:form action="AddEditor" id="frm" name="frm" method="post"
		modelAttribute="TextEditor">

		
		<div class="align-center">
			<h4 class="asphalt">Create Letter Templete</h4>
		</div>


		<div class="whole">

			<div class="one sixth">
				<form:label path="dataString">Letter Templete Name</form:label>
			</div>
			<div class="two sixth pad-top-half">
				<form:input type="text" path="dataString"
					style="width:415px;height:30px"></form:input>
			</div>
			<div class="one sixth skip-two">
				<input type="button" id="Back" value="Back"
					class="blue gap-right gap-top" name="Back" />
			</div>

		</div>


		<div class="whole">

			<div class="one sixth pad-top">
				<form:label path="numTempleteVariableId">Letter Templete Variables</form:label>
			</div>

			<div class="two sixth pad-top">
				<form:select path="numTempleteVariableId" id="proID1"
					class="chzn-select whole pad-bottom">
					<form:option value="0">---------------------Templete Variable---------------------</form:option>
					<c:forEach items="${VariableList}" var="l">

						<form:option value="${l.numTempleteVariableId}">${l.strTempleteVariableName}</form:option>

					</c:forEach>

				</form:select>
			</div>

			<script>
				resetval();
			</script>

			<div class="two sixth gap-left pad-bottom">

				<input type="button" id="Use" value="Use"
					class="blue gap-right gap-top" name="Use" />

			</div>
		</div>

		<div class="whole">

			<div class="one sixth">
				<form:label path="strEcode">Letter Templete Code</form:label>
			</div>
			<div class="two sixth pad-top-half">
				<form:input type="text" path="strEcode" style="width:415px;height:30px"></form:input>
			</div>
		</div>

		<div class="whole">
			<div class="one sixth">

				<label> Master Letter Templete?</label>
			</div>
			<div class="two sixth  pad-top-half">
				<input type="checkbox" id="NumIsMaster" name="NumIsMaster" />
			</div>
		</div>


		<div class="whole">
			<div class="one sixth">
				<label>PI Letter Templete?</label>
			</div>
			<div class="two sixth  pad-top-half">
				<input type="checkbox" id="NumPiLetter" name="NumPiLetter" />
			</div>
		</div>

		<div class="whole">
			<div class="one sixth">
				<label>Scheme Specific?</label>
			</div>
			<div class="two sixth  pad-top-half">
				<form:checkbox path="numSchemeFlag" id="numScheme" name="Scheme" />
			</div>
		</div>
		
		<div class="whole" id="schemeDiv">
			<div class="one sixth">
				<form:label path="numSchemeId">Select Scheme</form:label>
			</div>
			<div class="two sixth pad-top-half">
				<form:select  path="numSchemeId" class="two fourth chzn-select" id="drpScheme">
          <form:option value="0">---Select Scheme---</form:option>
          <c:forEach items="${schemelist}" var="memList"> 
		<form:option value="${memList.numSchemeId}">${memList.strSchemeName}</form:option>
		</c:forEach>
				</form:select>
			</div>
			</div>
		<!-- 
		<div id="dialog" title="Error!">
			<p>Please select a type of Document!</p>
		</div> -->

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

			<div id="editor">Type Mail Content&hellip;</div>
		</div>
		<div class="whole align-center gap-bottom">
			<input type="button" id="Save" value="Save"
				class="blue gap-right gap-top" name="Save" /><input type="button"
				id="View" value="Print Preview" class="blue gap-right gap-top"
				name="View" />
		</div>

		<!-- </div> -->
	</form:form>
	<c:out value="${inserted}">${inserted}</c:out>

	<script src="/DLI/resources/app_srv/msip/gl/jssrc/chosen.jquery.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var config = {
			'.chzn-select' : {},
			'.chzn-select-deselect' : {
				allow_single_deselect : true
			},
			'.chzn-select-no-single' : {
				disable_search_threshold : 10
			},
			'.chzn-select-no-results' : {
				no_results_text : 'Oops, nothing found!'
			},
			'.chzn-select-width' : {
				width : "95%"
			}
		}
		for ( var selector in config) {
			$(selector).chosen(config[selector]);
		}
	</script>

</body>

<script>
	$(function() {
		function initToolbarBootstrapBindings() {
			var fonts = [ 'Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
					'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact',
					'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
					'Times New Roman', 'Verdana' ], fontTarget = $(
					'[title=Font]').siblings('.dropdown-menu');
			$
					.each(
							fonts,
							function(idx, fontName) {
								fontTarget
										.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'
												+ fontName + '</a></li>'));
							});
			$('a[title]').tooltip({
				container : 'body'
			});
			$('.dropdown-menu input').click(function() {
				return false;
			}).change(
					function() {
						$(this).parent('.dropdown-menu').siblings(
								'.dropdown-toggle').dropdown('toggle');
					}).keydown('esc', function() {
				this.value = '';
				$(this).change();
			});

			$('[data-role=magic-overlay]').each(
					function() {
						var overlay = $(this), target = $(overlay
								.data('target'));
						overlay.css('opacity', 0).css('position', 'absolute')
								.offset(target.offset()).width(
										target.outerWidth()).height(
										target.outerHeight());
					});
			if ("onwebkitspeechchange" in document.createElement("input")) {
				var editorOffset = $('#editor').offset();
				$('#voiceBtn').css('position', 'absolute').offset({
					top : editorOffset.top,
					left : editorOffset.left + $('#editor').innerWidth() - 35
				});
			} else {
				$('#voiceBtn').hide();
			}
		}
		;
		function showErrorAlert(reason, detail) {
			var msg = '';
			if (reason === 'unsupported-file-type') {
				msg = "Unsupported format " + detail;
			} else {
				console.log("error uploading file", reason, detail);
			}
			$(
					'<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'
							+ '<strong>File upload error</strong> '
							+ msg
							+ ' </div>').prependTo('#alerts');
		}
		;
		initToolbarBootstrapBindings();
		$('#editor').wysiwyg({
			fileUploadError : showErrorAlert
		});
		window.prettyPrint && prettyPrint();
	});
</script>

<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "http://connect.facebook.net/en_GB/all.js#xfbml=1";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>



