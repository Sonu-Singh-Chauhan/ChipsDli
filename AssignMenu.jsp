<%@page import="in.cdacnoida.msips.gl.misc.AlertMessagesFile"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import=" java.io.File,java.util.*"%>
<%@ page isELIgnored="false"%>

<!-- CSS and JS for responsive tables -->

 <link href="/DLI/resources/app_srv/msip/gl/theme/bootstrap_foo.css" rel="stylesheet" type="text/css"/> 
  <link href="/DLI/resources/app_srv/msip/gl/theme/footable.core.css?v=2-0-1" rel="stylesheet" type="text/css"/>
  <link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css" rel="stylesheet" type="text/css"/> 

     
    <!--  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/data-generator.js" type="text/javascript"></script> -->
   
     
    <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable_v2.js?v=2-0-1" type="text/javascript"></script>
    
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sort.js?v=2-0-1" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter_v2.js?v=2-0-1" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate_v2.js" type="text/javascript"></script>
  
   
  <link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
  <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">

<%
	String AssignRoleMenuMultipleHelp = AlertMessagesFile.getValueFromKey("Assign_Role_Menu_Multiple_Help");
	%>


<script>
$(document).ready( function() {
	        $('#userinfo-message').delay(5000).fadeOut();
	    </script>
	    <script type="text/javascript">
 

  $(function (){

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
<script>

function getAssignTypedetails() 
{
	//alert("here");

	// $("#strCheckId2").attr('checked', false).trigger('click');
	 $("#strCheckId2").prop('checked', false);
	 $("#strCheckId").prop('checked', false);
	var id=$('#numAssignTypeId').val();
	$('#Search').hide();
	$('#RefineByNameEmail').hide();
	$('#AssignMenuListTable').hide();
	
	if(id==2)
		{
		$('#AssignRoleMenu').hide();
		$('#assignRoleDiv').show();

		$('#rolelistdiv').show();
		$("#numRoleId_chzn").css("width","95%");
		$("#numAssignRoleId_chzn").css("width","95%");
		$('#SelectMenu').hide();
		$('#SelectMenuFilter').hide();
		
		} 
	 if(id==1)
		{
		//alert("1");
			$('#assignRoleDiv').show();

		$('#AssignRoleMenu').hide();
		$('#rolelistdiv').show();
		$("#numRoleId_chzn").css("width","95%");
		$("#numAssignRoleId_chzn").css("width","95%");
		$('#SelectMenu').hide();
		$('#SelectMenuFilter').hide();

	
		} 
	 if(id==3)
		{
			$('#hiddenDiv1').hide();
			$('#hiddenDiv2').hide();
			$('#hiddenDiv3').hide();
		$('#rolelistdiv').show();
		$('#assignRoleDiv').hide();
		$("#numRoleId_chzn").css("width","95%");
		$("#numAssignRoleId_chzn").css("width","95%");
		$('#AssignRoleMenu').hide();

		} 
}
</script>
<script>

function ShowAssignButton()
{
	var id=$('#numAssignTypeId').val();
	if(id==2)
		{
		
	//	$('#AssignMenuListTable').hide();
			$('#AssignRoleMenu').show();
			$('#Search').hide();
			$('#RefineByNameEmail').hide();
		}
	if(id==1)
		{
	//	$('#AssignMenuListTable').hide();

			$('#AssignRoleMenu').show();
			$('#Search').hide();
			$('#RefineByNameEmail').hide();
		}
	if(id==3)
	{
		//$('#AssignMenuListTable').hide();
		$('#SelectMenu').show();
		$('#SelectMenuFilter').hide();
		$('#assignRoleDiv').hide();
		$('#Search').hide();
		$('#RefineByNameEmail').hide();
	}
	
}
function ShowRefineDetails()
{
	var id=$('#numAssignTypeId').val();

	if(id==2)
	{
	$('#RefineByNameEmail').show();
	$("#AssignMenu").css("display", "none");
	
	$('#AssignRoleMenu').hide();
	$('#Tabledata').show();
	$('#Search').show();
	}
	if(id==1)
	{
	$('#RefineByNameEmail').show();
	$("#AssignMenu").css("display", "none");
	$('#AssignRoleMenu').hide();
	$('#Tabledata').show();
	$('#Search').show();
	}
	if(id==3)
	{
		$("#AssignMenu").css("display", "none");
        $('#SelectMenuFilter').show();
		$('#SelectMenu').hide();
		$('#RefineByNameEmail').show();
		$('#Tabledata').show();
		$('#assignRoleDiv').hide();
		$('#Search').show();
	}
	
}

</script>





 <script>
 function submitSelectMenu()
		{
			//alert("here");
			
			var rid=$('#numRoleId').val();
			if(rid==0)
			{
			alert("Please select Role");
			}
		else
			{
			
		//	alert("m here");
			    document.form1.action = "UserMenuListAssign?rid="+rid,
				document.getElementById("form1").submit();
			}

		}
</script> 


 <script>
 function submitSelectMenuFilter()
		{			
			var rid=$('#numRoleId').val();
			if(rid==0)
			{
			alert("Please select Role");
			}
		else
			{
			
		//	alert("m here");
			    document.form1.action = "UserMenuFilterListAssign?rid="+rid,
				document.getElementById("form1").submit();
			}

		}
</script> 




<script>

function setChecked(){
 	//alert("here");
	var id=$('#numAssignTypeId').val();
	if(id==3)
	{
		$('#rolelistdiv').show();
		$('#assignRoleDiv').hide();
		$("#numRoleId_chzn").css("width","95%");
		$("#numAssignRoleId_chzn").css("width","95%");
	
		 var filterid=$('#numFilterId').val();
		//	 alert(filterid);
		     if(filterid==1)
		     	{
		     	
		    		 $("#strCheckId2").attr('checked', true).trigger('click');
		     	}
		      if(filterid==0)
		   	{
		   	
		  		 $("#strCheckId").attr('checked', true).trigger('click');
		   	}  
	}
 	
 	
 	
	 var filterid=$('#numFilterId').val();
	// alert(filterid);
     if(filterid==1)
     	{
     	
    		 $("#strCheckId2").attr('checked', true).trigger('click');
     	}
    /*  if(filterid==0)
  	{
  	
 		 $("#strCheckId").attr('checked', true).trigger('click');
  	} */
	
}
</script>





<!-- <script>
$('#SelectMenu').click(function()
		{
	
		
		var rid=$('#numRoleId').val();
		//var arid=$('#numAssignRoleId').val();
				//window.open("UserMenuList?rid="+rid,'window');
		       // window.open("/DLI/UserMenuList?rid="+rid, 'window','margin=0px auto,width='+ window.outerWidth/1.20 +',height='+ window.outerHeight/1.20 +',scrollbars=yes');
	if(rid==0)
		{
		alert("Please select Role");
		}
	else
		{
		       document.form1.action = "UserMenuList?rid="+rid,
			document.getElementById("form1").submit();
		}
			//document.getElementById("form1").submit();

		});
</script> -->
<!--  css for validation..... -->

<link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">

<link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">

</head>
<body onload="setChecked()">



	<form:form name="form1" method="post" action="AssignMenutoUsers"
		modelAttribute="assignMenuForm" id="form1">
 <c:if test="${Message != null && Message != ''}">
       				           <div id="userinfo-message"><p class="msg msgbg">${Message}</p></div> 
        </c:if>	
        		<form:hidden path="numFilterId" value="${filter}"/>
        
		<article class="row">

			<section class="whole">
				<div class="align-center">
					<h4 class="asphalt pad-top">Assign Role/Menu</h4>
				</div>

				<div class="row">

					<div class=" row grey_border rounded padded gapped">


						<div class="whole">
						
						
						<div class="whole">
								<div class="one half centered">
									<div class="two sixth">
										<form:label path="numAssignTypeId">Assign Type:</form:label>
									</div>
									<div class="three sixth pad-top-half">

										<form:select path="numAssignTypeId" style="width:95%" name="numAssignTypeId" id="numAssignTypeId" onchange="getAssignTypedetails()" class="chzn-select">
											<form:option value="0"> --------------------Select----------------- </form:option>
											<form:option value="1"> Role </form:option>
											<form:option value="2"> Role with Menu </form:option>
											<form:option value="3"> Only Menu </form:option>
											
										</form:select>
									</div>
							<div class="one sixth">
									
									<form:label path="numAssignTypeId" class="align-right">to Users</form:label>
									
					
									</div>
							
									
								</div>
								<div class="align-right pad-right">
									  <i class="icon-question-sign tooltip button-tooltip align-right" title="<%=AssignRoleMenuMultipleHelp %>"></i>
									
									</div>
								
								<!--  end of one half div -->


							</div> 
							
							
							
					<div class="whole" id="rolelistdiv" style="display:none">
								<div class="one half centered">
									<div class="two sixth">
										<form:label path="numRoleId">Having Role:<span class="red">*</span></form:label>
									</div>
									<div class="three sixth  pad-top">

										<form:select path="numRoleId" style="width:95%"
											name="numRoleId" id="numRoleId" class="chzn-select">
											<form:option value="0"> --Select role-- </form:option>
											<c:forEach items="${Rolelist}" var="u">
												<form:option value="${u.numRoleId}">${u.strRolename}</form:option>
											</c:forEach>
										</form:select>
									</div>
									<div class="one sixth">
									
								</div>
								</div>
								<!--  end of one half div -->


							
							
							
							
						
						
					<div class="whole" id="assignRoleDiv">
								<div class="one half centered">
									<div class="two sixth">
										<form:label path="numAssignRoleId">Assign Role:</form:label>
									</div>
									<div class="three sixth  pad-top">

										<form:select path="numAssignRoleId" style="width:95%"
											name="numAssignRoleId" id="numAssignRoleId" class="chzn-select">
											<form:option value="0"> --Select role-- </form:option>
											<c:forEach items="${Rolelist}" var="u">
												<form:option value="${u.numRoleId}">${u.strRolename}</form:option>
											</c:forEach>
										</form:select>
									</div>
									<div class="one sixth">
									
								</div>
								</div>
								<!--  end of one half div -->


							</div>


                                <div class="whole pad-top" id="hiddenDiv3" hidden="true"> <!--second row-->
								
								 <div class="one half centered" >
								<div class="two sixth">
								<form:label path="numSchemeId">Scheme Name:</form:label>
								</div> 
								
								<div class="three sixth">
								<form:select path="numSchemeId" id="numSchemeId"  class="chzn-select whole">
								<form:option value="99">No Scheme</form:option>
								<c:forEach items="${schemeList}" var="l">
								<form:option value="${l.objScheme.numSchemeId}">${l.objScheme.strSchemeName}</form:option>
								</c:forEach>
								</form:select>
								</div>
									<div class="one sixth">
								</div>
								</div>
								</div> <!-- end of whole div-->
                                
						
								
								<div class="whole" id="hiddenDiv1" hidden="true"> <!--fourth row-->
								<div class="one half centered">
								<div class="two sixth">
								<form:label path="numCommitteeTypeId">Committee Type Name:</form:label>
								</div> 
								
								<div class="three sixth">
								<form:select path="numCommitteeTypeId" id="numCommitteeTypeId"  class="chzn-select whole">
								<form:option value="0">No CommitteeType</form:option>
								</form:select>
								</div>
										<div class="one sixth">
								</div>
								
								</div>
								</div> <!-- end of whole div-->
								
								<div class="whole pad-bottom" id="hiddenDiv2" hidden="true"> <!--fifth row-->
								
								<div class="one half centered">
								<div class="two sixth">
								<form:label path="numCommitteeId">Committee Name:</form:label>
								</div> 
								
								<div class="three sixth">
								<form:select path="numCommitteeId" id="numCommitteeId"  class="chzn-select whole">
								<form:option value="0">No Committee</form:option>
								</form:select>
								</div>
									<div class="one sixth">
								</div>
								</div>
								</div> <!-- end of whole div-->
								 
						
							<div class="whole pad-top">
															<div class="one half centered">
											<div class="skip-two one sixth">
																			
									<form:radiobutton path="strCheckId" id="strCheckId" name="strCheckId" value="0" onClick="ShowAssignButton()"></form:radiobutton>
										<form:label class="inline" path="strCheckId">To All</form:label>
											</div>				
															<div class="three sixth">

									
							        <form:radiobutton path="strCheckId" id="strCheckId2" name="strCheckId" value="1" onClick="ShowRefineDetails()"/>
									<form:label class="inline" path="strCheckId">Filter User</form:label>
									
										<input type="button" id="SelectMenu" value="Select Menu" class="blue align-right" name="SelectMenu"  style="display:none" onclick="submitSelectMenu()"/>
							        	<input type="button" id="SelectMenuFilter" value="Select Menu" name="SelectMenuFilter" class="align-left blue gap-right" style="display:none" onclick="submitSelectMenuFilter()"/>
							           
							</div>
								
							</div>
							</div>
							</div>	
							
								<div class="whole">
								<div class="one half centered">
								<div class="skip-two two sixth">
										</div>
								<div class="two sixth pad-top-half">
										
										<input type="button" id="AssignRoleMenu" value="Assign" class="blue gap-right" name="AssignRoleMenu"  style="display:none"/>
<!-- 										<input type="button" id="AssignRole" value="Assign Role" class="blue gap-right" name="AssignRole"  style="display:none"/>
 -->										
									</div>
									<div class="one fifth">
										</div>
								</div>
							</div>
							
							
              <form:hidden path="StrProcessIdList"  name="StrProcessIdList" id="StrProcessIdList" /> 
							
										
					<div class="whole" id="AssignMenuListTable">
							  <c:if test="${testDelete == true}">
							
								<table class="footable blue gap-top" data-filter="#filter"	data-page-size="10" id="table1">
									<thead>
										<tr>
<!-- 											<th style="width:2%;"></th>
 -->										
											<th data-hide="phone,tablet" class="nobreak">Group Name</th>
											<th data-hide="phone,tablet" class="nobreak">Process List</th>

										</tr>
									</thead>
									<tbody id="DeleteMenuDataTable">
									
  									
                              <c:forEach items="${AssignMenuList}" var="d">
										
										<tr>
										
											<td>${d.strGroupName} </td>
											<td class="break">${d.strProcessNameList} </td>
											
											
										
										</tr>
									</c:forEach>
									
									<tfoot id="DeleteMenutablefoot">
    
								        <tr>
								          <td colspan="5"><div class="pagination pagination-centered"></div></td>
								        </tr> 
								      </tfoot>							
							</table>
							<div class="whole">
							<div class="two sixth pad-right">
							
							</div>
						
							
							</div>
								<div class="whole">
						<center>
							
							<input type="button" id="AssignMenu" value="Assign Menu" class="blue gap-right gap-top" name="AssignMenu"/>
</center>							</div>
							
							
							</c:if>
							</div>		
		<input type="hidden" id="checkText" name="checkText" value="1"/>
							
							
<div id="image" class=" pad-top triple hide align-center">
<img src="/DLI/resources/app_srv/msip/gl/images/loading.gif" alt="loading" class="middle"  style="max-width: 50%;">
</div>
						<div class="whole" id="RefineByNameEmail" Style="display:none">		
							<div class="whole pad-top">
								<!-- Third row starts here-->
								<div class="one half centered">

									<div class="one fifth">
										<form:label path="strFirstName"> Name: </form:label>
									</div>
									<div class="three fifth pad-top-half">

											<form:input path="strFirstName" maxlength="75"
												id="strFirstName" placeholder="Name" />
										</div>
										<div class="one fifth">
										</div>
								</div>
							</div>

							<div class="whole">
								<div class="one half centered">
									<div class="one fifth">
										<form:label path="strEmail">Email id:</form:label>
									</div>
									<div class="three fifth pad-top-half">
										<form:input path="strEmail" id="strEmail"
											placeholder="Email id" />
									</div>
									<div class="one fifth">
										</div>
								</div>
							</div>
							
									<div class="whole pad-top">	
																<center>
									
										<input type="button" id="Search" value="Search" class="blue gap-right" name="Search"  style="display:none"/>
																</center>	
								
								</div>
						<br>
						<fieldset>
							<legend class="info" align="left"> User's Details </legend>
							<div class="whole">
								<div class="one half pad-bottom">
									<div class="one sixth">Search:</div>
									<div class="five sixth">
										<input id="filter" type="text" />
									</div>
								</div>
								
								<div class="one half">
									<div class="two sixth"></div>
									<div class="four sixth">
										<input type="button" id="AssignRoleMenuFilter" value="Assign"
											name="AssignRoleMenuFilter" class=" pull-right blue gap-right" />
											
									</div>
								</div>
								</div>
								<div class="whole" id="det">
								<table class="footable demo blue" data-filter="#filter"	data-page-size="10" id="tab1">
									<thead>
										<tr>
											<th style="width:2%;"></th>
										
											<th   data-class="expand"  class="nobreak">Name</th>
											<th data-hide="phone,tablet" class="nobreak">Email</th>
											<th data-hide="phone,tablet" class="break">Status</th>

										</tr>
									</thead>
									<tbody id="DataTable">
									
									
									<tfoot id="tablefoot">
    
								       <tr>
								          <td colspan="5" class="tfooter"></td>
								        </tr> 
								      </tfoot>							
							</table>
							</div>
							<!--end of div before table-->
						</fieldset>
						
						</div>
						
							<!--end of div before table-->
					
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
	
		
		$('#Search').click(function()
		{
			if(($('#StrProcessIdList').val()=="" || $('#StrProcessIdList').val()==null) && $('#numAssignTypeId').val()==3)
		{
				alert("Please first select Menu to Assign");
		}
			else
				{
			var result= $('#numRoleId').val();
			var name=$('#strFirstName').val();
				var email=$('#strEmail').val();
			if(result==0)
				{
				alert("Please select Having Role");
				}
			else if(result!=0)
				{   
				var i=0;
			    var options="";
				
				$.ajax({
					type : "POST",
					url : "FilterSearch",
					data: "numRoleId="+result+"&strFirstName="+name+"&strEmail="+email,
					 beforeSend: function(){
		     	        $('#image').show();
		     	    },
		     	    complete: function(){
		     	        $('#image').hide();
		     	    },
					success : function(response) 
					{      
						//alert(response);
			          $('#DataTable').find('tr').remove();

						 while(i < response.length)
				        { 
							  var s=response[i].bTrFlag;
								var status="";
								if(s==1)
									{
									status="Active";
									}
								else if(s==0)
									{
									status="Inactive";
									} 
							 
								   options += '<tr> <td><input type="checkbox" class="CheckBox" name="CheckBox" id="'+response[i].numUserId+'" value="'+response[i].numUserId+'"/></td><td data-hide="phone,tablet" class="nobreak">'+response[i].strFirstName+'</td><td>'+response[i].strUsername+'</td><td class="nobreak" data-hide="phone,tablet">'+status+'</td></tr>';
				           i++;
				        }
		         		 $("#DataTable").append(options);
		         		
		         		
		         		
			         		$('table').footable();
		       
					}
				
				});
				}
				}
		});
		
		
</script>

	<script>
	
	$('#AssignMenu').click(function()
			{
		 
				document.form1.action = "/DLI/AssignMenuOnly";
				document.getElementById("form1").submit();
		
			});
	
	</script>
	<script>

$('#AssignRoleMenu').click(function()
		{
	var isHidden= $('#hiddenDiv1').is(":hidden");
	if(isHidden==true)
	{
		$('#checkText').val(0);
		
	}
	else
	{
		$('#checkText').val(1);
		
	}
 	var id=$('#numAssignTypeId').val();
		if(id==2)
			{
			
			document.form1.action = "/DLI/AssignRoleMenu";
			document.getElementById("form1").submit();
			}
	if(id==1)
		{

			document.form1.action = "/DLI/AssignRoleOnly";
			document.getElementById("form1").submit();
		} 

		});
</script>
<script>
$('#AssignRoleMenuFilter').click(function()
		{
	var isHidden= $('#hiddenDiv1').is(":hidden");
	if(isHidden==true)
	{
		$('#checkText').val(0);
		
	}
	else
	{
		$('#checkText').val(1);
		
	}
	
	
		 var chkArray = [];
		   $(".CheckBox:checked").each(function() {
		        chkArray.push($(this).val());
		    });
		     
		     
		  if(chkArray.length<1)
			  {
			  alert("Please select Users");
			  }
		  else
			  {
	
			var id=$('#numAssignTypeId').val();
			if(id==2)
				{
				document.form1.action = "/DLI/AssignRoleMenuFilter";
				document.getElementById("form1").submit();
				}
		if(id==1)
			{
		//	alert("here role filter ");
			
			document.form1.action = "/DLI/AssignRoleFilter";
			document.getElementById("form1").submit();
			}
		
		if(id==3)
		{
		//  alert("here in assing menu only");
		
		document.form1.action = "/DLI/AssignMenuOnlyFilter";
		document.getElementById("form1").submit();
	  
		}
		}

		});
</script>

<script>

$(document).on('change','#numAssignRoleId',function(e){
	//alert("1");
		var roleId = $(this).find(":selected").val();
		getSchemes(roleId);		 

		getRoleCode(roleId);
	});


function getRoleCode(roleId)
{
	
//alert("heree");
	var RoleId= roleId;
		                $.ajax(
		               {
		                    type: "POST",
		                    url: "/DLI/UserRoleCode",
		                    data: "numRoleId="+ RoleId,
		                    success: function(response) {
		                    	//alert(response);
		                    
		                    	var r = response+"";
		                    	var a = r.split(",");
		                    	var i = 0;
		                    	var seloption = "";
		                    	while(i < a.length)
						        {
						       	 	seloption += a[i];
						       	 	i=i+1;
						        }
		                      
		                    	if((seloption=='RE')||(seloption=='PCF')||(seloption=='DS')||(seloption=='SS')||(seloption=='AD')||(seloption=='PI')||(seloption=='SI') ||(seloption=='GU'))
		                    	{
		                    		$('#hiddenDiv1').hide();
		                    		$('#hiddenDiv2').hide();
		                    		$('#hiddenDiv3').hide();

		                    	}
		                    	else if((seloption=='CH')||(seloption=='CM'))
		                    		{
		                    		$('#hiddenDiv1').show();
			                    	$('#numCommitteeId_chzn').css({"width":"95%"});
			                    	$('#hiddenDiv2').show();
			                    	$('#numCommitteeTypeId_chzn').css({"width":"95%"});
			                    	$('#hiddenDiv3').show();
			                    	$('#numSchemeId_chzn').css({"width":"95%"});


		                    		}
		                    	else if((seloption==''))
		                    		{
		                    		$('#hiddenDiv1').hide();
		                    		$('#hiddenDiv2').hide();
		                    		$('#hiddenDiv3').hide();

		                    		}
		                    	else
		                    		{
		                    		$('#hiddenDiv1').show();
			                    	$('#numCommitteeId_chzn').css({"width":"95%"});
		                    		$('#hiddenDiv2').show();
			                    	$('#numCommitteeTypeId_chzn').css({"width":"95%"});
			                    	$('#hiddenDiv3').show();
			                    	$('#numSchemeId_chzn').css({"width":"95%"});

		                    		}
		                    },
		                error: function(e){
				        	alert('Error: ' + e);
		                }
		                    
		                });	 
                 }	

function getSchemes(roleId)
{
	var RoleId= roleId;
    $.ajax(
   {
        type: "POST",
        url: "/DLI/UserRoleScheme",
        data: "numAssignRoleId="+ RoleId,
        success: function(response) {
        	//alert(response.length);
        
        	var i = 0;
        	var seloption = "";
        
        	$('#numSchemeId').find('option').remove();
    		
        	seloption = "<option value='0'>--Select Scheme--</option>";
          // alert("here");
        	while(i < response.length)
	        {
	        	//alert(response.numSchemeId);
	        	//alert(response.strSchemeName);
                //alert("here");
	       	 	seloption += "<option value="+ response[i].numSchemeId+">"+response[i].strSchemeName+"</option>";
	       	 	i+=1;
	        }
        	$('#numSchemeId').append(seloption);
          	$("#numSchemeId").trigger("liszt:updated");	

         
        
        },
    error: function(e){
    	alert('Error: ' + e);
    }
        
    });	 
	
}
</script>

<script>
$(document).on('change','#numSchemeId',function(e){
		var schemeId = $(this).find(":selected").val();
	
	    getCommitteeTypeDetails(schemeId);
		
	});




function getCommitteeTypeDetails(id){
	var schemeId= id+"";
	
		                $.ajax({
		                    type: "POST",
		                    url: "/DLI/UserCommitteeTypes",
		                    data: "numSchemeId=" + schemeId,
		                    success: function(response) {
		                    	var r = response+"";
		                    	var a = r.split(",");
		                    	$('#numCommitteeTypeId').find('option').remove();
		                    	var i = 1;
		                    	var seloption = "";
		                    	seloption+="<option value="+ 0 +">--Select Committee Type--</option>";
		                    	while(i < a.length)
						        {
						        	
						       	 	seloption += "<option value="+ a[i-1]+">"+a[i]+"</option>";
						       	 	i=i+2;
						        }
		                    	$('#numCommitteeTypeId').append(seloption);
		                      	$("#numCommitteeTypeId").trigger("liszt:updated");	

		                     
		                    }
		                });	 
                 }		
					
  </script>

<script>

$(document).on('change','#numCommitteeTypeId',function(e){
	var committeeTypeId = $(this).find(":selected").val();
	var schemeId= $('#numSchemeId').find(":selected").val();
    getCommitteeDetails(committeeTypeId, schemeId);
});

function getCommitteeDetails(committeeTypeId,schemeId){
var CommitteeTypeId= committeeTypeId;

	                $.ajax(
	               {
	                    type: "POST",
	                    url: "/DLI/UserCommittees",
	                    data: "numSchemeId="+ schemeId+ "&numCommitteeTypeId=" + CommitteeTypeId,
	                    success: function(response) {
	                   // alert(response);
	                    //	var r = response+"";
	                    	//var a = r.split(",");
	                    	$('#numCommitteeId').find('option').remove();
	                    	var i = 0;
	                    	var seloption = "";
	                    	seloption+="<option value="+ 0 +">--Select Committee--</option>";

	                    	while(i < response.length)
					        {
	                    		//alert(response[i].numCommitteeId);
	                    		//alert(response[i].strCommitteeName);
					       	 	seloption += "<option value="+response[i].numCommitteeId+">"+response[i].strCommitteeName+"</option>";
					       	 	i+=1;
					        }
	                    	$('#numCommitteeId').append(seloption);
	                      	$("#numCommitteeId").trigger("liszt:updated");	

	                    },
	                error: function(e){
			        	alert('Error: ' + e);
	                }
	                    
	                });	 
             }		
</script>


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