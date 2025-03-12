<%@page import="in.cdacnoida.msips.gl.misc.AlertMessagesFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
    
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import ="in.cdacnoida.msips.gl.model.UserInfo" %>
 <jsp:include page="../../mm01/jsp/ProposalFlow.jsp" /> 
 <%
 UserInfo usrInfo = new UserInfo();
 int userId = 0;
 usrInfo = (UserInfo)request.getSession().getAttribute("UserInfo");
	
	if(usrInfo != null)
	{
		userId = usrInfo.getNumUserId();
	}
 %>
 
 <%
	String saveTooltip = AlertMessagesFile.getValueFromKey("SAVE_TOOLTIP");
	String nextTooltip = AlertMessagesFile.getValueFromKey("NEXT_TOOLTIP");
	String deleteTooltip= AlertMessagesFile.getValueFromKey("DELETE_TOOLTIP");
	%>
 <link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
  <link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css" rel="stylesheet" type="text/css" />
   <link href="/DLI/resources/app_srv/msip/gl/theme/footable.sortable-0.1.css" rel="stylesheet" type="text/css" />
  <link href="/DLI/resources/app_srv/msip/gl/theme/footable.paginate.css" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/data-generator.js" type="text/javascript"></script>
  <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/jquery-ui.css" />
 
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/jquery-ui.js"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sortable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate.js" type="text/javascript"></script>
  
  
<!-- script for date picker pickadate  -->

<link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/pickadate/classic.css" id="theme_base">
<link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/pickadate/classic.date.css" id="theme_date">
<link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/pickadate/classic.time.css" id="theme_time">
  
  	 <script>
    $(document).ready( function() {
          $('#userinfo-message').delay(20000).fadeOut();
      });
  </script>
  
  <script type="text/javascript">
    $(function() {
      $('table').footable();
    });
    
    function  gonext()
    {
    	document.frm.action="/DLI/nextRedirectPageWithoutModel?schid="+$('#numScheme').val()+"&currprocessid="+$('#strCurrentProcessId').val()+"&proid=0&version=0&numProposalSeq=0&strFormStatus=SAVEASDRAFT";
    	document.frm.method="POST";
    	document.frm.submit();
    }
    
    $(document).ready( function() {

		var pcode="PSCareer"
	    $.ajax({
	        type: "POST",
	        url: "/DLI/getCurrentProcessId",
	        data: "processecode=" + pcode,
	        success: function(response) 
	        {
	         //   alert(response);
	            $('#strCurrentProcessId').val(response);

	        }
	     });

      });
	
	$(document).on('click','input[type="checkbox"]',function(e){
			
					var ids =[];
					$("#tab1 input:checkbox:checked").each(function() {
						var target = $(this).closest('tr').find('td').map( function(){
						return $(this).text();
						}).get();
												
					var values1=target[2];
					//	 alert(target); // third -->
						ids.push(values1);
						console.clear();
						console.log(ids);
					});
				//	alert(ids);
					});
				
					
			
			
			$(document).on('click','#Edit',function(e){
			var resultArray1 = $(this).closest('tr').find('td').map( function(){
					return $(this).text();
				}).get();
			

			$('#postName').val(resultArray1[1]);
			$('#employerName').val(resultArray1[2]);
			$('#payGrade').val(resultArray1[5]);
			$('#salaryDrawn').val(resultArray1[6]);
			$('#duty').val(resultArray1[7]);
			$('#address').val(resultArray1[8]);
			$('#remarks').val(resultArray1[9]);
			$('#JobType').val(resultArray1[3]);
			$("#JobType").trigger("liszt:updated");
			$('#JobCategory').val(resultArray1[4]);
			$("#JobCategory").trigger("liszt:updated");
			$('#startDate').val(resultArray1[10]);
			$('#endDate').val(resultArray1[11]);
			$('.save_update').val('Update');
			$('#careerId').val(resultArray1[12]);

			
			
			});
			
</script>

<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<!-- <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/jquery.fileupload-ui.css"> -->
  </head>
  <body>
   <c:if test="${errormsg!=null && errormsg != ''}">

               <div id="userinfo-message" class="msg msgbg centered">${errormsg}</div>
      </c:if>
    <div class="padded">
        <article class="row">
        
        <section class="whole">
          <div class="align-center">
            <h4 class="asphalt pad-top">
            Career Details 
            </h4>
          </div>
          
          <div class="grey_border rounded padded centered gap-top gap-bottom">
            <form:form action="AddUpdateProfileCareer" id="frm" name="frm" method="POST" modelAttribute="ProfileCareer">
              <div class="row">
               <div class="w770 pull-right bold">
               <form:hidden path="strCurrentProcessId" id="strCurrentProcessId" />
				<form:hidden path="numScheme" id="numScheme" />
				<input type="hidden" name="numProposalSeq" id="numProposalSeq" value="${pseq}" /> 
				<input type="hidden" name="numProposalId" id="numProposalId" value="${pid}" /> 
				<input type="hidden" name="strFormStatus" id="strFormStatus" value="FULLPROPOSAL" />
				<input type="hidden" id="strFileNo" value="" name="strFileNo" />
				<input type="hidden" name="numSpecialCallId" id="numSpecialCallId" value="0" /> 
				<input type="hidden" name="numSCThemeId" id="numSCThemeId" value="0" /> 
				<input type="hidden" name="strIsSpecialCall" id="strIsSpecialCall" value="N" /> 
				<input type="hidden" name="numProposalReferenceId" id="numProcessPrimaryKey" value="" />
               <span class="red">*</span> Mandatory Fields
               </div>
                
                
              <div class="whole pad-bottom double">
           	   	<p class="info message"> User can save multiple Career details.</p>
           	   
           	   </div>
           	
          	<div class="whole">
          			<form:hidden path="objRegistrationForm.numUserId" value="<%=userId %>"></form:hidden>
          			<form:hidden path="numCareerId" id="careerId"></form:hidden>
          		</div> 
                 
        <%-- <div class="whole"><!--first row-->
<div class="one fourth"><form:label path="strPostName" for="strPostName" class="pull-left">Post Held<font color="red">*</font></form:label></div>
<div class="three fourth"> 
			<form:input path="strPostName" id="postName" placeholder="Post Name"></form:input></div>		
</div>

<div class="whole">
<div class="one fourth"><form:label path="strEmployerName" for="strEmployerName" class="pull-left">Employer Name<font color="red">*</font></form:label></div>
<div class="three fourth"> 
	<form:input path="strEmployerName" id="EmployerName" placeholder="Employer Name"></form:input></div>
</div>
 --%>




                 
      <div class="whole"><!--second row-->
<div class="one fourth"><form:label path="strPostName" for="strPostName" class="pull-left">Post Held<font color="red">*</font></form:label></div>

<div class="three fourth"> 
			
			<div class="four eleventh">
			<form:input path="strPostName" id="postName" placeholder="Post Name"></form:input></div>		
</div>


<div class="whole"><!--third row-->
<div class="one fourth"><form:label path="dtPeriodFrom" for="startDate" class="pull-left">Period From<font color="red">*</font></form:label></div>
<div class="three fourth"> 
			
			<div class="four eleventh">
			 <form:input path="dtPeriodFrom" id="startDate" placeholder="dd month,yyyy"></form:input></div>
			<div class=" pad-left two eleventh">
			<form:label path="dtPeriodTo" for="endDate" class="pull-left">Period To<font color="red">*</font></form:label></div>
			<div class="five eleventh">
			<form:input path="dtPeriodTo" id="endDate" placeholder="dd month,yyyy"></form:input></div>
</div>


</div>






      <div class="whole"><!--second row-->
<div class="one fourth"><form:label path="strEmployerName" for="strEmployerName" class="pull-left">Employer Name<font color="red">*</font></form:label></div>

<div class="three fourth"> 
			
			<div class="four eleventh">
			<form:input path="strEmployerName" id="employerName" placeholder="Employer Name"></form:input></div>		
			<div class="pad-left two eleventh">
			<form:label path="strAddress" for="address" class="pull-left">Address (1500 Characters)</form:label></div>
			<div class="five eleventh">
			<form:textarea path="strAddress"  id="address" name="strAddress" placeholder="Address"></form:textarea></div>

</div>


</div>







      <div class="whole"><!--fourth row-->
<div class="one fourth"><form:label path="strJobType" for="strJobType" class="pull-left">Job Type<font color="red">*</font></form:label></div>
<div class="three fourth"> 
			

			<div class="pad-left">
			</div>
			<div class="five eleventh">
			<form:select path="strJobType" id="JobType" style="width:90%" class="chzn-select">
			<form:option value="0">[Select Job Type]</form:option>
			<form:option value="Government">Government</form:option>
			<form:option value="Private">Private</form:option>
			<%-- <form:option value="Submitted">Submitted</form:option> --%>
			</form:select></div>



</div>

</div>













      <div class="whole"><!--fourth row-->
<div class="one fourth"><form:label path="strJobCategory" for="strJobCategory" class="pull-left">Job Category<font color="red">*</font></form:label></div>
<div class="three fourth"> 
			

			<div class="pad-left">
			</div>
			<div class="five eleventh">
			<form:select path="strJobCategory" id="JobCategory" style="width:90%" class="chzn-select">
			<form:option value="0">[Select Job Category]</form:option>
			<form:option value="Temporary">Temporary</form:option>
			<form:option value="Regular">Regular</form:option>
			<%-- <form:option value="Submitted">Submitted</form:option> --%>
			</form:select></div>



</div>

</div>













                
      <div class="whole"><!--second row-->
<div class="one fourth"><form:label path="strPayGrade" for="payGrade" class="pull-left">Pay Grade</form:label></div>
<div class="three fourth"> 
			
			<div class="four eleventh">
			<form:input path="strPayGrade" maxlength="250" id="payGrade" placeholder="Pay Grade"></form:input></div>
			<div class="pad-left two eleventh">
			<form:label path="strLastSalaryDrawn" for="salaryDrawn" class="pull-left">Salary Drawn(Last)<font color="red">*</font></form:label></div>
			<div class="five eleventh">
			<form:input path="strLastSalaryDrawn" id="salaryDrawn" placeholder="Salary Drawn"></form:input></div>
</div>


</div> <!-- end of second row-->
       
<!-- end of third row--> 





   <div class="whole"><!--second row-->
<div class="one fourth"><form:label path="strDutyNature" for="strDutyNature" class="pull-left">Nature Of Duty<font color="red">*</font></form:label></div>

<div class="three fourth"> 
			
			<div class="four eleventh">
			<form:input path="strDutyNature" id="duty" placeholder="Nature Of Duty"></form:input></div>		
</div>











  <div class="whole"><!--fifth row-->
			<div class="one fourth">
			<form:label path="strSpecialRemarks" for="strSpecialRemarks" class="pull-left">Special Remarks(1500 Characters)</form:label></div>
			<div class="three fourth">
			<form:textarea path="strSpecialRemarks"  id="remarks" name="Remarks" placeholder="Special Remarks"></form:textarea></div>
</div>

 
           
      <br/><br/>
		<div class="align-center">
		<input type="submit" name="Save" value="Save" id="Save" title="<%=saveTooltip %>" class="blue gap-right save_update tooltip button-tooltip"><input type="reset" value="Reset" class="blue gap-right" onclick="setValues()">&nbsp;<input name="Next" title="<%=nextTooltip %>" type="button" value="Next" onclick="javascript: gonext()" class="blue gap-right tooltip button-tooltip">
       	</div>
		<fieldset>
      <legend class="info">
        Career Details
      </legend>
       <div class="whole">
	 <div class="one half"> 
	 	<div class="one sixth"> Search:</div> 
		<div class="five sixth"> <input id="filter" type="text" /></div>
	</div>
	<div class="one half">
		<div class="two sixth"> </div>
		<div class="four sixth"> <input type="button" name="Delete" value="Delete" id="Delete" class="blue pull-right tooltip button-tooltip" title="<%=deleteTooltip %>"></input></div>
	</div>
      	<table class="footable blue" data-filter="#filter" data-page-size="5"  id="tab1">
		<thead>
          <tr>
          	<th class="nobreak" data-sort-initial="false"></th>
            <th class="nobreak" data-class="expand" data-sort-initial="true">Post Held</th>
            
            <th class="nobreak" data-hide="phone">Employer Name</th>
            <th class="nobreak" data-hide="phone">Job Type</th>
            <th class="nobreak" data-hide="phone,tablet">Job Category</th>
            <th class="nobreak" data-hide="phone,tablet">Pay Grade</th>
            <th class="nobreak" data-hide="all">
Salary Drawn(Last)</th>
<th class="nobreak" data-hide="all">
Nature of Duty</th>
<th class="nobreak" data-hide="all">
Addreess</th>
<th class="nobreak" data-hide="all">
Remarks</th>
<th class="nobreak" data-hide="all">
Period From</th>
<th class="nobreak" data-hide="all">
Period To</th>
<th class="nobreak" data-hide="all">
</th>
            <th class="nobreak"  class="width7">
            </th>
          </tr>
		</thead>
		<tbody>
		<c:forEach items="${CareerList}" var="listCareer">
          <tr>
          	 <td><form:checkbox path="arrNumCarrerId" class="CheckBox" name="CheckBox" value="${listCareer.numCareerId}"></form:checkbox><span class="hide"><c:out value="${listProject.numProjectId}"></c:out></span></td>
            <td><c:out value="${listCareer.strPostName}"></c:out></td>
			<td class="nobreak"><c:out value="${listCareer.strEmployerName}"></c:out></td>
			<td class="nobreak"><c:out value="${listCareer.strJobType}"></c:out></td>
			<td class="nobreak"><c:out value="${listCareer.strJobCategory}"></c:out></td>
			<td><c:out value="${listCareer.strPayGrade}"></c:out></td>
			<td><c:out value="${listCareer.strLastSalaryDrawn}"></c:out></td>
     			<td><c:out value="${listCareer.strDutyNature}"></c:out></td>
          			<td><c:out value="${listCareer.strAddress}"></c:out></td>
          			<td><c:out value="${listCareer.strSpecialRemarks}"></c:out></td>
          			<td><c:out value="${listCareer.startDate}"></c:out></td>
          			<td><c:out value="${listCareer.enDate}"></c:out></td>
               			<td><span class="hide"><c:out value="${listCareer.numCareerId}"></c:out></span></td>
     
      
  <td>
  <a href="#" class="no-line">
    <i class="icon-edit asphalt tooltip" title="Edit" id="Edit">
    </i>
  </a>
 </td>
    </tr>
    </c:forEach>
  </tbody>
  <tfoot class="footable-pagination">
        <tr>
          <td colspan="10"><ul id="pagination" class="footable-nav" /></td>
        </tr>
      </tfoot>
</table>

   
</div>
 </fieldset>

  
			
		
	
</div><!--end of row-->
</form:form>


</div>
<!-- end of grey border-->
</section>
</article>

</div>



<script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/charCount.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		//custom usage
		$("#summary").charCount({
			allowed: 1500,		
			warning: 10,
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
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>
  
    
<script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.easyui.js"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/ValidationFunctions.js"  type="text/javascript"></script>

<script>

       $(function() {
            
       
       var $datepicker_start_input = $("#startDate").pickadate({
    		  selectYears: true,
        	    selectMonths: true,
        	    selectYears: 100,
        	    weekdaysShort: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
        	    max:true,
    	     hiddenSuffix: 'date_start_submit'
    	     
    	    
    	 });
    	 from_picker = $datepicker_start_input.pickadate('picker');

    	 var $datepicker_end_input = $("#endDate").pickadate({
    		    selectYears: true,
        	    selectMonths: true,
        	    selectYears: 100,
        	    weekdaysShort: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
        	   
    	     hiddenSuffix: 'date_end_submit',
    	 });
    	 
    	 to_picker = $datepicker_end_input.pickadate('picker');

    	 from_picker.on('open', function(){

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
       });
       

</script>
<script>
$('#postName').validatebox({
    required: true,
    validType: ['AlphaNumericWithSpecial','maxLength[200]']
});

$('#employerName').validatebox({
    required: true,
    validType: ['AlphaNumeric','maxLength[100]']
});
$('#amount').validatebox({
    required: true,
    validType: ['Numeric', 'maxLength[11]']
});
$('#startDate').validatebox({
    required: true,
   
});
$('#endDate').validatebox({
    required: true,
   
});
$('#JobType').validatebox({
    required: true,
   
});
$('#JobCategory').validatebox({
    required: true,
   
});
$('#address').validatebox({
    required: true,
   
});


$('#salaryDrawn').validatebox({
    required: true,
    validType: ['AlphaNumeric','maxLength[100]']
});

$('#remarks').validatebox({
	required:false,
    validType: ['maxLength[200]']
});

$('#duty').validatebox({
	required:true,
    validType: ['AlphaNumericWithSpecial']
});

</script>
<script type="text/javascript">

$(document).on('click','#Save',function(e){
	
	
	
	
	if($('#frm').form('validate') == false){
	    
	    	return false;
	    }
	    else
	    	{
		    	if($('#status').val() == 0)
		    	{
		    		alert("Please enter project status.");
		    		return false;
		    	}
		    	else{
		    		return true;
		    	}
	    	}
    	
	
 
}); 	

	function submit_form()
	{
	document.getElementById("frm").submit();
	}

	
	
	
	
</script>

<script>
$(document).on('click','#Delete',function(e)
		{
	  var chkArray = [];
	     
	    $(".CheckBox:checked").each(function() {
	        chkArray.push($(this).val());
	    });
	     
	     
	    var selected;
	    selected = chkArray.join(',') + ","; 
	     
	    if(selected.length > 1)
	    {
	    	//alert("in if");
	    	submit_form_delete();
		
	    }else
	    {
	        alert("Please at least one of the checkbox");
	}
	
		});
				
function submit_form_delete()
		{
			document.frm.action = "/DLI/deleteCareer";
			document.getElementById("frm").submit();
			//alert("after submit");
		}
		
</script>



<script src="/DLI/resources/app_srv/msip/gl/jssrc/pickadate/picker.js"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/pickadate/picker.date.js"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/pickadate/picker.time.js"></script>
   <script src="/DLI/resources/app_srv/msip/gl/jssrc/pickadate/legacy.js"></script>
   <script src="/DLI/resources/app_srv/msip/gl/jssrc/pickadate/main.js"></script>
</body>
</html>
