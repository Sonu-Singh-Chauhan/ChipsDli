<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="in.cdacnoida.msips.gl.misc.ResourceBundleFile" %>
 <%@ page import=" java.io.File,java.util.*"%>
 <%@ page isELIgnored="false" %>
 <%! public String contextpath = ResourceBundleFile.getValueFromKey("CONTEXT_PATH");%>
  <html>
<!-- CSS anf JS for responsive tables -->

 <link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css" rel="stylesheet" type="text/css" />
 <link href="/DLI/resources/app_srv/msip/gl/theme/footable.sortable-0.1.css" rel="stylesheet" type="text/css" />
 <link href="/DLI/resources/app_srv/msip/gl/theme/footable.paginate.css" rel="stylesheet" type="text/css" />
  
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/data-generator.js" type="text/javascript"></script>
 
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sortable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate.js" type="text/javascript"></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
  
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/sweetalert.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/sweetalert.css"/>
  

	<script>
function getRoleDetails(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
  	 	$.ajax(
            {
                 type: "POST",
                 url: "/DLI/viewRolebycommitteType",
                 success: function(response) {
                	 $("#rolename").empty();
                	 $("#rolename").trigger("liszt:updated"); 
                	 
                	 for (var i = 0; i < response.length; ++i) 
                     {
                		$('#rolename').append($('<option/>').attr("value", response[i].numroleid).text(response[i].strRolename));
                         
                     }
                	 $("#rolename").trigger("liszt:updated");
			       },
  			                error: function(e){
  					        	alert('Error in getting Roles: ' + e);
  			                },
  			                complete:function()
  			                {
  			                	/* var actualroleID = $('#rolename').find(":selected").val(); */
  			                //	getselectedAction(actualroleID);
  			                	$('#rolename').sortSelect().chosen();
  			                	$("#rolename").trigger("liszt:updated");
  			                	
  			                	$('#actionID').sortSelect().chosen();
  			                	$("#actionID").trigger("liszt:updated");
  			                	
  			                }
  		                });	 
                   }
                   
$(document).on('change','#actionID',function(e){
		var actualroleID = $(this).find(":selected").val();
		if(rolename!=0)
			{
			 // alert("actionID::"+actualroleID);  
			  getselectedRoles(actualroleID);
			}
		
	});
	
function getselectedRoles(id){
  	var actionID= id;
  	//var committeTypeid=$('#committeetypename').val();
  	
  	//alert("committeTypeid::"+committeTypeid);
  	$.ajax(
            {
                 type: "POST",
                 url: "/DLI/getSelectedRoles",
                 data: "actionID="+actionID,
                 success: function(response) {
                		 
                	// alert("response::"+response);
                	 $("#rolename option").attr("selected",false);
                	 $("#rolename").trigger("liszt:updated");
                	 var selectedOptions = response.split(",");
                	 for(var i in selectedOptions) {
                	     var optionVal = selectedOptions[i];
                	      $("#rolename").find("option[value="+optionVal+"]").prop("selected","selected");
                	 }
                	 $("#rolename").trigger("liszt:updated");
                	
			       },
  			                error: function(e){
  					        	alert('Error in getting Roles: ' + e);
  			                }
  		                });	 
                   }

 
$(document).on('change','#rolename',function(evt,params){
	if(params.deselected!=null)
	 {
	 	//alert("removed:"+params.deselected);
	 	removeAction(params.deselected);
	 	
	 }
	 if(params.selected!=null)
	 {
		// alert("added:"+params.selected);
		 addAction(params.selected);
	 }

 
});

function removeAction(role_id){
	
	if(check(role_id,'r')==1)
	{
				var actionID=$('#actionID').val(); 
			 //	alert("actualroleID::::"+role_id+"//action_id:::"+actionID);  	
			  	$.ajax(
			            {
			                 type: "POST",
			                 url: "/DLI/removeAction",
			                 data: "actualroleID="+role_id+"&actionid="+actionID,
			                                 
			                 cache:false,	
			              	 beforeSend: function(){
			              			$('#drpdwn').hide();
			              	        $('#imageUnd').show();
			              	              	      
			              	    },
			              	    complete: function(){
			              	        $('#imageUnd').hide();
			              	      	$('#drpdwn').show();
			              	   },
			                 
			         			success: function(response) {
			                		 
			         				 swal({
			         				  title: "Success",
			                   		  text: "Role removed successfully",
			                   		  timer: 2000,
			                   		  showConfirmButton: false
			                   		}); 
			                	
						       },
			  			                error: function(e){
			  					        	alert('Error in removing Role: ' + e);
			  			                }
			  		                });	
	}
        }
function addAction(role_id){
	if(check(role_id,'a')==1)
		{
			  	var actionID=$('#actionID').val(); 
			  	//alert("actualroleID::::"+role_id+"//action_id:::"+actionID);  	
			  	$.ajax(
			            {
			                 type: "POST",
			                 url: "/DLI/addAction",
			                 data: "actualroleID="+role_id+"&actionid="+actionID,
			                 
			                 cache:false,	
			              	 beforeSend: function(){
			              		$('#drpdwn').hide();			              		 
			              	    $('#imageUnd').show();
			              	              	      
			              	    },
			              	    complete: function(){
			              	        $('#imageUnd').hide();
			              	      	$('#drpdwn').show();
			              	   },
			                 
			                 
			                 success: function(response) {
			                		 
			                	// alert("RESPONSE:"+response);
			                	  swal({
			                		  title: "Success",
			                		  text: "Role added successfully",
			                		  timer: 2000,
			                		  showConfirmButton: false
			                		}); 
			                		
			                	
						       },
			  			                error: function(e){
			  					        	alert('Error in Adding Role: ' + e);
			  			                }
			  		                });
			}
                   }
     
     
     function check(id,flag)
     {
   	 	var action=$('#actionID').val();
   	 	var FLAG=1;
   	 	//alert("schemeID::::"+schemeID+"_____committeeType::::"+committeeType+"_______role::::"+role);
   	 	
   	 	if(action==0||action==null || action==-1)
			{
   			swal({
		   	 	  title: "Message",
		   	 	  text: "Kindly select Action!",
		   	 	  html: true
		   	 	});
   			
   			var sel_id = id;
   			
   			
   			if(flag=='a')
   			{
   				$("#rolename option[value='"+id+"']").remove();
   				
   			}
   			if(flag=='r')
   			{
   				$("#rolename option[value='"+id+"']").add();
   			}	
   			$("#rolename").trigger("liszt:updated");
   			
   				
   		

			FLAG=0;
			}
    	 return FLAG;
     }
  
 
$.fn.sortSelect = function () {

    var mylist = $(this);
	var listitems = mylist.children('option').get();

    listitems.sort(function(a, b) {

       var compA = $(a).text().toUpperCase();
	   var compB = $(b).text().toUpperCase();
	   return (compA < compB) ? -1 : (compA > compB) ? 1 : 0;

    })

    $.each(listitems, function(idx, itm) { mylist.append(itm); });

    return $(this);

  }

</script>
				
   <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">
  
  </head>
  <body onload="getRoleDetails()">
 <form:form name="form"  id="form" method="post" action="createActionRole.do" modelAttribute="actionRoleForm">
 
 <form:input type="hidden" path="numId" name="numId" id="numId"></form:input>
 
 
         <article class="row">
        
        <section class="whole">
          <div class="align-center">
            <h4 class="asphalt pad-top">
                Action Role Form
            </h4>
          </div>        
    
               
          
<div class="whole">           
<div id="imageUnd"
						class="centered align-center pad-top triple hide">
						<img src="<%=contextpath%>resources/app_srv/msip/gl/images/loading.gif"
							alt="loading" class="middle centered" style="max-width: 50%;">
					</div>


</div>



	    



<c:choose>
<c:when test="${actionlist != null }">	
		<div class="whole   ">
		<div class="one half centered">
		 <div class="two sixth">
			<form:label path="strActionName" >After Action <span class="red"> *</span></form:label>
			</div>
		</div>	
		</div>
		
		<div class="one half centered pad-bottom double">
		
		
		
		<form:select class="chzn-select whole"  path="actionid" id="actionID">
		  <form:option value="-1">--Select Action--</form:option>
		 <c:forEach items="${actionlist}" var="invList"> 
			<form:option value="${invList.numActionId}">${invList.strActionName}</form:option>
		</c:forEach>
		 
		 </form:select>
		 
		 
		
		
		</div>
	
	</c:when>
</c:choose>	

<div class="whole pad-top double"><div class="one half centered"><div class="two sixth"><label>Proposals will be available for(Roles) </label></div></div></div>
	<div class="one half centered">
		<form:select class=" whole chzn-select" path="roleids" id="rolename">
			<option value="-1">Select</option>
		</form:select>
	</div>	

</section>
</article>

</form:form>



<!-- scripts-->

  <script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.easyui.js"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/ValidationFunctions.js" language="JavaScript" type="text/javascript"></script>


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