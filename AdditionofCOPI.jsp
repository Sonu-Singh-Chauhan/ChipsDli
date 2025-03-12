<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import=" java.io.File,java.util.*"%>
<%@ page isELIgnored="false"%>
<%-- <script>
var csrftoken="<%=request.getSession().getAttribute("CSRFToken")%>";
//alert("csrftoken::"+csrftoken);
</script> --%>
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
    <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/jquery-labelauty.css" type="text/css" media="screen" charset="utf-8" />         
<script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery-labelauty.js"></script>

<script type="text/javascript">
	$(function() {
		$('table').footable();
	});
</script>

<script>

$(document).ready( function() {
	    
	 $(".checkBoxStyle").labelauty({ label: true,
		 padding: '2px' 
	}); 
	
	hidediv();
	
	$('#userinfo-message').delay(5000).fadeOut();

	        $('#accname').validatebox({
	            required: true,
	        });
	        $('#strRemarks').validatebox({
	            required: true,
	            validType: ['minLength[1]','maxLength[250]','AlphaNumericWithSpecial']
	        });
	        $("#strRemarks").charCount({
				allowed: 250,		
				warning: 10,
				counterText: 'Characters left:'	
			});
	        
	        $('#email').validatebox({
	            required: true,
	            validType : [ 'minLength[6]', 'maxLength[50]', 'email' ]
	        });
	        $('#designation').validatebox({
	            required: true,
	            validType : [ 'AlphaNumericNoApos', 'length[1,100]' ]
	        });
	        $('#accno').validatebox({
	            required: true,
	            validType: ['Numeric']
	        });
	        $('#bankname').validatebox({
	            required: true,
	            validType:['AlphaNumericNoApos']
	        });
	        $('#rtgsBankAddress').validatebox({
	            required: true,
	            validType: ['minLength[1]','maxLength[50]','AlphaNumericWithSpecial']
	        });
	        $('#rtgsIfsc').validatebox({
	            required: true,
	            validType:['AlphaNumeric']
	        });

});



</script>
   


<script>

function getUserDetails()
{
var id=$('#UserId').val();
//alert(id);
$.ajax({
		type : "POST",
		url : "/DLI/getSelectedUserDetailsFromUserProfile",
		data : "numUserId=" + id,
		success : function(response) 
		{
			
			
			$('#numUserProfileOldInstituteId').val(response.numUserProfileOldInstituteId);

        	
        	$('#strUserProfilePiFullName').text(response.strUserProfilePiFullName);
        	$('#strUserProfilePiOldInstitute').text(response.strUserProfilePiOldInstitute);
        	if(response.strUserProfilePiOldInstituteAddress!=null)
        		{
        	$('#strUserProfilePiOldInstituteAddress').text(response.strUserProfilePiOldInstituteAddress);
        		}
        	else
        		{
            	$('#strUserProfilePiOldInstituteAddress').text("---");

        		}
         },
        
        error: function(e){
        	alert("Error in posting path here!");
    	}
    }); 
		// $("#oldInstituteDetailsDiv").show();
}
</script>
<script>
function resetval() 

{
	$('#numPhone').val("");

}
</script>

   <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">

</head>
<body onload="getUserDetails()">
	<form:form name="form1" method="post" action=""
		modelAttribute="changeOfInsituteForm" id="form1">
		<form:hidden path="numOldInstituteId" id="numOldInstituteId"/>
				<form:hidden path="numUserProfileOldInstituteId" id="numUserProfileOldInstituteId"/>
		
		
				<form:hidden path="numChangeInstituteTypeId" id="numChangeInstituteTypeId"/>
					<form:hidden path="numOldInstituteId" id="numOldInstituteId"/>
	<form:hidden path="ChangefromSearchViaInstitute" id="ChangefromSearchViaInstitute" value="${ChangefromSearchViaInstitute}"/>
					
					
		<form:hidden path="UserId" id="UserId"/>
				
		 <c:if test="${info != null && info != ''}">
       				           <div id="userinfo-message"><p class="msg msgbg">${info}</p></div> 
        </c:if>	
		
		<article class="row">

			<section class="whole">
				<div class="align-center">
					<h4 class="asphalt pad-top">Addition of CO-Principal Investigator</h4>
				</div>

				<div class="row">

					<div class=" row grey_border rounded padded gapped">


						<div class="whole">
				<c:if test="${profileonly!=1}">	
							
					<div class="whole">
							<div class="one half centered">
					         <div class="one fourth">
						<form:label path="numProposalId">File Number<span class="red"><font size="3">*</font></span></form:label>
					        </div>
					        <div class="three fourth">
					
						<form:select path="numProposalId" id="FileNumber"  class="chzn-select whole">
							<form:option value="0">Select File Number</form:option>
					
					<c:forEach items="${FileNumberList}" var="u">
							<form:option value="${u.numProposalId}">${u.strFileName}</form:option>
					</c:forEach>
					
					</form:select>
					        </div>
					        
					        </div><!--  end of one half div -->
					</div> 
					</c:if>
	<div class="whole" style="display:none" id="oldInstituteDetailsDiv">
	
		<div class="whole"><!-- fifth row starts here-->	
		<div class="one half centered">										
	                                           <div class="one fourth"><label for="strPiFullName">  Name of Principal Investigator:  </label></div>
												<div class="three fourth blue">
												
			                                     <form:label id="strPiFullName" path="strPiFullName"/>	
			                                     <form:input type="hidden" value="" id="strPiFullName1" path="strPiFullName"></form:input>	                                     </div>
						  </div> <!-- end of fifth row-->
						  </div>
						  
						  	<div class="whole"><!-- fifth row starts here-->	
		<div class="one half centered">										
	                                           <div class="one fourth"><label for="strProjectTitle">  Project Title:  </label></div>
												<div class="three fourth blue">
												
			                                     <form:label id="strProjectTitle" path="strProjectTitle" />	
			                                     <form:input type="hidden" value="" id="strProjectTitle1" path="strProjectTitle"></form:input>	
			                                     
			                                     
			                                                                          </div>
						  </div> <!-- end of fifth row-->
						  </div>
						  
		<form:hidden path="requestType" id="requestType" value="${requesttype}"></form:hidden>
									<form:hidden path="processSeq" id="processSeq" value="${seqno }"></form:hidden>				  

 	<div class="whole"><!-- sixth row starts here-->
 	<div class="one half centered">		    
						             <div class="one fourth"><form:label for="strPiOldInstitute"  path="strPiOldInstitute" > Institute:  </form:label> </div>
									<div class="three fourth blue"> <form:label path="strPiOldInstitute" id="strPiOldInstitute" maxlength="100"  /> 
									  <form:input type="hidden" value="" id="strPiOldInstitute1" path="strPiOldInstitute"></form:input>	
									
									</div>
		                 </div> <!-- end of sixth row-->		
		                 </div>
		                 		 
		                  <div class="whole"><!-- sixth row starts here-->		
		                  <div class="one half centered">    
						             <div class="one fourth"><form:label for="strPiOldInstituteAddress"  path="strPiOldInstituteAddress" > Institute Address:  </form:label> </div>
									<div class="three fourth blue"><form:label path="strPiOldInstituteAddress" id="strPiOldInstituteAddress" maxlength="100"  /> 
									<form:input type="hidden" value="" id="strPiOldInstituteAddress1" path="strPiOldInstituteAddress"></form:input>
									</div>
		                 </div> <!-- end of sixth row-->   
		                 </div>  
		                                      
			</div>            
		         <div class= "whole gap-top gap-bottom">
									 <div class="one half centered">
		<fieldset>
<legend class="green">CO-PI Details</legend> 
		         <!-- <div class="whole pad-top">sixth row starts here	<span class="inline">     <input type="checkbox" class = "checkBoxStyle" name="checkbox"  checked="checked" data-labelauty="Click here, if you have Co PI(s) in your Project." id="chkcopiid" ></span>	 </div> -->     
		    		     
		     <div id="sameinstcopi">
		                 
		    <div class="whole">
 					 <label style="font-style: italic; font-size:.8em; font-weight: bold;">(Select registered Co PI(s) from Your Institute.) </label>
   			</div>
   			
  			<div class="whole "><!-- sixth row starts here-->		    
						        
						         <ul>
						          
						         <li><label class="italic small justify">Please ensure that your Co-PI is registered into the system
						         and has filled <strong>'Profile Detail'</strong> section under <strong>'User Profile'</strong> which includes Bio data, photo, Institute Address, etc. , failing which you will not be able to add your Co-PI in your proposal..</label></li>
						          </ul>									
						         
		    </div> <!-- end of sixth row-->
  			
  			<div class="whole" id="collid">
					<div class="one fourth"><label for="numCOPI" class="pull-left">CO PI:<span class = "red">*</span> </label></div>
					<div class="three fourth">
						<form:select path="numCOPIFromPI"  id="numCOPIFromPI" onchange="copi()" onkeypress="populateCOPIDetails" cssClass="chzn-select whole">
 							 <%-- <c:forEach  items="${copilistfrompi}" var="list5">
 							 <form:option  value="${list5.numUserId}">${list5.strFirstName}</form:option>
 							 </c:forEach> --%>
						</form:select>
					</div>

			 </div> 
			 </div>

	  <div class="whole pad-top"><!-- sixth row starts here-->		    
						            <span class="inline"> <form:checkbox value="ok" path="iscol"  class= "checkBoxStyle" data-labelauty="Click here, if Your Co PI(s) is from other institute." onclick="hidediv()" id="iscol"   /> </span> 								
		  </div> <!-- end of sixth row-->               

          <div class="whole" id="CollaborativeInstitute"> 
          	<fieldset style="border-color: rgb(52, 152, 219)">
     
       					<div class="whole "><!-- sixth row starts here-->		    
						         <label class="italic small justify">
						         <ul>
						          <li>If you are unable to find the institute of your CO-PI in the list below, then it seems that your CO-PI must have registered with a new Institute which is not yet verified by the administrator. Once the Institute details are verified, you will find that institute in the list.</li>
						          <li>You can make a request to the Administrator for verification of your CO-PI’s institute details by <a href="#" class="report">Reporting a problem</a></li>
						         <li>Please ensure that your Co-PI is registered into the system
						         and has filled <strong>'Profile Detail'</strong> section under <strong>'User Profile'</strong> which includes Bio data, photo, Institute Address, etc. , failing which you will not be able to add your Co-PI in your proposal..</li>
						          </ul></label>									
						         
		    			</div> <!-- end of sixth row-->
		                 
		                <div class="whole blue">
		                 Section A
		                 </div>   
		                 
		                 <div class="whole ">
		                 <label style="font-style: italic; font-size:.8em; font-weight: bold;">( Select Institute(s) for Co PI )</label>
		                 </div> 

		             <div class="one fourth">
									<form:label path="numStateId">State:<span class="red"><font size="3">*</font></span></form:label>
								</div>

								<div class="three fourth">
									<form:select path="numStateId" id="statename"
										class="chzn-select whole">
										
										
										<form:option value="0">Select</form:option>
										<c:forEach items="${statelist}" var="l">
											<form:option value="${l.numStateId}">${l.strStateName}</form:option>
										</c:forEach>
									</form:select>
							
								</div>
						<!-- end of whole div-->


						<div class="whole">
							<!--fourth row-->
								<div class="one fourth">
									<form:label path="numCityId">District:<span class="red"><font size="3">*</font></span></form:label>
								</div>

								<div class="three fourth">
									<form:select path="numCityId" id="cityname"
										class="chzn-select whole">
										<form:option value="0">Select</form:option>

									</form:select>
								</div>
						</div>
						<!-- end of whole div-->


						
					<div class="whole"><!-- ninth row starts here-->
					
					<div class="one fourth">   
					<form:label path="numInstituteId">Institute Name:<span class="red"><font size="3">*</font></span> </form:label>

					</div>
		
					<div class="three fourth">  
											

						<form:select path="numInstituteId" id="InstituteName" onchange="" class="chzn-select whole">		
											
				      <form:option value="0">Select</form:option>
						
																			
							</form:select>
						</div>
						
						</div>
     
     		         <div class="whole blue pad-top">
		                 Section B
		                 </div>   
    
 <div class="whole">
  <label style="font-style: italic; font-size:.8em; font-weight: bold;">(Select registered Co PI(s) from institute(s) selected in Section A.) </label>
   </div>
  <div class="whole" id="collid">
<div class="one fourth"><label for="numCOPI" class="pull-left">CO PI:<span class = "red">*</span>  </label></div>
<div class="three fourth">

<form:select path="numCOPI"  id="numCOPI" cssClass="chzn-select whole">
 <%--  <c:forEach  items="${copilist}" var="list5">
   <form:option  value="${list5.numUserId}">${list5.strFirstName}</form:option>
  </c:forEach> --%>
</form:select>
</div>
</div> 
</fieldset>
</div> 
		        
		 </fieldset>
		 </div>      
		       
	</div>	       
		       
	
		<!-- <div class= "whole gap-top gap-bottom">
									 <div class="one half centered">
			<fieldset>
<legend class="green">Documents Upload</legend>	
	
		<div class= "whole gap-top gap-bottom">
									
										<div class="one fourth">RTGS Document <span class="red">*</span></div>					
										<div class="three fourth">
										<a href="#" onclick="openRTGS();">Upload RTGS</a>
	    								<span class="small italic dark-green"> (Upload the RTGS Bank Details signed by the competent autority)</span>
									
									</div>
									</div>
		<div class= "whole gap-top gap-bottom">
								
										<div class="one fourth">Endorsement Certificate <span class="red">*</span></div>					
										<div class="three fourth">
										<a href="#" onclick="openEND();">Upload Endorsement Certificate</a>
									</div>
								</div>
								
								<div class= "whole gap-top gap-bottom">
								<div class="one fourth">Other Documents </div>					
										<div class="three fourth">
										<a href="#" onclick="openOther();">Upload Other Documents</a>
									</div>
									</div>
								
	</fieldset></div></div> -->
							<div class= "whole gap-top gap-bottom">
									 <div class="one half centered">
			<fieldset>
<div class= "whole gap-top gap-bottom">
									 
									 <div class="one fourth">Remarks:<span class="red">*</span></div>
									 <div class="three fourth"><form:textarea type="text" id="strRemarks" path ="strRemarks" value=""></form:textarea></div>
									 
									 </div>
</fieldset></div></div> 
						<div class="whole align-center pad-top">
						<div class="one half centered">
		     				<input type="button" value="Save & next"  id="Save"  name="Save" class="blue gap-right gap-top">		
		      				        <!-- <input type="button" value="Back"  id="Back"  name="Back" class="blue gap-right gap-top"> -->		
		      
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
		document.form1.action = "/DLI/ChangeofInstituteAdminBack";
		document.getElementById("form1").submit();
	
		});

function hidediv()
{
	 if( document.getElementById('iscol').checked==true) {
		 $('#CollaborativeInstitute').show();
		 $('#sameinstcopi').hide();
		 //alert($('#numCOPIFromPI').val());
		 $('#numCOPIFromPI').val(0);
		 $("#numCOPIFromPI").trigger("liszt:updated");
		 // $('#numInstituteTypeId').val("0");
		   }
	   else{
		   $('#statename').val(0); 
			$("#statename").trigger("liszt:updated");
			$('#cityname').val(0); 
			$("#cityname").trigger("liszt:updated");
	       	$('#InstituteName').find('option').remove();
			$("#InstituteName").trigger("liszt:updated");	
			$('#CollaborativeInstitute').hide();
		   	$('#sameinstcopi').show();
		   	$('#numCOPI').val(0); 
			$("#numCOPI").trigger("liszt:updated");
	   }
	
	}
</script>
<script type="text/javascript">
function openRTGS() {
	/*  alert("inside "+$('#FileNumber').val());
	alert("new  id "+$('#InstituteName').val());  */
	 var filenumber=$('#FileNumber').val();
	 var InstituteId=$('#InstituteName').val();
	// alert("new  id "+$('#InstituteName').val());
	 if(filenumber==0)
   	 {
   	alert("Please select File Number");
   	 }
    if(InstituteId==0)
   	 {
   	 alert("Please Select Institute");
   	 }
    else
		{
	$.magnificPopup.open({items: 
      {
        src: <%=contextpath%>+"openChangeRTGS?ProposalId="+$('#FileNumber').val()+"&instid="+$('#InstituteName').val(),
        type: 'iframe'
      }
	 });
	 $.magnificPopup.instance.close = function () {
	   // $('.tooltip').show();
	      $.magnificPopup.proto.close.call(this);
	  };
		}
		}

</script>


<script type="text/javascript">
function openOther() {
	 /* alert("inside "+$('#FileNumber').val());
	alert("new  id "+$('#InstituteName').val());  */
	 var filenumber=$('#FileNumber').val();
	 var InstituteId=$('#InstituteName').val();
    if(filenumber==0)
   	 {
   	alert("Please select File Number");
   	 }
    if(InstituteId==0)
   	 {
   	 alert("Please Select Institute");
   	 }
    else
		{
	$.magnificPopup.open({items: 
      {
        src: "/DLI/ChangeOtherDocmentUpload?ProposalId="+$('#FileNumber').val()+"&instid="+$('#InstituteName').val(),
        type: 'iframe'
      }
	 });
	 $.magnificPopup.instance.close = function () {
	   // $('.tooltip').show();
	      $.magnificPopup.proto.close.call(this);
	  };
		}
		}

</script>

<script type="text/javascript">
function openEND() {
	 /* alert("inside "+$('#FileNumber').val());
	alert("new  id "+$('#InstituteName').val());  */
	 var filenumber=$('#FileNumber').val();
	var otherpi = 0;
    if(filenumber==0)
   	 {
   	alert("Please select File Number");
   	 }
   if( document.getElementById('iscol').checked==false) {
    		 if($('#numCOPIFromPI').val() != null || $('#numCOPIFromPI').val() != 0)
    			 {
    			 otherpi = $('#numCOPIFromPI').val();
    			 }
    	 }
    		   
    	   if( document.getElementById('iscol').checked==true){
    		   if($('#numCOPI').val() != null || $('#numCOPI').val() != 0)
    		   	otherpi = $('#numCOPI').val(); 
    	   }
    if(otherpi == 0)
    	{
    	alert("please select a copi");
    	}
    else
		{
	//alert(filenumber);
	$.magnificPopup.open({items: 
      {
        src: <%=contextpath%>+"openCOPIDoc?ProposalId="+$('#FileNumber').val()+"&copiId="+otherpi,
        type: 'iframe'
      }
	 });
	 $.magnificPopup.instance.close = function () {
	   // $('.tooltip').show();
	      $.magnificPopup.proto.close.call(this);
	  };
		}
		}

</script>

<script>
$('#Save').click(function()
		{
	var filenumber=$('#FileNumber').val();
     if(filenumber==0)
    	 {
    	alert("Please select File Number");
    	 return false;
    	 }
     if( (document.getElementById('iscol').checked==false)&&($('#numCOPIFromPI').val()==0 || $('#numCOPIFromPI').val() == null)) {
    		 alert("please select a CO-PI you want to add in your proposal");
    		 return false;
     }
	 if((document.getElementById('iscol').checked==true)&&($('#numCOPI').val()==0 || $('#numCOPI').val()== null)) {
		 	 alert("please select a CO-PI you want to add in your proposal");
			 return false;
	 }
     else
		{
    	 if($('#form1').form('validate'))
    	 {
    		<%--  var token = "<%request.getSession().getAttribute("CSRFToken");%>"; --%>
    		// console.log("this is token ==="+csrftoken);
    		
    		/* $("#CSRFToken").val(csrftoken); */
    		//document.getElementById('CSRFToken').value = csrftoken;
    	callMe();
    		 
		        	      document.form1.action = "/DLI/AdditionCOPI";
		    		 		document.getElementById("form1").submit();  
		}
		}
	});

</script>
		

<script>
$(document).on('change','#iscol',function(e)
		{
	if( document.getElementById('iscol').checked==false)
		{
		popupcopi();
		}
		});
$(document).on('change','#FileNumber',function(e)
	{
	//alert($('#FileNumber').val());
	 var filenumber=$('#FileNumber').val();
  if(filenumber==0)
	  {
		 $("#oldInstituteDetailsDiv").hide();

	  }
  else
	  {
	  $.ajax(
		        {
			        type: "POST",
			        url: "/DLI/GetAOPIDetails",
			        async:false,
			        data:"numProposalId="+filenumber,
			        success: function(response)
			        {
			        	//alert(response.numInstituteId);
			        	$('#numOldInstituteId').val(response.numInstituteId);
			        	$('#strProjectTitle').text(response.strProjectTitle);
			        	$('#strProjectTitle1').val(response.strProjectTitle);
			        	$('#strPiFullName').text(response.strOldPiFullName);
			        	$('#strPiFullName1').val(response.strOldPiFullName);
			        	$('#strPiOldInstitute').text(response.strOldPiInstitute);
			        	$('#strPiOldInstitute1').val(response.strOldPiInstitute);
			        	$('#strPiOldInstituteAddress').text(response.strOldPiInstituteAddress);
			        	$('#strPiOldInstituteAddress1').val(response.strOldPiInstituteAddress);
			        	//alert("istemp=="+response.istemp);
			        	if(response.istemp == 2)
			        		{
			        		document.getElementById("iscol").checked = true;
			        		//$("#iscol").attr('checked',true);
			        		hidediv();
			        		$('#statename').val(response.numStateId);
			        		$("#statename").trigger("liszt:updated");
			        		cityselect();
			        		$("#cityname").val(response.numCityId);
			        		//alert("city id=="+response.numCityId);
			        		$("#cityname").trigger("liszt:updated");
			        		institutechange();
			        		$("#InstituteName").val(response.numOldPiId);
			        		$("#InstituteName").trigger("liszt:updated");
			        		popupcopi();
			        		$("#numCOPI").val(response.numPIId);
			        		$("#numCOPI").trigger("liszt:updated");
			        		$('#strRemarks').val(response.strStatus);
			        		console.log('copi value is '+$('#numCOPI').val());
			        		}
			        	else if(response.istemp == 1)
			        	{
			        		document.getElementById("iscol").checked = false;
			        		hidediv();
			        		popupcopi();
			        		console.log('copi value is '+response.numPIId);
			        		$("#numCOPIFromPI").val(response.numPIId);
			        		$("#numCOPIFromPI").trigger("liszt:updated");	
			        		$('#strRemarks').val(response.strStatus);
			        	}
			        	else
			        		{
			        		document.getElementById("iscol").checked = false;
			        		//$("#iscol").attr('checked',false);
			        		hidediv();
			        		callMe();
				        	popupcopi();
				        	$('#strRemarks').val("");
			        		}
			        	
			        },
			        
			        error: function(e){
			        	alert("Error in posting path here!");
			    	}
		        }); 
	  
	  }
	 			 $("#oldInstituteDetailsDiv").show();
		       		$("#statename_chzn").css("width","95%");

		       		$("#cityname_chzn").css("width","95%");

		       		$("#institutetypename_chzn").css("width","95%");
		       		$("#InstituteName_chzn").css("width","95%");



	});
</script>

<script type="text/javascript">
function popupcopi()
{
	 var instid = null;
	 if( document.getElementById('iscol').checked==false) {
		 instid	 = $('#numOldInstituteId').val();
	 }
	 else{
		instid =  $('#InstituteName').val();
	 }
	$.ajax(
		        {
			        type: "POST",
			        url: "/DLI/COPIList",
					async:false,
			        data:"numPIInstituteId="+instid,
			        success: function(response)
			        {
			        	$('#numCOPIFromPI').empty();
			        	$('#numCOPI').empty();
			        	$("#numCOPIFromPI").trigger("liszt:updated");
			        	$("#numCOPI").trigger("liszt:updated");
			        	
			        	if( document.getElementById('iscol').checked==false) 
			        	{
			        	$('#numCOPIFromPI').find('option').remove();
					var seloption = "";
					seloption += "<option value="+0+">Select CO-PI</option>";
					for(var i=0 ; i<response.length;i++)
					{
			       	 	seloption += "<option value="+response[i].numUserId+">"+response[i].strFirstName+"</option>"; 	
					}
					$('#numCOPIFromPI').append(seloption);
					$("#numCOPIFromPI").trigger("liszt:updated");
			        }
			        	else
			        		{
			        		$('#numCOPI').find('option').remove();
			        		var seloption = "";
							seloption += "<option value="+0+">Select CO-PI</option>";
							for(var i=0 ; i<response.length;i++)
							{
					       	 	seloption += "<option value="+response[i].numUserId+">"+response[i].strFirstName+"</option>"; 	
							}
							$('#numCOPI').append(seloption);
							$("#numCOPI").trigger("liszt:updated");
			        		
			        		}
			        	 $.unblockUI();
			        	},
		       error: function(e){
	        	alert("Error in posting path here!");
	    	}
        });  
	}
</script>

<script>
$(document).on('change','#statename',function(e) {
	cityselect();
});
		function cityselect(){		
		var conceptName = $("#statename").val();
		$.ajax({
					type : "POST",
					url : "/DLI/InstituteCity",
					async: false,
					data : "numStateId=" + conceptName,
					success : function(response) {
						//alert(response);
						var r = response + "";
						var a = r.split(",");
						$('#cityname').find('option').remove();
						var i = 1;
						var seloption = "";
						seloption += "<option value="+0+">Select</option>";
						while (i < a.length) {
							//alert(a[i]);
							seloption += "<option value="+a[i-1]+">" + a[i]
									+ "</option>";
							i = i + 2;
						}
						$('#cityname').append(seloption);
						$("#cityname").trigger("liszt:updated");

					}
				});
		}
</script>

<script>		
$(document).on('change','#cityname',function(e)
		{
	institutechange();
		});
	function institutechange()
	{
	var cityid=	$('#cityname').val();
	var stateid = $('#statename').val();
	/* var conceptName = $(this).find(":selected").val();*/
	$.ajax({
			        type: "POST",
			        url: "/DLI/CityInstituteNameAll",
			        data: "numCityId=" + cityid+"&numStateId="+stateid,
			        async: false,
			        success: function(response) {
			        	var r = response+"";
			        	$('#InstituteName').find('option').remove();
			        	//var i = 1;
			        	
			        	var seloption = "";
			       	 	seloption += "<option value="+0+">Select</option>";
			       	 	for(var i=0 ; i<response.length;i++)
						{
			       	 		seloption += "<option value="+response[i].numInstituteId+">"+response[i].strInstituteName+"</option>"; 	
						}
			        	$('#InstituteName').append(seloption);
			        	$("#InstituteName").trigger("liszt:updated");
			
			        
			        }, 
			        error: function(e){
			        	alert("Error in Institute!");
			    	} 
			    });
	}

</script>

<script>		
$(document).on('change','#InstituteName',function(e)
		{
		/* var cityid=	$('#cityname').val();
		var stateid = $('#statename').val();
		var conceptName = $(this).find(":selected").val(); */
		callMe();
		popupcopi();
		 
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