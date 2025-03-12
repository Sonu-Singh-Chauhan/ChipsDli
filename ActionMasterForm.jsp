<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import=" java.io.File,java.util.*"%>
 <%@ page isELIgnored="false" %>


  
  
<!-- CSS and JS for responsive tables -->

 <link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css" rel="stylesheet" type="text/css" />
 <link href="/DLI/resources/app_srv/msip/gl/theme/footable.sortable-0.1.css" rel="stylesheet" type="text/css" />
 <link href="/DLI/resources/app_srv/msip/gl/theme/footable.paginate.css" rel="stylesheet" type="text/css" />
  
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/data-generator.js" type="text/javascript"></script>
 
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sortable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate.js" type="text/javascript"></script>
 
 <style>
.error {
    color: #E94646;
    font-style: italic;
    font-size: 70%;
   
}
</style>
 
  <script type="text/javascript">
    $(function() {
      $('table').footable();
    });
  </script>
  
         <script>
$(document).ready( function() {
        $('#userinfo-message').delay(5000).fadeOut();
      });
               
</script>

 <script>
	$(document).on('click','#Edit',function(e){
		 $("#Save").prop("style").display="none";
    	 $("#Modify").show();
	var resultArray1 = $(this).closest('tr').find('td').map( function()
			{
			return $(this).text();
		}).get();
	
	var checkID = $(this).closest('tr').find('input[type=checkbox]').map( function()
			{
			return $(this).val();
		}).get();
	$('#numActionId').val(checkID);
	$('#strActionName').val($.trim(resultArray1[2]));
	$('#numProcessId').val(resultArray1[1]);
  	$('#numProcessId').trigger("liszt:updated");
  	var status=resultArray1[4];
  	if(status=="Active")
	{
		
		$("#toggle-on").prop("checked", true);
	}

	else if(status=='Inactive')
		{
		
		$("#toggle-off").prop("checked", true);

		}

	
	
	});
	
	function changeValues()
	{
		document.getElementById("strActionName").value="";
		document.getElementById("numProcessId").value=0;
	}
	
</script>
  

  
   <link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
     <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">
   
  </head>
  <body onload="changeValues()">
<form:form name="actionForm" id="actionForm" method="post" modelAttribute="actionMasterForm">
           <c:if test="${Message != null && Message != ''}">
       				           <div id="userinfo-message"><p class="msg msgbg">${Message}</p></div> 
        </c:if>	
        <article class="row">
        
        <section class="whole">
          <div class="align-center">
            <h4 class="asphalt pad-top">
                Action Master
            </h4>
          </div>
	<input type="hidden" id="numActionId" value="0" name="numActionId"/>	   
              <div class="row">
    
          <div class="grey_border rounded padded gapped">
           
               
              <div class="whole"><!--first row-->
              

<div class="whole pad-bottom">
<div class="one half centered">
		 <div class="two sixth">
<form:label path="numProcessId">Process Name</form:label>
		</div>
		<div class="four sixth pad-top-half">

<form:select path="numProcessId" id="numProcessId"  class="chzn-select whole">
<form:option value="0">Select Process</form:option>
<c:forEach items="${processList}" var="l">
<form:option value="${l.numProcessId}">${l.strProcessName}</form:option>
</c:forEach>
</form:select>
<form:errors path="numProcessId" cssClass="error" />
		</div> 
		
		</div><!--  end of one half div -->
</div>

<div class="whole pad-bottom">
<div class="one half centered">
<div class="two sixth">
<form:label path="strActionName">Action Name</form:label>
		</div>
		<div class="four sixth">
 <form:input path="strActionName" id="strActionName"/>
 <form:errors path="strActionName" cssClass="error" />
 		</div>
</div> <!--  end of one half div -->
</div>

	

</div> <!-- end of whole div-->
 
 <div class="whole">
								<!-- sixth row-->
								<div class="one half centered">
									<div class="two sixth">

										<label> Status: </label>
									</div>
									
										<div class="two fourth pad-top">
											
												<form:radiobutton path="toggleA" value="false" id="toggle-on"
													 cssClass="toggle toggle2 toggle-left inline" />
												<form:label path="toggleA" for="toggle-on"
													class="btn inline zero round">
													<span class="pad-left">Active</span>
												</form:label>
												<form:radiobutton path="toggleA" value="true"
													id="toggle-off" cssClass="toggle toggle2 toggle-right" />

												<form:label path="toggleA" for="toggle-off"
													 class="btn round inline zero">
													<span class="pad-right pad-left">Inactive</span>
												</form:label>

											</div>
										


									</div>
								</div>
		    <div class="whole pad-top">
		<div class="align-center">
		
		 <input type="button" value="Modify" id="Modify" name="Modify" class="blue gap-right" style="display:none"/>
	      <input type="button" value="Save" id="Save" name="Save" class="blue gap-right"/>
		<input type="reset" value="Reset" class="blue" id="reset" />
		</div>
      </div>
 	 <fieldset>
    <legend class="info">
      Action Details
    </legend>
    <div class="whole">
	 <div class="one half"> 
	 <div class="one sixth"> Search:</div> <div class="five sixth"> <input id="filter" type="text" /></div>
	</div><div class="one half"><div class="two sixth"></div><div class="four sixth"> <input type="button" value="Delete" id="Delete" class="pull-right blue" name="Delete"></input></div></div>

      <table class="footable blue" data-filter="#filter" data-page-size="20"  id="tab1">
		<thead>
          <tr>
		  <th data-sort-initial="false">
          <input type="checkbox">
       </th>
       
        <th data-hide="all">
            </th>
            
            <th data-class="expand" data-sort-initial="true">
         Action Name
            </th>
			
			
			<th data-hide="phone">
              Process Name
            </th>
               <th>Status</th>
		    <th>
		    </th>   
		     
          </tr>
		</thead>
	 	 <tbody>
		     <c:forEach items="${actionList}" var="l">  
          <tr>

           <td><input type="checkbox" class="checkbox" id="checkBox" name="checkBox" value="${l.numActionId}"/></td>
           <td><span class="hide"><c:out value="${l.numProcessId}"></c:out></span></td>
		   <td>${l.strActionName}</td>
           <td>${l.strProcessName}</td>
             <c:choose>
										    	<c:when test="${l.toggleA==false}">
										     			 <td>Active</td>
										   			 </c:when>
										   		 <c:when test="${l.toggleA==true}">
										      			 <td>Inactive</td>
										    		</c:when>
										   
													</c:choose>
           
           <td>
   <div id="Edit">
  <a href="#" class="no-line">
    <i class="icon-edit asphalt tooltip" title="Edit">
    </i>
  </a></div>
 
</td>

    </tr>
    </c:forEach>
   
  </tbody> 
  <tfoot class="footable-pagination">
        <tr>
          <td colspan="7"><ul id="pagination" class="footable-nav"></ul></td>
        </tr>
      </tfoot>
</table>
</div> <!--end of div before table-->
</fieldset> 
  
			
</div>
<!-- end of grey border-->
</div><!-- end of row div-->

</section>
</article>
</form:form>

<!-- scripts-->

<script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.easyui.js"></script>
<script src="/DLI/resources/app_srv/msip/gl/jssrc/ValidationFunctions.js" type="text/javascript"></script>

<script>
$('#strActionName').validatebox({
    required: true,
    validType: ['minLength[1]','maxLength[60]']
});



$('#Save').click(function(){
	var istoggle="";
  	 if($("#toggle-on").prop("checked")==true)
  		 {
  		 
  		 istoggle=false;
  		 }
  	 else if($("#toggle-off").prop("checked")==true)
  	 {
  	  istoggle=true;

  	 }
  	 $('#toggleA').val(istoggle);
	var result= $('#numProcessId').val();
	if(result==0)
		{
	    alert("Please select a process");
		}
    if($('#actionForm').form('validate') && (result!=0)){
    submit_form();
    }  
});

$('#Modify').click(function(){
	var istoggle="";
  	 if($("#toggle-on").prop("checked")==true)
  		 {
  		 
  		 istoggle=false;
  		 }
  	 else if($("#toggle-off").prop("checked")==true)
  	 {
  	  istoggle=true;

  	 }
  	 $('#toggleA').val(istoggle);
	var result= $('#numProcessId').val();
	if(result==0)
		{
	    alert("Please select a process");
		}
    if($('#actionForm').form('validate') && (result!=0)){
    submit_form_update();
    }  
});

$('#Delete').click(function(){
    var chkArray = [];
     
    $(".checkbox:checked").each(function() {
        chkArray.push($(this).val());
    });
    var selected;
    selected = chkArray.join(',') + ","; 
    
		    	  if(selected.length >= 1){
				  	  if(confirm("Are you sure you want to delete the record"))
					  {
				  		submit_form_delete();
					  }
		    
    }else{
        alert("Please select at least one action to delete");  
}
 
});

function submit_form()
{
    document.actionForm.action="/DLI/saveAction";
    document.getElementById("actionForm").submit();
}

function submit_form_update()
{
document.actionForm.action = "/DLI/modifyAction";
document.getElementById("actionForm").submit();
}

function submit_form_delete()
{
document.actionForm.action = "/DLI/deleteAction";
document.getElementById("actionForm").submit();
}
</script>

<script src="/DLI/resources/app_srv/msip/gl/jssrc/chosen.jquery.js" type="text/javascript"></script>
<script type="text/javascript">
var config = {
'.chzn-select' : {},
'.chzn-select-deselect' : {allow_single_deselect:true},
'.chzn-select-no-single' : {disable_search_threshold:10},
'.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
'.chzn-select-width' : {width:"95%"}
}

for (var selector in config) {
$(selector).chosen(config[selector]);
}
</script>
<script language="javascript" type="text/javascript">

    //this code handles the F5/Ctrl+F5/Ctrl+R
    document.onkeydown = checkKeycode;
   
    function checkKeycode(e) {
        var keycode='';
        if (window.event)
            keycode = window.event.keyCode;
        else if (e)
            keycode = e.which;
        //alert("keycode = "+keycode);
        // Mozilla firefox
        if (navigator.userAgent.indexOf('Firefox') != -1){
            if (keycode == 116 ||(e.ctrlKey && keycode == 82)) {
                if (e.preventDefault)
                {
                    e.preventDefault();
                    e.stopPropagation();
                }
            }
        } 
        // IE
        else  {
            if (keycode == 116 || (window.event.ctrlKey && keycode == 82)) {
                window.event.returnValue = false;
                window.event.keyCode = 0;
                window.status = "Refresh is disabled";
            }
        }
    }
</script>
</body>
</html>