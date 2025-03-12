<%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="in.cdacnoida.msips.gl.misc.ResourceBundleFile" %>
	<%!
 	
	public String contextpath = ResourceBundleFile.getValueFromKey("CONTEXT_PATH");	
	
	%>
	
 <!-- CSS anf JS for responsive tables -->
 <link href="<%=contextpath%>resources/app_srv/msip/gl/theme/dashboard.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="<%=contextpath%>resources/app_srv/msip/gl/jssrc/plugins/jquery-responsiveText.js"></script>
 <script type="text/javascript" src="<%=contextpath%>resources/app_srv/msip/gl/jssrc/components/tabs.js"></script> 
 <link href="/DLI/resources/app_srv/msip/gl/theme/bootstrap_foo.css" rel="stylesheet" type="text/css"/> 
  <link href="/DLI/resources/app_srv/msip/gl/theme/footable.core.css?v=2-0-1" rel="stylesheet" type="text/css"/>
  <link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css" rel="stylesheet" type="text/css"/> 
  
  
    <script type="text/javascript" src="<%=contextpath%>resources/app_srv/msip/gl/jssrc/bootstrap.min.js"></script> 
  

 <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans">
<script type="text/javascript" src=resources/app_srv/msip/gl/jssrc/simple-expand.js"></script>
   
     
    <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable_v2.js?v=2-0-1" type="text/javascript"></script>
      
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sort.js?v=2-0-1" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter_v2.js?v=2-0-1" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate_v2.js?v=2-0-1" type="text/javascript"></script>
	
  
  <link href="/DLI/resources/app_srv/msip/gl/theme/bootstrap.css" rel="stylesheet">
     <link href="/DLI/resources/app_srv/msip/gl/theme/bootstrap-responsive.css" rel="stylesheet">
 	
 	 <!-- <script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/libs/bootstrap-dropdown.js"></script>-->
    <script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/libs/bootstrap-button.js"></script>
    <script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/AgendaParticipants.js"></script>
    <script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.fileDownload.js"></script>
	<script src="/DLI/resources/app_srv/msip/gl/jssrc/jqueryGoogleAPI-ui.min.js"></script> 
    
    <script>
$(document).ready( function() {
	
	var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	
      });
                
</script>
    
    
 <script>
$(function(){
    $('.widget-body').slimScroll({
        height: '100%',
		alwaysVisible: false
    });
});
</script>  
  <script type="text/javascript">
 

  $(function () {

		$('table').footable();

      $('.clear-filter').click(function (e) {
          e.preventDefault();
          $('.demo').trigger('footable_clear_filter');
			$('.filter-status').val('');
      });

      $('.filter-status').change(function (e) {
          e.preventDefault();
			var filter = $(this).val();
          $('#filter').val('');
          $('.demo').trigger('footable_filter', {filter: filter});
      });

     
      });

</script>
 <form:form id="frm" action ="" modelAttribute="scheduleForm" method="POST">
 <c:if test="${errormsg!=null && errormsg != ''}">

               <div id="userinfo-message" class="msg msgbg centered">${errormsg}</div>
      </c:if>
      
	<div class="whole padded HD">
		<i class="icon-laptop pad-right triple"></i>Agenda
	</div>


	<div class="whole padded ">
		<ul class="navig navig-tabs" id="AgendaDraft">
			<li  class="active"><a class="nounderline" id="draft" href = "#AgendaDraftDiv"
				data-toggle="tab">Draft Agenda</a>
			</li>
			<li><a class="nounderline" id="ScheduledMeeting" href="#ScheduleMeetingDiv"
				data-toggle="tab" >Scheduled Meetings</a>
			</li>
			<li><a class="nounderline" id="CancelMeeting" href ="#CancelMeetingDiv"
				data-toggle="tab" >Cancelled Meetings</a>
			</li>
			</ul>
		 <input type="hidden" id="ScheduleId"/>
    <form:hidden path="strParam" id="strParam" value=""/>
    
    <div class="align-right gap-bottom">
<div class="btn-group">
           <span class="btn dropdown-toggle blue gap-right" data-toggle="dropdown" onmouseover="openSelectDiv1()">
          <input type="button" class="blue" id="DownloadAgendaButton" value="Agenda" />  
           </span>
         <ul class="dropdown-menu d-right padding-smallest" id ="DownloadAgenda1">
    </ul>
    </div>
       <!--  <div class="btn-group">
           <span class="btn dropdown-toggle blue gap-right" data-toggle="dropdown" onmouseover="openSelectDiv()">
          <input type="button" class="blue" value="Participant List">  
           </span>
         <ul class="dropdown-menu d-right padding-smallest" id ="DownloadParticipantList">
    </ul>
    </div>   -->
    </div>
    
    <div class="tab-content" style="overflow:hidden;">
    	<!-- ---------------------------Agena Div---------------------------------------------------------------->
			
<div id="AgendaDraftDiv" class="tab-pane fade in active gap-left gap-right">
 
 
  <table class="footable blue demo" data-filter="#filter" data-page-size="10">
        <thead>
        <tr>
        <th></th>
        <th class="nobreak" data-class="expand">Purpose of the Meeting</th>
        <th class="nobreak" data-hide="phone,tablet">Committee Type</th>
        <th class="nobreak" data-hide="phone,tablet">Committee Name</th>
        <th class="nobreak" data-hide="phone">Scheme </th> 
        <th class="nobreak" data-hide="tablet,phone">Time</th>
        <th class="nobreak" data-hide="tablet,phone">Venue</th>
        <th class="nobreak" data-hide="tablet,phone" data-sort-initial="descending" data-type="numeric">From Date</th>        
        <th class="nobreak" data-hide="tablet,phone" data-type="numeric">To Date</th>
        <th class="nobreak" data-hide="phone">Status</th>
        </tr>
        </thead>
        <tbody>
         <%
         int i = 0;%> 
         <c:forEach items="${DraftList}" var="schList"> 
                <%     String strNo = "strNo["+i+"]" ; %> 
        <tr>
        
        <td class="middle">
        <input type="radio" id="${schList.numScheduleId}s${schList.objSchemeForm.numSchemeId}c${schList.objCommitteeForm.numCommitteeId}t${schList.objCommitteeTypeForm.numCommitteeTypeId}" name="schid" value="${schList.strSubmitStatus}" /></td>
        
        <td class="nobreak">${schList.strAgenda}</td>
            <td class="nobreak" >${schList.objCommitteeTypeForm.strCommitteeTypeName}</td>
            <td class="nobreak" >${schList.objCommitteeForm.strCommitteeName}</td>
            <td class="nobreak" >${schList.objSchemeForm.strSchemeName}</td>
            <td class="nobreak" >${schList.strTime}</td>
            <td class="nobreak" >${schList.strVenue}</td>
            <td class="nobreak" data-value="${schList.dateDataValue1}">${schList.strFromDate}</td>
            <td class="nobreak" data-value="${schList.dateDataValue2}">${schList.strToDate}</td>
            <td class="nobreak" >${schList.strSubmitStatus}</td>
        </tr>
        <%
        i++; %>
            </c:forEach>
        </tbody>
 <tfoot>
      
        <tr>
          <td colspan="12"><div class="pagination pagination-centered"></div></td>
        </tr>
      </tfoot>
    </table>
 
<%--  <center> --%>
 
<div class="align-center gapped">
 <input type="button" class="blue gap-right gap-top" id="Edit" value="Edit Agenda" name="Edit"/>  
 <input type="button" class="blue gap-right gap-top" id="Delete" value="Delete Schedule" name="Delete"/> 

 </div> 	
 
</div>

<!----------------------------------------------Schedule Meeting Div-------------------------------------------->

<div id="ScheduleMeetingDiv" class="tab-pane fade gap-left gap-right">
  
  <table class="footable blue demo" data-filter="#filter" data-page-size="10">
        <thead>
        <tr>
        <th></th>
        <th class="nobreak" data-class="expand">Purpose of the Meeting</th>
        <th class="nobreak" data-hide="phone,tablet">Committee Type</th>
        <th class="nobreak" data-hide="phone,tablet">Committee Name</th>
        <th class="nobreak" data-hide="phone">Scheme </th> 
        <th class="nobreak" data-hide="tablet,phone">Time</th>
        <th class="nobreak" data-hide="tablet,phone">Venue</th>
        <th class="nobreak" data-hide="tablet,phone" data-sort-initial="descending" data-type="numeric">From Date</th>        
        <th class="nobreak" data-hide="tablet,phone" data-type="numeric">To Date</th>
        <th class="nobreak" data-hide="phone">Status</th>
        </tr>
        </thead>
        <tbody>
         <%
         int j = 0;%> 
         <c:forEach items="${MeetingScheduledList}" var="schList"> 
                <%     String strNo = "strNo["+j+"]" ; %> 
        <tr>
        
        <td class="middle">
        <input type="radio" id="${schList.numScheduleId}s${schList.objSchemeForm.numSchemeId}c${schList.objCommitteeForm.numCommitteeId}t${schList.objCommitteeTypeForm.numCommitteeTypeId}" name="schid" value="${schList.strSubmitStatus}" /></td>
        
        <td class="nobreak">${schList.strAgenda}</td>
            <td class="nobreak" >${schList.objCommitteeTypeForm.strCommitteeTypeName}</td>
            <td class="nobreak" >${schList.objCommitteeForm.strCommitteeName}</td>
            <td class="nobreak" >${schList.objSchemeForm.strSchemeName}</td>
            <td class="nobreak" >${schList.strTime}</td>
            <td class="nobreak" >${schList.strVenue}</td>
            <td class="nobreak" data-value="${schList.dateDataValue1}">${schList.strFromDate}</td>
            <td class="nobreak" data-value="${schList.dateDataValue2}">${schList.strToDate}</td>
            <td class="nobreak" >${schList.strSubmitStatus}</td>
        </tr>
        <%
        j++; %>
            </c:forEach>
            
        </tbody>
 <tfoot>
      
        <tr>
          <td colspan="12"><div class="pagination pagination-centered"></div></td>
        </tr>
      </tfoot>
    </table>
 
 
 
 <div class="gap-top">
 <div class="align-center gapped">
 <input type="button" class="blue gap-right tooltip" title="This will cancel the Scheduled meeting. Mails will be sent to all members and PI(s) (if called for meeting) for cancellation" id="CancelSchedule" value="Cancel Schedule" name="CancelSchedule" onclick="callMe()"/>

 <input type="button" class="blue gap-right tooltip" title="You can edit schedule details 1 day before the meeting. This will redirect you to the edit page. Mails will be sent to all the PI and the Members." id="Reschedule" value="Re-Schedule" name="Reschedule" />
 
<input type="button" class="blue gap-right tooltip" title="You can add proposals till the last day of the meeting. This will add more proposals to the Agenda. Mails will be sent only to the newly added PI of proposals" id="AddProposal" value="Add More Proposals to Meeting" name="AddProposal" onclick="callMe()"/>

<input type="button" class="blue gap-right tooltip" title="You can add members till the last day of the meeting. This will add more members to the Agenda. Mails will be sent only to the newly added PI of proposals" id="AddMembers" value="Add More Members to Meeting" name="AddMembers" onclick="callMe()"/>

<input type="button" class="blue gap-right" id="CreateMOM" value="Create MOM" name="MOM"/> 

</div>	
   </div>		
		
</div>

<!-- -----------------------------Cancel Div-------------------------------------------------->
<div id="CancelMeetingDiv" class="tab-pane fade gap-left gap-right">
 
 <table class="footable blue demo" data-filter="#filter" data-page-size="10">
        <thead>
        <tr>
        <th></th>
        <th class="nobreak" data-class="expand">Purpose of the Meeting</th>
        <th class="nobreak" data-hide="phone,tablet">Committee Type</th>
        <th class="nobreak" data-hide="phone,tablet">Committee Name</th>
        <th class="nobreak" data-hide="phone">Scheme </th> 
        <th class="nobreak" data-hide="tablet,phone">Time</th>
        <th class="nobreak" data-hide="tablet,phone">Venue</th>
        <th class="nobreak" data-hide="tablet,phone" data-sort-initial="descending" data-type="numeric">From Date</th>        
        <th class="nobreak" data-hide="tablet,phone" data-type="numeric">To Date</th>
        <th class="nobreak" data-hide="phone">Status</th>
        </tr>
        </thead>
        <tbody>
         <%
         int k = 0;%> 
         <c:forEach items="${CancelScheduledList}" var="schList"> 
                <%     String strNo = "strNo["+k+"]" ; %> 
        <tr>
        
        <td class="middle">
                <input type="radio" id="${schList.numScheduleId}s${schList.objSchemeForm.numSchemeId}c${schList.objCommitteeForm.numCommitteeId}t${schList.objCommitteeTypeForm.numCommitteeTypeId}" name="schid" value="${schList.strSubmitStatus}" /></td>
        
        <td class="nobreak">${schList.strAgenda}</td>
            <td class="nobreak" >${schList.objCommitteeTypeForm.strCommitteeTypeName}</td>
            <td class="nobreak" >${schList.objCommitteeForm.strCommitteeName}</td>
            <td class="nobreak" >${schList.objSchemeForm.strSchemeName}</td>
            <td class="nobreak" >${schList.strTime}</td>
            <td class="nobreak" >${schList.strVenue}</td>
            <td class="nobreak" data-value="${schList.dateDataValue1}">${schList.strFromDate}</td>
            <td class="nobreak" data-value="${schList.dateDataValue2}">${schList.strToDate}</td>
            <td class="nobreak" >${schList.strSubmitStatus}</td>
        </tr>
        <%
        k++; %>
            </c:forEach>
            
        </tbody>
 <tfoot>
      
        <tr>
          <td colspan="12"><div class="pagination pagination-centered"></div></td>
        </tr>
      </tfoot>
    </table>
 
 
 
 <div class="gap-top">
 <div class="align-center gapped">
<input type="button" class="blue gap-right gap-top" id="Delete" value="Delete Schedule" name="Delete"/> 
 
</div>	
   </div>		
</div>
</div> <!-- end of tab pannels main -->
</div> 
</form:form>


<script type="text/javascript">
 $(document).on('click','#View',function(e){
 var schId = $('input[name=schid]:checked').attr('id');
 //alert(schId);
 if(schId == null || schId == ""){
	  $('.blockUI').remove();	
	 alert("Please select a meeting");
 }
 else{
	 
	
	 
	 var ScheduleId = $('#strParam').val();
	 //alert("sch id = "+numScheduleId);
	popup(ScheduleId);
	    
	                     
 }
 });
 

  </script>
  <script type="text/javascript">
  $(document).on('click','#Edit',function(e){
	  var schId = $('input[name=schid]:checked').attr('id');
	  
	 // alert(schId);
	  if(schId == null || schId == ""){
		  $('.blockUI').remove();	
	 	 alert("Please select a meeting");
	  }
	  else{
		
        					 	 $('#strParam').val(schId);
        					 	 
        					 	 var ScheduleId = $('#strParam').val();
        					 	 //alert("sch id = "+numScheduleId);
        					 	 
        					 	 $("#frm").attr("action","EditSchedule");
        					 	 
        					 	    $("#frm").submit();
        					 	    callMe();
        					 	    
        		        			  
	  }
				  });
	  

	   </script>
	   
	   	   <script type="text/javascript">
  $(document).on('click','#AddMembers',function(e){
	  var schId = $('input[name=schid]:checked').attr('id');
	  //alert(schId);
	  if(schId == null || schId == ""){
		  $('.blockUI').remove();	
	 	 alert("Please select a meeting");
	  }
	  else{
		  callMe();
	 	 $('#strParam').val(schId);
	 	 	var scid = schId.substr(0,schId.indexOf("s"));
        	         $("#frm").attr("action","addMembersToSchedule");
        			 $("#frm").submit();
	 	} 
	  });
</script>
	   
	   <script type="text/javascript">
  $(document).on('click','#AddProposal',function(e){
	  var schId = $('input[name=schid]:checked').attr('id');
	  //alert(schId);
	  if(schId == null || schId == ""){
		  $('.blockUI').remove();	
	 	 alert("Please select a meeting");
	  }
	  else{
	 	 
	 	 $('#strParam').val(schId);
	 //	 alert($('#strParam').val());
	 	// var ScheduleId = $('#strParam').val();
	 	 //alert("sch id = "+numScheduleId);
	 	
	 	 	var scid = schId.substr(0,schId.indexOf("s"));
	 	   /*	$.ajax(
        	        {
        		        type: "POST",
        		        url: "/DLI/GetScheduleDetailsToAddNewProposals?schid="+scid,
        		        success: function(response){
        		        	if(response == 1){
        		        		 $("#frm").attr("action","ViewProposalsToAdd");
        		        	 	 
        		     	 	    $("#frm").submit();
        		        	}
        		        	else
        		        		{
        		        		 $('.blockUI').remove();	
        		        		alert("You can not add proposals as the today's date has crossed the date limit. You can add proposals till the last day of the meeting ");
        		        		}
        		        },
        		        
        		        error: function(e){
        		        	alert('Error: ' + e);
        	        	}
        	        
        	        }); */
        	         $("#frm").attr("action","ViewProposalsToAdd");
        			 $("#frm").submit();
	 	 	
	 	} 
	 	 
	 	
	 	    
	 	                     
	  
	  });
	  

	   </script>
	   
	   
	   
	     <script type="text/javascript">
  $(document).on('click','#Reschedule',function(e){
	//  alert("here");
  
		var token = $("meta[name='_csrf']").attr("content");
 		var header = $("meta[name='_csrf_header']").attr("content");
 		$(document).ajaxSend(function(e, xhr, options) {
 			xhr.setRequestHeader(header, token);
 		});
	
	
	  var schId = $('input[name=schid]:checked').attr('id');
	 // alert(schId);
	
	  if(schId == null || schId == ""){
		  $('.blockUI').remove();	
	 	 alert("Please select a meeting");
	  }
	  else{
		  
		  var scid = schId.substr(0,schId.indexOf("s"));
		//  alert(scid);
			$.ajax(
        	        {
        		        type: "POST",
        		        url: "/DLI/GetScheduleEditDetails?schid="+scid,
        		        success: function(response){
        		        	//alert("response-- "+response);
        		        	if(response==0)
        		        	{
        		        		alert("You can't Re-Schedule Meeting as It is not Scheduled yet.Kindly Edit Meeting details");

        		        	}
        		        	else
        		        		{
	 	 
								 	 $('#strParam').val(schId);
								 	$('#strSubmitStatus').val('Reschedule');
								 	var scid = schId.substr(0,schId.indexOf("s"));
				 	
				 	 	
							 	   	$.ajax(
						        	        {
						        		        type: "POST",
						        		        url: "/DLI/GetScheduleDetails?schid="+scid,
						        		        success: function(response){
						        		        	if(response == 1){
						        		        		 $("#frm").attr("action","EditSchedule");
						        		        	 	 
						        		     	 	    $("#frm").submit();
						        		        	}
						        		        	else
						        		        		{
						        		        		 $('.blockUI').remove();	
						        		        		alert("You can not reshedule the meeting as the today's date has crossed the date limit. You can reschedule the meeting until 1 day before the meeting ");
						        		        		}
						        		        },
						        		        
						        		        error: function(e){
						        		        	alert('Error: ' + e);
						        	        	}
						        	        
						        	        }); 
				 
			        		      }
				 	                     
				  },
  
	
	  });
	  }
	 
		
  });

	   </script>
	   <script type="text/javascript">
  $(document).on('click','#MOM',function(e){
	  var schId = $('input[name=schid]:checked').attr('id');
	  var schval = $('input[name=schid]:checked').attr('value');
	 // alert(schval);
	  //alert(schId);
	  if(schId == null || schId == ""){
		  $('.blockUI').remove();	
	 	 alert("Please select a meeting");
	  }
	  else{
	 	 
	 	 $('#strParam').val(schId);
	 	 
	 	 var ScheduleId = $('#strParam').val();
	 	 var bkaction = "viewScheduledMeetings"
	 	 $('#strBackAction').val(bkaction);
	 	// alert("sch id = "+ScheduleId);
	 	 
	 	 /* $("#frm").attr("action","MOMCover"); commented*/
	 	 
	 	 $("#frm").attr("action","AttendanceList"); // attendance list returned instead of the MOM cover page
	 	  //  alert("After - action = "+$("#frm").attr("action"));
	 	    //submit the form
	 	    $("#frm").submit();
	 	    
	 	                     
	  }
	  });
	  

	   </script>
	   
<script type="text/javascript">
  $(document).on('click','#Delete',function(e){
	  var schId = $('input[name=schid]:checked').attr('id');
	  //alert(schId);
	  if(schId == null || schId == ""){
		  $('.blockUI').remove();	
	 	 alert("Please select a meeting");
	  }
	  else{
	 	 
	 	 $('#strParam').val(schId);
	 	 
	 	 var ScheduleId = $('#strParam').val();
	// alert("sch id = "+ScheduleId);
	 	 if(confirm("This action cannot be undone. You will lose all the information for this Meeting.")){
	 	 $("#frm").attr("action","DeleteSchedule");
	 	  //  alert("After - action = "+$("#frm").attr("action"));
	 	    //submit the form
	 	    $("#frm").submit();
	 	 }
	 	                     
	  }
	  });
  
 </script>

 
 <script type="text/javascript">
  $(document).on('click','#DownloadAgenda',function(e){
	  var schId = $('input[name=schid]:checked').attr('id');
	  
	  alert(schId);
	  if(schId == null || schId == ""){
	 	 alert("Please select a meeting");
	  }
	  else{
	 	 
		  var scid = schId.substr(0,schId.indexOf("s")); 
		  
	 	//alert(scid);
	 //	$("#frm").action="/DLI/DownloadAgenda?schid="+scid;	 	  
	 //	$("#frm").submit();
	// var sid=DataEncoder.encode(scid.toString());
	 	window.location.href = "/DLI/DownloadAgenda?schid="+scid;
	 	                     
	  }
	  });

 </script>
 <script>
 function downloadAgenda()
 {
	 var schId = $('input[name=schid]:checked').attr('id');
	  //alert(schId);
	  if(schId == null || schId == ""){
	 	 alert("Please select a meeting");
	  }
	  else{
	 	 
		  var scid = schId.substr(0,schId.indexOf("s")); 
		  
	 	//alert(scid);
	 //	$("#frm").action="/DLI/DownloadAgenda?schid="+scid;	 	  
	 //	$("#frm").submit();
	 	window.location.href = "/DLI/DownloadAgenda?schid="+scid;
	 	                     
	  }
}
 function ZIPAgenda()
 {
	 
	 callMe();

	 
	 
	 var schId = $('input[name=schid]:checked').attr('id');
	  //alert(schId);
	  if(schId == null || schId == ""){
	 	 alert("Please select a meeting");
	  }
	  else{
	 	 
		  var scid = schId.substr(0,schId.indexOf("s")); 
		  
	 	//alert(scid);
	 //	$("#frm").action="/DLI/DownloadAgenda?schid="+scid;	 	  
	 //	$("#frm").submit();
	 	
	 	
		var token = $("meta[name='_csrf']").attr("content");
 		var header = $("meta[name='_csrf_header']").attr("content");
 		$(document).ajaxSend(function(e, xhr, options) {
 			xhr.setRequestHeader(header, token);
 		});
	 	
 	 	$.ajax({
    		type: "POST",
   			 url: "/DLI/DownloadAgendaInZip",
   			 data: "schid=" + scid,
    		cache: false,
    		success: function(response,status,xhr)
   			 {
    			// var fname= xhr.getResponseHeader("filename");
    			//alert(response);
    			window.location.href = "/DLI/OpenAgendaInZip?filename="+response;
    			 $('.blockUI').hide();
    			
    		},
    		error: function (XMLHttpRequest, textStatus, errorThrown) 
    		{
       		 alert('Error occurred while opening fax template' 
              + getAjaxErrorString(textStatus, errorThrown));
    		}
		}); 
		
	 	                     
	  }
}
</script> 
 
 
	   	   	   <script type="text/javascript">
  $(document).on('click','#CancelSchedule',function(e){
	  var schId = $('input[name=schid]:checked').attr('id');
	  //alert(schId);
	  if(schId == null || schId == ""){
		  $('.blockUI').remove();	
	 	 alert("Please select a meeting");
	  }
	  else{
	 	 
	 	 $('#strParam').val(schId);
	 	 
	 	 var ScheduleId = $('#strParam').val();
	 	 $('.blockUI').remove();	
			var parameter=  $('#strParam').val();
		    var URL = "/DLI/CancelScheduledModal?strParam="+parameter;
			$.magnificPopup.open({items: 
		      {
		        src: URL,
		        type: 'iframe'
		      }
			 });	
	 	                     
	  }
	  });
	  

	   </script>

<script>
$(document).ready( function() {
	//alert("here");
        $('#userinfo-message').delay(3000).fadeOut();
        $('.calloutUp').delay(3000).fadeOut();
        $('.calloutUp2').delay(3000).fadeOut();
      });
                
</script>


<script type="text/javascript">
  
  function popup(strParam) {
	  var strParam =DataEncoder.encode(strParam.toString());;
	  newwindow=window.open("/DLI/viewScheduleDetails?param="+strParam, 'window','margin=0px auto,width='+ window.outerWidth/1.20 +',height='+ window.outerHeight/1.20 +',scrollbars=yes');
	 
	  if (newwindow) { newwindow.focus(); }
	  
    // newwindow=   window.open("/DLI/viewScheduleDetails?param="+strParam, 'window','margin=0px auto,width='+ window.outerWidth/1.20 +',height='+ window.outerHeight/1.20 +',scrollbars=yes');
 	  
  }
  </script>
   <script type="text/javascript">
 $(document).on('click','#ViewFullMOM',function(e){
 /* var schId = $('input[name=schid]:checked').attr('id');
 //alert(schId);
 if(schId == null || schId == ""){
	 alert("Please select an option");
 }
 else{
	 
	 $('#strParam').val(schId); */
	 var schId = $('input[name=schid]:checked').attr('id');
	// var scheduleId = schId+"s";
	 //alert("sch id = "+numScheduleId);
	popupFullMOM(schId);
	    
	                     
 
 });
 </script>
 <script>
 $(document).on('click','#CreateMOM',function(e){
	 
	
	/*  var schval = $('input[name=schid]:checked').attr('value');
	alert(schval); */
	 
	
	
	 var schId = $('input[name=schid]:checked').attr('id');
	var schVal = $('input[name=schid]:checked').attr('value');
	  //alert(schId);	
	  if(schId == null || schId == ""){
	 	 alert("Please select an option");
	  }
	
	 else{
	 	 
	 	 $('#strParam').val(schId);
	 	// alert($('#strParam').val());
	 	 var ScheduleId = $('#strParam').val();
	 	 //alert("sch id = "+numScheduleId);
	 	 var bkaction = ($('#backaction').val());
	 	 //alert(bkaction);
	 		 $('#strBackAction').val(bkaction);
	 	 $("#frm").attr("action","AttendanceList");
	 	  //  alert("After - action = "+$("#frm").attr("action"));
	 	    //submit the form
	 	    $("#frm").submit();
	 	    
	
	
	
	  }
	
	
	 });
	 
 </script>
 <script>
 $(document).on('click','#MOMCreate',function(e){
	 //alert("here in momcreate");
	
	 var schval = $('input[name=schid]:checked').attr('value');
	alert(schval);
	 });

  </script>
  <script type="text/javascript">
  
function popupFullMOM(ScheduleId)
{
	 
	newwindow= window.open("/DLI/viewMOMDetails?param="+ScheduleId, 'window','margin=0px auto,width='+ window.outerWidth/1.20 +',height='+ window.outerHeight/1.20 +',scrollbars=yes');
	 
	if (newwindow) { newwindow.close(); 
	} 
	newwindow= window.open("/DLI/viewMOMDetails?param="+ScheduleId, 'window','margin=0px auto,width='+ window.outerWidth/1.20 +',height='+ window.outerHeight/1.20 +',scrollbars=yes'); 

	$(prp_body).addClass( "popup-div");
	    
      
      newwindow.onbeforeunload = function (e) {
   	 
   	   $(prp_body).removeClass( "popup-div");
   	  
   	 };
}
  </script>
  
   <script>
  
  function openSelectDivMOM(){
		$('#DownloadMOM').find('li').remove();
	  	var seloption = "";
			seloption = "<li><a  href='#!' onclick='viewMOMHTML()'><i class='icon-eye-open icon-1x dark-green'></i>View HTML</a></li>";
			seloption += "<li><a  href='#!' onclick='downloadMOM()'><i class='icon-file icon-1x red'></i>Download (pdf)</a></li>";
		$('#DownloadMOM').append(seloption);
		}
  
  </script>
  
   <script>
  
  function viewMOMHTML(){
	  var schId = $('input[name=schid]:checked').attr('id');
	  //alert(schId);
	  
	  if(schId == null || schId == ""){
	 	 alert("Please select a Meeting");
	  }
	  else{
	 	// alert("before opening");
		  var scid = schId.substr(0,schId.indexOf("s")); 
		var strReportFormat="html";  
		//window.open("/DLI/DownloadMOM?schid="+scid+"&strReportFormat="+strReportFormat, 'window','margin=0px auto,width='+ window.outerWidth/1.20 +',height='+ window.outerHeight/1.20 +',scrollbars=yes');
		window.open("/DLI/viewMOMDetails?param="+schId, 'window','margin=0px auto,width='+ window.outerWidth/1.20 +',height='+ window.outerHeight/1.20 +',scrollbars=yes');
	 	                     
	  }
		}
  
  </script>
  
   <script>
   function openSelectDiv(){
		$('#DownloadParticipantList').find('li').remove();
	  	var seloption = "";
			seloption = "<li><a  href='#' onclick='viewHTML()'><i class='icon-eye-open icon-1x dark-green'></i>View HTML</a></li>";
			seloption += "<li><a  href='#' onclick='downloadParticipantList(1)'><i class='icon-file icon-1x red'></i>Download (pdf)</a></li>";
			seloption += "<li><a  href='#' onclick='downloadParticipantList(2)'><i class='icon-edit icon-1x blue'></i>Download (doc)</a></li>";
		$('#DownloadParticipantList').append(seloption);
		}

		function openSelectDiv1(){
			//alert("here");
		$('#DownloadAgenda1').find('li').remove();
	  	var seloption = "";
			seloption = "<li><a  href='#' onclick='viewAgenda()'><i class='icon-eye-open icon-1x dark-green'></i>View</a></li>";
			//seloption += "<li><a  href='#' onclick='downloadAgenda()'><i class='icon-download-alt icon-1x red'></i>Download</a></li>";
			//seloption += "<li><a  href='#' onclick='ZIPAgenda()'><i class='icon-download-alt icon-1x red'></i>Download with Proposals</a></li>";
		$('#DownloadAgenda1').append(seloption);
		}
		
		
		
		  function openSelectDiv2(){
				$('#DownloadParticipantList1').find('li').remove();
			  	var seloption = "";
					seloption = "<li><a  href='#' onclick='viewHTML()'><i class='icon-eye-open icon-1x dark-green'></i>View HTML</a></li>";
					seloption += "<li><a  href='#' onclick='downloadParticipantList(1)'><i class='icon-file icon-1x red'></i>Download (pdf)</a></li>";
					seloption += "<li><a  href='#' onclick='downloadParticipantList(2)'><i class='icon-edit icon-1x blue'></i>Download (doc)</a></li>";
				$('#DownloadParticipantList1').append(seloption);
				}

				function openSelectDiv3(){
					//alert("here");
				$('#DownloadAgenda2').find('li').remove();
			  	var seloption = "";
					seloption = "<li><a  href='#' onclick='viewAgenda()'><i class='icon-eye-open icon-1x dark-green'></i>View</a></li>";
					seloption += "<li><a  href='#' onclick='downloadAgenda()'><i class='icon-download-alt icon-1x red'></i>Download</a></li>";
				$('#DownloadAgenda2').append(seloption);
				}
		
		
  function downloadMOM(){
	  var schId = $('input[name=schid]:checked').attr('id');
	  //alert(schId);
	  
	  if(schId == null || schId == ""){
	 	 alert("Please select a Meeting");
	  }
	  else{
	 	// alert("before opening");
		  var scid = schId.substr(0,schId.indexOf("s")); 
		var strReportFormat="pdf";  
		window.open("/DLI/DownloadMOM?schid="+scid+"&strReportFormat="+strReportFormat, 'window','margin=0px auto,width='+ window.outerWidth/1.20 +',height='+ window.outerHeight/1.20 +',scrollbars=yes');
	 //window.open("/DLI/app_srv/msip/Dashboard/MOMCoverPage.jsp", 'window','margin=0px auto,width='+ window.outerWidth/1.20 +',height='+ window.outerHeight/1.20 +',scrollbars=yes');
	 	                     
	  }
		}
  
  </script>


        <!-- <link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css" /> -->
        
 



