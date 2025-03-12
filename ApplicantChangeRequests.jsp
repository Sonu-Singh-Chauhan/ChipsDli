<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import=" java.io.File,java.util.*"%>
 <%@ page isELIgnored="false" %>
    
  <html>
<!-- <script>
	$(document).on('change','#ProposalSequence',function(e){
 	if($('#proID').val()=='0'){
 	}
 	else{
		bringData1();
		$("#RequestTypeDD").val(0);
		$("#RequestTypeDD").trigger("liszt:updated");
		$('.hideIt').hide();
		$('#Remarks').val('');
		}
	});
</script> -->

<script>
$(document).on('change','#RequestTypeDD',function(e){
 if($('#ProposalSequence').val()=='0'){
	 alert("Please Select Proposal Id first");
 }
 else{
	 showDiv();
	//showDiv(data);
	//$('#Remarks').val('');
	}
});
</script>



<!-- FOR DATE PICKER -->
	
	<script> 	

     $(function () {
          
    // alert("dssssss");
    
     var $datepicker_start_input = $("#strApprovedTimeLines").pickadate({
  		  selectYears: true,
      	    selectMonths: true,
      	    selectYears: 100,
      	    weekdaysShort: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
  	     hiddenSuffix: 'date_start_submit'
  	     
  	    	
  	 });
  	 from_picker = $datepicker_start_input.pickadate('picker'); 
  	 
  	 var $datepicker_start_input = $("#strRequestedTimeLines").pickadate({
 		  selectYears: true,
     	    selectMonths: true,
     	    selectYears: 100,
     	    weekdaysShort: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
 	     hiddenSuffix: 'date_start_submit'
 	     
 	    
 	 });
 	 from_picker1 = $datepicker_start_input.pickadate('picker');
 	 
 	 
 	 
 	 /* from_picker.on('open', function(){

 	         $( "table.picker__table" ).removeClass( "footable" );
 	 });
 	 //Check if there is a from or to date to start with.
 	 if ( from_picker.get('value') ) {
 	 to_picker.set('min', from_picker.get('select'));
 	 }
 	 if ( to_picker.get('value') ) {
 	 from_picker.set('max', to_picker.get('select'));
 	 }

 	 //When something is selected, update the from and to limits.
 	 from_picker.on('set', function(event) {
 	 if ( event.select ) {
 	 to_picker.set('min', from_picker.get('select'));
 	 }
 	 });
 	 to_picker.on('set', function(event) {
 	 if ( event.select ) {
 	 from_picker.set('max', to_picker.get('select'));
 	 }
 	 });
 */    
 });

</script> 

  <script>
$(document).ready( function() {
        $('#userinfo-message').delay(5000).fadeOut();
        
        $("#changeInvestmentRequest").hide();
		$("#changeCompanyNameRequest").hide();
		$("#changeCompanyRequest").hide();
		$("#changeApprovedCapexRequest").hide();
		$("#changeProjectLocationRequest").hide();	
		
		
      });
               
</script>


<!-- <script>
function showDiv(data){
	$('.hideIt').show();
	$('#requestId').val(data);
	//$('#Remarks').val('');
		 var value = $.trim($('#ProposalSequence').find(":selected").val());
		 var reqId =  $('#requestId').val();
		 var requestType = $.trim($('#RequestTypeDD').find(":selected").val());
		 
		 
		 var token = $("meta[name='_csrf']").attr("content");
	 		var header = $("meta[name='_csrf_header']").attr("content");
	 		$(document).ajaxSend(function(e, xhr, options) {
	 			xhr.setRequestHeader(header, token);
	 		});
		 if(value!=0 && requestType!=0){
					$.ajax(
				        {
					        type: "POST",
					        url: "/DLI/ShowRequestRemarks",
				         	data: {
					       		"proId" : value,
			       				"numRequestId": reqId,
			       				"numRequestType":requestType
							},
					        success: function(data){
					        	//$('#Remarks').val(data);
				         	},
					        error: function(e){
					        	alert("Remarks not saved!");
					    	}
					});
		}
}
</script> -->


<script>
function showDiv(){
	$('.hideIt').show();
					
}
</script> 

<!-- <script>
function hideDiv(){
	$('.hideIt').hide();
}
</script> -->
  

<!-- <script>
 $(document).on('click','#Save',function(e){
	 
	 var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		 var value = $.trim($('#ProposalSequence').find(":selected").val());
		 var remarks = $.trim($('#Remarks').val());
		 var requestType = $.trim($('#RequestTypeDD').find(":selected").val());
		 if(value!=0 && remarks!=""){
		 
		 var reqId =  $('#requestId').val();
			$.ajax(
			        {
				        type: "POST",
				        url: "/DLI/OtherRequestWithDocuments",
			         	data: {
				       		"proId" : value,
		       				"selected": remarks,
		       				"numRequestType":requestType,
		       				"numRequestId": reqId
						},
				        success: function(data){
				           alert("Request sent successfully!");
				           location.reload();
			         	},
				        error: function(e){
				        	alert("Invalid Proposal!");
				    	}
		});
		}
		else if (remarks==""){
			alert("Please input the justification for the request!");
		}
		else {
			alert("Kindly select a valid file number");
		}
	});
 </script> -->

<!-- <script>
function callSaveFunction(){
	
	var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		 var value = $.trim($('#ProposalSequence').find(":selected").val());
		 var remarks = $.trim($('#Remarks').val());
		 if(value!=0 && remarks!=""){
		 var reqId =  $('#requestId').val();
			$.ajax(
			        {
				        type: "POST",
				        url: "/DLI/SaveRequestRemarks",
			         	data: {
				       		"proId" : value,
		       				"selected": remarks,
		       				"numRequestId": reqId
						},
				        success: function(data){
			         	},
				        error: function(e){
				        	alert("Remarks not saved!");
				    	}
		});
		}
}

</script> -->
<!-- <script>
$(document).on('click','#Attach',function(e) {
var value = $.trim($('#ProposalSequence').find(":selected").val());
var reqVal = $('#requestId').val();
if(value!=0){
			/* newwindow=window.open("/DLI/GeneralDocumentsRequest?tempId="+value+"&TypeOfPage="+0+"&reqId="+reqVal, 'window', 'margin=0px auto,width='+ window.outerWidth/1.20 +',height='+ window.outerHeight/1.20+',scrollbars=yes');
		        $(prp_body).addClass( "popup-div");
		       newwindow.onbeforeunload = function (e) {
		    	   $(prp_body).removeClass( "popup-div"); 
		    	 }; */
		    	 
				openWindowWithPost('POST', '/DLI/GeneralDocuments', {"tempId":value,"TypeOfPage":0}, '_blank'); 
    	 }
    	 else{
    	 alert("Please select a file number!");
    	}
});
</script> -->



<script>
$(document).on('change','#RequestTypeDD',function(e){
	requestType = $.trim($('#RequestTypeDD').find(":selected").val());
	
	if($('#ProposalSequence').val()=='0' || $('#RequestTypeDD').val()=='0'){
		 	$("#changeInvestmentRequest").hide();
			$("#changeCompanyNameRequest").hide();
			$("#changeCompanyRequest").hide();
			$("#changeProjectLocationRequest").hide();
			$("#changeApprovedCapexRequest").hide();
	 }
	else if(requestType == 18){
		
		$("#changeInvestmentRequest").show();
		$("#changeCompanyNameRequest").hide();
		$("#changeCompanyRequest").hide();
		$("#changeProjectLocationRequest").hide();
		$("#changeApprovedCapexRequest").hide();
		bringData2();
	}
	
	else if(requestType == 19){
		$("#changeInvestmentRequest").hide();
		$("#changeCompanyNameRequest").show();
		$("#changeCompanyRequest").hide();
		$("#changeProjectLocationRequest").hide();
		$("#changeApprovedCapexRequest").hide();
		bringData2();
	}
	else if(requestType == 20){
		$("#changeInvestmentRequest").hide();
		$("#changeCompanyNameRequest").hide();
		$("#changeCompanyRequest").show();
		$("#changeProjectLocationRequest").hide();
		$("#changeApprovedCapexRequest").hide();
		bringData2();
	}
	else if(requestType == 21){
		$("#changeInvestmentRequest").hide();
		$("#changeCompanyNameRequest").hide();
		$("#changeCompanyRequest").hide();
		$("#changeProjectLocationRequest").show();
		$("#changeApprovedCapexRequest").hide();
		bringData2();
	}
	else if(requestType == 22){
		$("#changeInvestmentRequest").hide();
		$("#changeCompanyNameRequest").hide();
		$("#changeCompanyRequest").hide();
		$("#changeProjectLocationRequest").hide();
		$("#changeApprovedCapexRequest").show();
		bringData2();
	}
});
</script>


<style>
		
	#dataTableM{
		counter-increment: Serial;      /* Increment the Serial counter */
 	    content: "Serial is: " counter(Serial); /* Display the counter */
 	}
 	
 	fieldset.requestalldisplay{
	
		border: 0 none;
		
	
	}
	
	

</style>

  </head>
  <body onload="bringData();getRequestDetails1();getRequestDetails2();getRequestDetails3();getRequestDetails5();">
  
  <fieldset>
 		<form:form name="form"  id="form1" method="get" action="" modelAttribute="temp">
 			<input type="hidden" name="numRequestId" id="requestId" value="" >
 			<article class="row">
        		<section class="whole">
        		  <div class="align-center">
            		<h4 class=" pad-top frm_title">New Request </h4>
          		  </div>
          		  
           		      
              	
    											<div class="row">	
										<div class="col-md-3 col-sm-3 col-xs-12"></div>	
	         						<div class="col-md-2 col-sm-2 col-xs-12">	
										<form:label path="numProposalId">Application Number</form:label>	
	        						</div>	
	        						<div class="col-md-4 col-sm-4 col-xs-12">	
										<form:select path="numProposalId" id="ProposalSequence" style="width:100%" class="chzn-select" onchange="getData()">	
											<form:option value="0">Select Proposal</form:option>	
										</form:select>	
	        						</div>	
	        						<div class="col-md-3 col-sm-3 col-xs-12"></div>	
	        						</div>	
	             				
							    	
		
	   	
								
								<div class="row" style="margin-top:10px">	
									<div class="col-md-3 col-sm-3 col-xs-12"></div>	
	         						<div class="col-md-2 col-sm-2 col-xs-12">	
										<form:label path="numRequestTypeId">Request Type</form:label>	
	        						</div>	
	        						<div class="col-md-4 col-sm-4 col-xs-12">	
										<form:select path="numRequestTypeId" id="RequestTypeDD" style="width:100%" class="chzn-select" onchange="getData()">	
											<form:option value="0">Select Type of Request</form:option>	
										</form:select>	
	   										
	        						</div>	
	        							<div class="col-md-3 col-sm-3 col-xs-12"></div>	
	        							<input type="hidden" id="RequestTypeDD_value" value="" >	
	        </div>	    

				

     
        		</section>
			</article>
		</form:form>
	</fieldset>
    
	<section class="commonsec">
		<div class="whole hideIt">
			<section id="changeInvestmentRequest">
				<jsp:include page="/app_srv/msip/gl/jsp/changeInvestmentTimelineRequest_old.jsp" />
			</section>

			<section id="changeCompanyNameRequest">
				<jsp:include page="/app_srv/msip/gl/jsp/changeCompanyNameRequest_old.jsp" />
			</section>

			<section id="changeCompanyRequest">
				<jsp:include page="/app_srv/msip/gl/jsp/changeCompanyRequest_old.jsp" />
			</section>
			
			<section id="changeProjectLocationRequest">
				<jsp:include page="/app_srv/msip/gl/jsp/changeProjectLocationRequest_old.jsp" />
			</section>
			
			<section id="changeApprovedCapexRequest">
				<jsp:include page="/app_srv/msip/gl/jsp/changeApprovedCapexRequest_old.jsp" />
			</section>
			
		</div>
		</section>
<!-- 	 <div class='requestalldisplay'>	
	<section class="secchart padded rounded">	
	<div class="card card-chart">	
	<div class="card-header" data-background-color="orange">	
	<div class="pull-left">	
		                        <h4 class="title">All Submitted Requests</h4></div>	
		                            <div class="pull-right">	
		 	<input name="showrequest" id="btnM" type="button" value="Show/Hide All Submitted Requests" onclick="showrequestfunc()" class="blue">	
		 </div> 	
		                            </div>	
	<div class="card-body">	
	<div class="whole">	
		 	
		 	
		 	
		 <br/>
	<section id='allrequestsection'>    
	<div class="whole">
	<table data-paging="true" data-filtering="true" data-sorting="true" data-editing-allow-delete="true"  class="table table-hover table-striped" id="proM">

			<thead>
          		
          		
          			<tr>	
	          			<th>S. No.</th>	
	          			<th data-breakpoints="xs sm">Request Type</th>	
	           			<th>Application Number</th>	
	            		<th data-breakpoints="xs sm">Status</th>	
	             		
	</tr>
			</thead>
  			
  			

  		
      		
      		
		</table>

	</div>
	</section></div></div>	
		</div>	
		</section>
</div> -->

	
		
	<!-- scripts-->

 
<script>
$('#Remarks').validatebox({
    required: true,
    validType: ['minLength[1]','maxLength[2500]']
});

</script>

 <script>
	$(document).on('change','#ProposalSequence',function(e){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		}); 
		 $('#RequestTypeDD').val("0");
		 $("#RequestTypeDD").trigger("liszt:updated");
		 $("#changeInvestmentRequest").hide();
			$("#changeCompanyNameRequest").hide();
			$("#changeCompanyRequest").hide();
			$("#changeProjectLocationRequest").hide();
			$("#changeApprovedCapexRequest").hide();
		 
	});
</script> 

<script>
	function getData(){
		var proposalId = $('#ProposalSequence').val();
		var requestType = $('#RequestTypeDD').val();
		//var numrequestId = $('#requestId').val();
		//alert("requestType"+requestType);
		if(proposalId!="0" && requestType!="0")
			{
	       	 $.ajax(
		        {
			        type: "GET",
			        url: "/DLI/GetDataByApplicationId",
			        //data: {"proposalId":proposalId,"requestType":requestType,"requestId":requestId},
			        data: {"proposalId":proposalId,"requestType":requestType},
			        success: function(response){
			        	//alert(numrequestId);
			        	//for FORM-1
			        	$('#numProposalId1').val(response.numProposalId);
			        	$('#strApplicantName1').val(response.strApplicantName);
			        	$('#dtApprovalDate1').val(response.dtApprovalDate);
			        	$('#dtApplicationDate1').val(response.dtApplicationDate);
			        	$('#numRequestTypeId1').val(response.numRequestTypeId);
			        	$('#numProposedInvestment').val(response.numProposedInvestment);
			        	$('#strApprovalLetterNo').val(response.strApprovalLetterNo);
			        	$('#strApprovedTimeLines').val(response.strApprovedTimeLines);
			        	$('#strRequestedTimeLines').val(response.strRequestedTimeLines);
			        	$('#numInvestmentIncurred').val(response.numInvestmentIncurred);
			        	$('#numInvestmentIncurredTillDate').val(response.numInvestmentIncurredTillDate);
			        	$('#breakupInvestmentPlantMachinery').val(response.breakupInvestmentPlantMachinery);
			        	$('#breakupInvestmentUtilities').val(response.breakupInvestmentUtilities);
			        	$('#breakupInvestmentPlantBuilding').val(response.breakupInvestmentPlantBuilding);
			        	$('#strExtensionReason').val(response.strExtensionReason);
			        	
			        	//$('#numRequestId1').val(numrequestId);
			        	
			        	//for FORM-2
			        	$('#numProposalId2').val(response.numProposalId);
			        	$('#strApplicantName2').val(response.strApplicantName);
			        	$('#dtApprovalDate2').val(response.dtApprovalDate);
			        	$('#dtApplicationDate2').val(response.dtApplicationDate);
			        	$('#numRequestTypeId2').val(response.numRequestTypeId);
			        	$('#strApprovalLetterNo2').val(response.strApprovalLetterNo);
			        	$('#strNewCompanyNamePPE').val(response.strNewCompanyNamePPE);
			        	$('#strReasonChangeCompanyNamePPE').val(response.strReasonChangeCompanyNamePPE);
			        	if(response.strIsChangePromoterShareHolder=='Yes'){
			        		$("#button").prop("checked", true);
			        	}
			        	if(response.strIsChangePromoterShareHolder=='No'){
			        		$("#button1").prop("checked", true);
			        	}
			        	$('#strOtherInformation').val(response.strOtherInformation);
			        	//$('#numRequestId2').val(requestId);
			        	
			        	//for FORM-3
			        	$('#numProposalId3').val(response.numProposalId);
			        	$('#strApplicantName3').val(response.strApplicantName);
			        	$('#dtApprovalDate3').val(response.dtApprovalDate);
			        	$('#dtApplicationDate3').val(response.dtApplicationDate);
			        	$('#numRequestTypeId3').val(response.numRequestTypeId);
			        	$('#strApprovalLetterNo3').val(response.strApprovalLetterNo);
			        	$('#strNewCompanyName').val(response.strNewCompanyName);
			        	$('#strReasonChangeCompanyName').val(response.strReasonChangeCompanyName);
			        	$('#strIsImpactChangeInProposal').val(response.strIsImpactChangeInProposal);
			        	
			        	//$('#numRequestId3').val(numRequestId);
			        	
			        	//for FORM-4
			        	$('#numProposalId4').val(response.numProposalId);
			        	$('#strApplicantName4').val(response.strApplicantName);
			        	$('#dtApprovalDate4').val(response.dtApprovalDate);
			        	$('#dtApplicationDate4').val(response.dtApplicationDate);
			        	$('#numRequestTypeId4').val(response.numRequestTypeId);
			        	//$('#numRequestId4').val(numRequestId);
			        	
			        	//for FORM-5
			        	$('#numProposalId5').val(response.numProposalId);
			        	$('#strApplicantName5').val(response.strApplicantName);
			        	$('#dtApprovalDate5').val(response.dtApprovalDate);
			        	$('#dtApplicationDate5').val(response.dtApplicationDate);
			        	$('#numRequestTypeId5').val(response.numRequestTypeId);
			        	$('#strApprovalLetterNo5').val(response.strApprovalLetterNo);
			        	$('#strReasonChangeCapex').val(response.strReasonChangeCapex);
			        	$('#numInvestmentNewCapex').val(response.numInvestmentNewCapex);
			        	$('#numInvestmentDroppedCapex').val(response.numInvestmentDroppedCapex);
			        	
			        	//$('#numRequestId5').val(numRequestId);

			        }
			        });
	}
		}	

</script>
<script>
 function bringData(){
	 
	 //getRequestDetails();
 	 $('.hideIt').hide();
 		$('.requestdisplay').hide();
 		$('#allrequestsection').hide();
 		$('#allrequestsection1').hide();
 		$('#allrequestsection2').hide();
 		$('#allrequestsection3').hide();
 		$('#allrequestsection5').hide();
 		
 	var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	       	 $.ajax(
		        {
			        type: "POST",
			        //url: "/DLI/Global/GetProposals",
			        //url: "/DLI/GetApprovedProposals",
			        url: "/DLI/Global/GetApprovedProposals",
			        
			        success: function(response){
			        	
			        	$('#ProposalSequence').find('option').remove();
			 			var seloption = "<option value='0'>Select Proposal/Application No.</option>";
			 			for(var i = 0; i < response.length; i++)
			 			{
			 				//seloption += "<option value='"+response[i].proposalId+"'>"+response[i].filename+"</option>";
			 				seloption += "<option value='"+response[i].proposalId+"'>"+response[i].proposalId+"</option>";
			 			}	        
			 			$('#ProposalSequence').append(seloption);
			 			$("#ProposalSequence").trigger("liszt:updated");
			        	
			        	
			         },
			        
			        error: function(e){
			        	alert("Error in posting path here!");
			    	}
		        
		        });
		        
		        $.ajax(
		        {
			        type: "POST",
			        url: "/DLI/GetAllRequestTypes",
			        success: function(response){
			        	
			        	$('#RequestTypeDD').find('option').remove();
			 			var seloption = "<option value='0'>Select request type</option>";
			 			for(var i = 0; i < response.length; i++)
			 			{
			 				seloption += "<option value='"+response[i].numRequestId+"'>"+response[i].numRequestType+"</option>";
			 			}	        
			 			$('#RequestTypeDD').append(seloption);
			 			$("#RequestTypeDD").trigger("liszt:updated");
			 			
			 			
			 			
			        	//alert("printing request type "+$('#RequestTypeDD'));
			        	//alert("printed second value "+seloption)
			         },
			        
			        error: function(e){
			        	alert("Error in posting path here!");
			    	}
		        
		        });
				        
	}
 
 </script>
 
 <!-- <script>
 function bringData1(){
	 
	 var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
  var value = $.trim($('#ProposalSequence').find(":selected").val());
       	 $.ajax(
	        {
		        type: "POST",
		        url: "/DLI/GetOtherDocumentsForRequest",
		        data: "proId=" +value, 
		        success: function(response){
	        		        	
		         },
		        
		        error: function(e){
		        	alert("Error in posting path here!");
		    	}
	        
	        });
	        	}
 
 </script> -->
 
   <script>
 function bringData2(){
	 
	 var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	 var value = $.trim($('#ProposalSequence').find(":selected").val());
	 //var remarks = "";
	 var requestType = $.trim($('#RequestTypeDD').find(":selected").val());
       			$.ajax(
				        {
					        type: "POST",
					        url: "/DLI/CheckRequestFileStatus",
				         	data: {
					       		"proId" : value,
		        				//"selected": remarks,
		        				"numRequestType":requestType
	   						},
					        success: function(data){
						        if(data!=-1){
   						        	//showDiv(data);
   						        	//alert("reqid"+data);
   						        	$('#requestId').val(data);
   						       		//$('#numRequestId').val(data);
   						        	$('#numRequestId1').val(data);
   						        	$('#numRequestId2').val(data);
   						        	$('#numRequestId3').val(data);
   						        	$('#numRequestId4').val(data);
   						        	$('#numRequestId5').val(data);
   						        	
						        }						        
						        else if(data==-1){
						        	//hideDiv();
						        	alert("You cannot submit multiple requests of the same type for this file number");	
						        	location.reload();
						        	}
						       
		           			},
					        error: function(e){
					        	alert("Invalid Proposal!");
					    	}
						});
	        	}
 
 </script> 
 
 
<!-- <script type="text/javascript">
 	function getAllRequestDetails(){
 		
		
		var token = $("meta[name='_csrf']").attr("content");
 		var header = $("meta[name='_csrf_header']").attr("content");
 		$(document).ajaxSend(function(e, xhr, options) {
 			xhr.setRequestHeader(header, token);
 		});
 		
 		var seloption = ""; 
       	$.ajax(
	          {
	          	type: "POST",
	            url: "/DLI/getAllSubmittedRequest",
	              data: {},
	            success: function(response) {
	            	var counter=1;
	            	// alert("getProposals "+response.length);
	            	if(response.length>0){
	            		
	            		$('#dataTableM').find('tr').remove();
	                    	
	        			jQuery.each(response, function(index,item) {
	        				
	        				//alert(item.numRequestTypeId);
	        				//seloption +=  '<tr><td  class="nobreak"><input type="checkbox" name="Newside1" id = "'+item.numProposalId+'" "/></td><td  class="nobreak"><a href="#" onclick="fullproposal('+item.numProposalId+')">'+item.numProposalId+'</a><blink>'+item.strFollowUpPhaseWise+'<blink></td><td  class="nobreak">'+item.strOldProposalId+'</td> <td  class="nobreak">'+item.strCompanyName+'</td> <td  class="nobreak">'+item.strPIName+'</td><td  class="nobreak" data-value="'+item.dateDataValue+'">'+item.strDisplayDate+'</td><td style="text-align:center"><input type="button" class="blue" onclick="UploadIFDApproval('+item.numProposalId+')" value="Approval Letter" /></td><td style="text-align:center"><input type="button" class="blue" onclick="UploadSanctionLetter('+item.numProposalId+')" value="Sanction Letter" /></td><td style="text-align:center"><input type="button" class="blue" onclick="UploadVerificationReport('+item.numProposalId+')" value="'+item.strBarredCheck+'" /></td></tr>';
		        		        				      
	        				seloption += '<tr><td >'+counter+'</td><td>'+item.strRequestTypeId+'</td>'+
	        				'<td>'+item.numProposalId+'</td><td  >'+item.strStatus+'</td> </tr>';
	        				
    	        				counter++; 
    	        				
	        			});	 
	        		
	        			$('#proM').append(seloption);
	        			//$('#proM').append(seloption);
	        			$('#proM').footable({
	        				  calculateWidthOverride: function() {
		        				    return { width: $(window).width() };
		        				  },
	        					
		        				  "paging": {	
		        						"size": 5,	
		        						"enabled": true	
		        					}	
		        						
		        			
	        			});
	        		}
	                                    	
	                                   	
	            },
	            error: function(e){
	            	alert('get proposals: ' + e);
	            }
	                      			               
	           });	  
	                                       
	}
	                       
</script> -->

<script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/charCount.js"></script>
  <script> 
 $(document).ready(function(){	
		//custom usage
		$("#Remarks").charCount({
			allowed: 2500,		
			warning: 2400,
			counterText: 'Characters left:  '	
		});
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
  
  <script>
  
  function showrequestfunc() {
    var x = document.getElementById("allrequestsection");
    if (x.style.display === "none") {
      x.style.display = "block";
    } else {
      x.style.display = "none";
    }
  }
 
</script>


 
</body>
</html>