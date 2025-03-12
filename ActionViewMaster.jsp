<%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



    
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/jquery1103-ui.js"></script>
  

<link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css" rel="stylesheet" type="text/css" />
   <link href="/DLI/resources/app_srv/msip/gl/theme/footable.sortable-0.1.css" rel="stylesheet" type="text/css" />
  <link href="/DLI/resources/app_srv/msip/gl/theme/footable.paginate.css" rel="stylesheet" type="text/css" />
  
  
  
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/data-generator.js" type="text/javascript"></script>
 
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sortable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate.js" type="text/javascript"></script>
  <script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/plugins/jquery.magnific-popup.js"></script>
  

	 
	 <link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
	  <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css" type="text/css" />
	 
	 <script type="text/javascript">
     $(function() {
       $('table').footable();
     });
     
	</script>
	
	<script>
  $(document).ready( function() {
          $('#userinfo-message').delay(5000).fadeOut();
          
         
        });
  
  function updateTemp(tempval) {

	  $('#numActionIdTemp').val(tempval);
	  
	}
          

  
  </script>
  
  <script>

  $(document).on('click','#Edit',function(e)
			{
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
		
		$('#numActionViewId').val(checkID);
				$('#numActionId').val($('#numActionId option').filter(function ()
				 { 
			 return $(this).html() == $.trim(resultArray1[1]); 
			 }).val());
				
				
	  	$('#numActionId').trigger("liszt:updated");
	  	$('#numActionId').prop('disabled', true).trigger("liszt:updated");

	  	$('#numActionIdTemp').val($.trim(checkID));
		$('#strActionName').val($.trim(resultArray1[2]));
		$('#strLink').val($.trim(resultArray1[3]));
		$('#strLinkName').val($.trim(resultArray1[4]));

		var status = $.trim(resultArray1[5]);
		
		if(status=="Yes")
		{
			
			$('#toggle-on').prop("checked", true);
		}
	
		else if(status=="No")
			{
			
			$('#toggle-off').prop("checked", true);

			}
		$('#strRemarks').val($.trim(resultArray1[6]));
		
		var status1 = $.trim(resultArray1[7]);
		if(status1=="Yes")
		{
			
			$("#toggle-on1").prop("checked", true);
		}
	
		else if(status1=="No")
			{
			
			$("#toggle-off1").prop("checked", true);

			}
		
		$('#param1').val($.trim(resultArray1[8]));
		
		var status2 = $.trim(resultArray1[9]);
		if(status1=="Active")
		{
			
			$("#toggle-on3").prop("checked", true);
		}
	
		else if(status1=="Inactive")
			{
			
			$("#toggle-off3").prop("checked", true);

			}
		
			
	});
  </script>
  <script>
  function changeValues()
  {
  	
		$('.chzn-select').val('').trigger('liszt:updated');
 
  	$('#strActionName').val("");
  	$('#strLink').val("");
  	$('#strLinkName').val("");
  	$('#strRemarks').val("");
  	$('#param1').val("");
  	
 
  }

	</script>

  <body onload="changeValues()">
  
  <form:form method="post" id="actionViewModel" name="actionViewModel" modelAttribute="actionViewModel">

 <form:input type="hidden" path="numActionViewId" name="numActionViewId" id="numActionViewId"></form:input>
 
<div id="userinfo-message">
  
 <c:set var="message" scope="session" value="${Message}"/>
            		<c:choose>
            			<c:when test="${message == 'Saved' }"><p class="info message  pad-bottom">Added successfully.</p></c:when>
            			<c:when test="${message == 'Deleted' }"><p class="info message  pad-bottom">Deleted successfully.</p></c:when>
            			<c:when test="${message == 'Modified' }"><p class="info message  pad-bottom">Modified successfully.</p></c:when>
            			<c:when test="${message == 'Error' }"><p class="error message  pad-bottom">Sorry..an error occured.</p></c:when>
            			<c:when test="${message == 'Information already exists' }"><p class="error message  pad-bottom">Information already exists.</p></c:when>
            			<c:when test="${message == 'Please select at least one Action to delete.' }"><p class="error message  pad-bottom">Please select at least one Action to delete.</p></c:when>
            	</c:choose>
            	</div>   
        <article class="row">
        
        <section class="whole">
          <div class="align-center">
            <h4 class="asphalt pad-top">
                Action View Master
            </h4>
          </div>
          
           <div class="row">
    
          <div class="grey_border rounded padded gapped">
           
               
              <div class="whole"><!--first row-->
              
				<div class="whole">
					<div class="one half centered">
						<div class="five sixth pad-top-half">
			
						</div> 
		
					</div><!--  end of one half div -->
				</div>
				
				<div class="whole">
					<div class="one half centered">
						<div class="two eleventh">
							<form:label path="numActionId">Action</form:label>
						</div>
						<div class="nine eleventh">
  								<form:select path="numActionId" id="numActionId" onchange="updateTemp(this.value)"   class="chzn-select whole" >
  								<form:option value="0">Select Action Name</form:option>
								<c:forEach items="${actionlist}" var="l">
									<form:option value="${l.action.numActionId}">${l.action.strActionName}</form:option>
									
								</c:forEach>
								
								</form:select>	
								 <form:hidden path="numActionIdTemp" id="numActionIdTemp"/>
								<form:errors path="numActionIdTemp" cssClass="error" />	
						</div>
					</div> <!--  end of one half div -->
				</div>
				
				
	  		<div class="whole">
			 	 	 <div class="one half centered">
							<div class="two eleventh">
								<form:label path="strActionName">Action Name</form:label>
							</div> 

							<div class="nine eleventh">
    							
								<form:input path="strActionName" id="strActionName"></form:input>
								<form:errors path="strActionName" cssClass="error" />
							</div>

					</div>
				</div>
		 		
					
				<div class="whole"><!--first row-->
			 		 <div class="one half centered">
							<div class="two eleventh">
								<form:label path="strLink">Link</form:label>
							</div> 

							<div class="nine eleventh">
    							
								<form:input path="strLink" id="strLink"></form:input>
								<form:errors path="strLink" cssClass="error" />
							</div>

					</div>
				</div>
				
				<div class="whole"><!--first row-->
			 		 <div class="one half centered">
							<div class="two eleventh">
								<form:label path="strLinkName">Link Name</form:label>
							</div> 

							<div class="nine eleventh">
    							
								<form:input path="strLinkName" id="strLinkName"></form:input>
								<form:errors path="strLinkName" cssClass="error" />
							</div>

					</div>
				</div>
				
				<div class="whole pad-top">
								<!-- sixth row-->
								<div class="one half centered">
									<div class="two eleventh">

										<label> View Link </label>
									</div>
									
										<div class="nine eleventh">
											

												<form:radiobutton path="toggleA" value="false" id="toggle-on"
													 cssClass="toggle toggle2 toggle-left inline" />
												<form:label path="toggleA" for="toggle-on"
													class="btn inline zero round">
													<span class="pad-left"> Yes </span>
												</form:label>
												<form:radiobutton path="toggleA" value="true"
													id="toggle-off" cssClass="toggle toggle2 toggle-right" />

												<form:label path="toggleA" for="toggle-off"
													 class="btn round inline zero">
													<span class="pad-right pad-left"> No </span>
												</form:label>


											</div>
										


									</div>
								</div>
						  
				<div class="whole"><!--first row-->
			 		 <div class="one half centered">
							<div class="two eleventh">
								<form:label path="strRemarks">Remarks</form:label>
							</div> 

							<div class="nine eleventh">
    							
								<form:input path="strRemarks" id="strRemarks"></form:input>
								<form:errors path="strRemarks" cssClass="error" />
							</div>

					</div>
					
				</div>
				
				<div class="whole pad-top">
								<!-- sixth row-->
								<div class="one half centered">
									<div class="two eleventh">

										<label> Show Remarks </label>
									</div>
									
										<div class="nine eleventh">
											

												<form:radiobutton path="toggleB" value="false" id="toggle-on1"
													 cssClass="toggle toggle2 toggle-left inline" />
												<form:label path="toggleB" for="toggle-on1"
													class="btn inline zero round">
													<span class="pad-left"> Yes </span>
												</form:label>
												<form:radiobutton path="toggleB" value="true"
													id="toggle-off1" cssClass="toggle toggle2 toggle-right" />

												<form:label path="toggleB" for="toggle-off1"
													 class="btn round inline zero">
													<span class="pad-right pad-left"> No </span>
												</form:label>


											</div>
										


									</div>
								</div>
						  
				
				
				
				<div class="whole"><!--first row-->
			 		 <div class="one half centered">
							<div class="two eleventh">
								<form:label path="param1">Parameter</form:label>
							</div> 

							<div class="nine eleventh">
    							
								<form:input path="param1" id="param1"></form:input>
								<form:errors path="param1" cssClass="error" />
							</div>

					</div>
					
				</div>
				
				<div class="whole pad-top">
								<!-- sixth row-->
								<div class="one half centered">
									<div class="two eleventh">

										<label> Status </label>
									</div>
									
										<div class="nine eleventh">
											

												<form:radiobutton path="toggleS" value="false" id="toggle-on3"
													 cssClass="toggle toggle2 toggle-left inline" />
												<form:label path="toggleS" for="toggle-on3"
													class="btn inline zero round">
													<span class="pad-left"> Active </span>
												</form:label>
												<form:radiobutton path="toggleS" value="true"
													id="toggle-off3" cssClass="toggle toggle2 toggle-right" />

												<form:label path="toggleS" for="toggle-off3"
													 class="btn round inline zero">
													<span class="pad-right pad-left"> Inactive </span>
												</form:label>


											</div>
										


									</div>
								</div>
						  
						  
				</div>
				 <div class="whole pad-top">
					<div class="align-center">
					  <input type="button" value="Modify" id="Modify" name="Modify" class="blue gap-right" style="display:none"/>
						<input type="button" id="Save" name="Save" value="Save" class="blue gap-right"/>
						<input type="reset" value="Reset" class="blue" onclick="changeValues()" id="reset" />
		
					</div>
     		 </div>
				
	<fieldset>
    	<legend class="info" align="left">
     		Action View Details
    	</legend>
    <div class="whole">
	 	<div class="one half"> 
	 		<div class="one sixth"> Search:</div> <div class="five sixth"> <input id="filter" type="text" /></div>
		</div>
		<div class="one half"><div class="two sixth"></div><div class="four sixth"> <input type="button" id="Delete" value="Delete" name="Delete" class="pull-right blue"></input></div></div>
      	<table class="footable blue demo" data-filter="#filter" data-page-size="10"  id="tab1">
		<thead>
          <tr>
		  <th data-sort-initial="false">
		
          <input type="checkbox">
       </th>
           
		  		
		  <th data-class="expand" data-sort-initial="true">
              Action
            </th>
            
            <th data-hide="phone, tablet">
             Action Name
            </th>
            
            <th data-hide="phone, tablet">
             Link
            </th>
             <th data-hide="phone, tablet">
             Link Name
            </th>
            <th data-hide="phone, tablet">
            View Link
            </th>
             <th data-hide="phone, tablet">
              Remarks
            </th>
            <th data-hide="phone, tablet">
            Show Remarks
            </th>
             <th data-hide="phone, tablet">
              Parameter
            </th>
            <th data-hide="phone, tablet">
              Status
            </th>
             
		    <th>
            </th>
          </tr>
		</thead>
		<tbody>
			<c:forEach items="${datalist}" var="l">  
          <tr>
		   <td><input type="checkbox" id="actionViewCheckbox" name="actionViewCheckbox" class="CheckBox" value="${l.numActionViewId}"/></td>
        <td>${l.action.strActionName}</td>
        <td>${l.strActionName}</td>
        <td>${l.strLink}</td>
        <td>${l.strLinkName}</td>
        <c:choose>
        <c:when test="${l.toggleA ==false}">
     			 <td>  Yes </td>
   			 </c:when>
   		 <c:when test="${l.toggleA==true}">
      			 <td> No </td>
    		</c:when>
   
			</c:choose>
        <td>${l.strRemarks}</td>
        <c:choose>
    	<c:when test="${l.toggleB ==false}">
     			 <td>  Yes</td>
   			 </c:when>
   		 <c:when test="${l.toggleB==true}">
      			 <td> No </td>
    		</c:when>
   
			</c:choose>
        
        
        <td>${l.param1}</td>
		 <c:choose>
    	<c:when test="${l.toggleS ==false}">
     			 <td>  Active </td>
   			 </c:when>
   		 <c:when test="${l.toggleS==true}">
      			 <td> Inactive </td>
    		</c:when>
   
			</c:choose>
        
   		<td>
   			<div id="Edit">
  				<a href="#" class="no-line">
   				 <i class="icon-edit asphalt tooltip" title="Edit">
    			</i>
 				 </a>
 			</div>
 
		</td>
    </tr>
    
    </c:forEach>
	</tbody>
    <tfoot class="footable-pagination">
        <tr>
          <td colspan="11"><ul id="pagination" class="footable-nav" ></ul></td>
        </tr>
      </tfoot>
</table>
</div> <!--end of div before table-->
</fieldset>
  
</div>
</div>	
			

</section>
</article>
</form:form>

</body>



<script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.easyui.js"></script>
   <script src="/DLI/resources/app_srv/msip/gl/jssrc/ValidationFunctions.js" ></script>
<script>

$('#strActionName').validatebox({
    required: true,
    validType: ['minLength[1]','maxLength[255]']
});

$('#strLink').validatebox({
    required: true,
    validType: ['minLength[1]','maxLength[255]']
});

$('#strLinkName').validatebox({
    required: true,
    validType: ['minLength[1]','maxLength[255]']
});

$('#strRemarks').validatebox({
    required: true,
    validType: ['minLength[1]','maxLength[255]']
});

$('#param1').validatebox({
	required:true,
	 validType:['Length[1]','maxLength[255]']
});

</script>

<script>
	
    
			    $('#Save').click(function(){
				//alert("save");
				var result= $('#numActionId').val();
				var result1= $('#strActionName').val();
				var result2= $('#strLink').val();
				var result3= $('#strLinkName').val();
				
				var result4= $('#strRemarks').val();
				var result5= $('#param1').val();
				 var istoggle="";
				 var istoggle1="";
				 var istoggle11="";
				 
				 if($("#toggle-on").prop("checked")==true)
					 {
					 
						 istoggle=false;
					 }
				 else if($("#toggle-off").prop("checked")==true)
				 	{
				  		istoggle=true;

				 	}
				 $('#toggleA').val(istoggle);
				
				

	 				//For remarks//
				 if($("#toggle-on1").prop("checked")==true)
				 {
				 
				 istoggle1=false;
				 }
			 	else if($("#toggle-off1").prop("checked")==true)
			 	{
			  		istoggle1=true;

			 	}
			 	$('#toggleB').val(istoggle1);

				//For Status //
				
				 if($("#toggle-on3").prop("checked")==true)
				 {
				 
				 istoggle11=false;
				 }
			 	else if($("#toggle-off3").prop("checked")==true)
			 	{
			  		istoggle11=true;

			 	}
			 	$('#toggleS').val(istoggle11);
			 	
					if(result==0)
					{
					   alert("Please select a Action");
					}
		
					else if(result1==0)
					{
					   alert("Please enter action name");
					}
					else if(result2==0)
						{
						   alert("Please enter link");
						}
					else if(result3==0)
						{
						   alert("Please enter link name");

						}
					else if(result4==0)
						{
							alert("Please enter remarks");
							
						}
					else if(result5==0)
						{
							alert("Please enter parameter")
						}
					if($('#actionViewModel').form('validate') && (result!=0) && (result1!=0) && (result2!=0) && (result3!=0) && (result4!=0) && (result5!=0)){
				    	
						submit_form();
				
				    }  
				});

			    $('#Delete').click(function(){
				    var chkArray = [];
				     
				    $(".CheckBox:checked").each(function() {
				        chkArray.push($(this).val());
				    });
				    
		     		    if(chkArray.length >= 1){
				        submit_form_delete();
				    }else{
				        alert("Please select at least one action to delete");  
				}
				 
			});

			    $('#Modify').click(function(){

			    	//alert("inside modify");
			    	var result= $('#numActionId').val();
					var result1= $('#strActionName').val();
					var result2= $('#strLink').val();
					var result3= $('#strLinkName').val();
					
					var result4= $('#strRemarks').val();
					var result5= $('#param1').val();
					 var istoggle="";
					 var istoggle1="";
					 var istoggle11="";					 
					 if($("#toggle-on").prop("checked")==true)
						 {
						 
							 istoggle=false;
						 }
					 else if($("#toggle-off").prop("checked")==true)
					 	{
					  		istoggle=true;

					 	}
					 $('#toggleA').val(istoggle);

		 				//For remarks//
					 if($("#toggle-on1").prop("checked")==true)
					 {
					 
					 istoggle1=false;
					 }
				 	else if($("#toggle-off1").prop("checked")==true)
				 	{
				  		istoggle1=true;

				 	}
				 	$('#toggleB').val(istoggle1);

				 	//For Status //
					
					 if($("#toggle-on3").prop("checked")==true)
					 {
					 
					 istoggle11=false;
					 }
				 	else if($("#toggle-off3").prop("checked")==true)
				 	{
				  		istoggle11=true;

				 	}
				 	$('#toggleS').val(istoggle11);
				 
						if(result==0)
						{
						   alert("Please select a Action");
						}
			
						else if(result1==0)
						{
						   alert("Please enter action name");
						}
						else if(result2==0)
							{
							   alert("Please enter link");
							}
						else if(result3==0)
							{
							   alert("Please enter link name");

							}
						else if(result4==0)
							{
								alert("Please enter remarks");
								
							}
						else if(result5==0)
							{
								alert("Please enter parameter")
							}
	
						if($('#actionViewModel').form('validate')  && (result!=0) && (result1!=0) && (result2!=0) && (result3!=0) && (result4!=0) && (result5!=0)){
					    	
			    				submit_form_update();
			            	}	

			            	
			    	 
			    });

			    function submit_form()
				{
					document.actionViewModel.action = "/DLI/saveActionView";
					document.getElementById("actionViewModel").submit();
				}

				function submit_form_delete()
				{
					document.actionViewModel.action = "/DLI/deleteActionViewPage";
					document.getElementById("actionViewModel").submit();
				}

				function submit_form_update()
				{
					document.actionViewModel.action = "/DLI/updateActionView";
					document.getElementById("actionViewModel").submit();
					
					}
</script>
<script src="/DLI/resources/app_srv/msip/gl/jssrc/chosen.jquery.js" type="text/javascript"></script>
<script src="/DLI/resources/app_srv/msip/gl/jssrc/ValidationFunctions.js" language="JavaScript" type="text/javascript"></script>

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
