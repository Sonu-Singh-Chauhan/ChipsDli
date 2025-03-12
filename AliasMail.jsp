<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import=" java.io.File,java.util.*"%>
<%@ page isELIgnored="false"%>

<%@ page import="in.cdacnoida.msips.gl.misc.ResourceBundleFile" %>
	
	<%!
 	public String FOLDERPATH = ResourceBundleFile.getValueFromKey("EQUIPMENTDOCUMENTPATH");	
	public String contextpath = ResourceBundleFile.getValueFromKey("CONTEXT_PATH");	
	public String templatertgs ="RTGS.pdf";
	public String templatePath = "DOCUMENT_TEMPLATE";	
	%>
<!-- CSS and JS for responsive tables -->

<link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css"
	rel="stylesheet" type="text/css" />
<link
	href="/DLI/resources/app_srv/msip/gl/theme/footable.sortable-0.1.css"
	rel="stylesheet" type="text/css" />
<link href="/DLI/resources/app_srv/msip/gl/theme/footable.paginate.css"
	rel="stylesheet" type="text/css" />

<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/data-generator.js"
	type="text/javascript"></script>

<script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.js"
	type="text/javascript"></script>
<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sortable.js"
	type="text/javascript"></script>
<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter.js"
	type="text/javascript"></script>
<script
	src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate.js"
	type="text/javascript"></script>
<!--  css for validation..... -->
<script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.easyui.js"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/ValidationFunctions.js"></script>
<link rel="stylesheet" type="text/css"
	href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
<script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/charCount.js"></script>
<!-- <script type="text/javascript">
	$(function() {
		$('table').footable();
	});
</script>
 -->
<style>
.error {
    color: #E94646;
    font-style: italic;
    font-size: 70%;
   
}
</style>

<script>
$(document).ready( function() {
	        $('#userinfo-message').delay(5000).fadeOut();
	       
	        $('#email').validatebox({
	            required: true,
	            validType : [ 'minLength[6]', 'maxLength[50]', 'email' ]
	        });
	        $('#designation').validatebox({
	            required: true,
	            validType : [ 'AlphaWithApos', 'length[1,100]' ]
	        });

});



</script>
<link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">
</head>
	<body onload="getUserDetails()">
		<form:form name="form1" method="POST" action=""
			modelAttribute="aliasmailform" id="form1">
					
		<form:hidden path="UserId" id="UserId" value="${useremail.numUserId}"/>
				
		 <c:if test="${info != null && info != ''}">
       				           <div id="userinfo-message"><p class="msg msgbg">${info}</p></div> 
        </c:if>	
		
		<article class="row">

			<section class="whole">
				<div class="align-center">
					<h4 class="asphalt pad-top">Alias Mail </h4>
				</div>

				<div class="row">

					<div class=" row grey_border rounded padded gapped">

						<div class="whole">
 					
 							<div class= "whole gap-top gap-bottom">
						
									 <div class="one half centered">
										<fieldset>
<legend class="green"></legend>		
									
									 <div class="one fourth bold">Registered Mail ID</div>
									 <div class="three fourth"><label class="light blue">${empty useremail.strUsername?'':useremail.strUsername}</label>
									 <form:input type="hidden" id="accname" path ="StrActualMail" value="${empty useremail.strUsername?'':useremail.strUsername}"></form:input></div>
									 <div class= "whole gap-top gap-bottom">
									
									 <div class="one fourth bold">Alias Mail ID <span class="red">*</span></div>
									 <div class="three fourth"><form:input type="text" id="email" path = "StrAliasMail" class="tooltip" title="Mail id which will appear to the recipient" value="${empty data.strAliasEmail?'':data.strAliasEmail}"></form:input></div>
									 <form:errors path="StrAliasMail" cssClass="error" />
									 </div>
									
									 
									 <div class= "whole gap-top gap-bottom">
									
						    		<div class="one fourth bold">Alias Name of User<span class="red">*</span></div>
						    		 <div class="three fourth"><form:input type="text" path = "StrAliasName" id="designation" class="tooltip" title="Name which will appear to the recipieninbox"  value="${empty data.strAliasName?'':data.strAliasName}"></form:input></div>
						    		<form:errors path="StrAliasName" cssClass="error" />
						    		</div>
								
	</fieldset></div></div> 
 								
	
						<div class="whole align-center pad-top">
									 
						<div class="one half centered">
		     				<input type="button" value="Save/ Update"  id="Save"  name="Save" class="blue gap-right gap-top">		
		      
		 			   </div>
 					</div>
		                 
		  
		</div>									

</div>
				
					<!-- end of grey border-->
				</div>
				<!-- end of row div-->

			</section>
		</article>
		
	</form:form>

	<!-- scripts-->

<script>
$('#Back').click(function()
		{
		var r = confirm("Are you sure want to go back to previous page");
		if(r)
		callMe();
			$.ajax(
					    {
						        type: "POST",
						        url: "/DLI/fetchPreviousPage?reqtype="+$('#requestType').val()+"&seq="+$('#processSeq').val(),
						        success: function(page){
						        	window.location.href=page;
						        }
					    });
			
			
			;
		});


</script>

<script>
$('#Save').click(function()
		{
	/* if($('#form1').form('validate'))
    	 { */
		    		    	 document.form1.action = "/DLI/AliasMail";
		    		 		document.getElementById("form1").submit();
		});
</script>

  <script src="/DLI/resources/app_srv/msip/gl/jssrc/chosen.jquery.js" type="text/javascript"></script>
  <script type="text/javascript"> 
    var config = {
      '.chzn-select'           : {},
      '.chzn-select-deselect'  : {allow_single_deselect:true},
      '.chzn-select-no-single' : {disable_search_threshold:10},
      '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chzn-select-width'     : {width:"95%"}
    };
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>

</body>
</html>