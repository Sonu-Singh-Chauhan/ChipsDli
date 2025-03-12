<%@page import="in.cdacnoida.msips.gl.misc.AlertMessagesFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../../mm01/jsp/ProposalFlow.jsp" />
<%
	String addToolTip = AlertMessagesFile.getValueFromKey("SAVE_TOOLTIP");
	String nextToolTip = AlertMessagesFile.getValueFromKey("NEXT_TOOLTIP");
	 String prevToolTip= AlertMessagesFile.getValueFromKey("PREV_TOOLTIP");
	String deleteToolTip = AlertMessagesFile.getValueFromKey("DELETE_TOOLTIP");
%>
<%@ page import="in.cdacnoida.msips.gl.model.UserInfo"%>
<%
	UserInfo usrInfo = new UserInfo();
	int userId = 0;
	usrInfo = (UserInfo) request.getSession().getAttribute("UserInfo");

	if (usrInfo != null) {
		userId = usrInfo.getNumUserId();
	}
%>

<%
	String saveTooltip = AlertMessagesFile.getValueFromKey("SAVE_TOOLTIP");
	String nextTooltip = AlertMessagesFile.getValueFromKey("NEXT_TOOLTIP");
%>
<!-- CSS and JS for responsive tables -->
<link rel="stylesheet" type="text/css"
	href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
<link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css"
	rel="stylesheet" type="text/css" />
<link
	href="/DLI/resources/app_srv/msip/gl/theme/footable.sortable-0.1.css"
	rel="stylesheet" type="text/css" />
<link href="/DLI/resources/app_srv/msip/gl/theme/footable.paginate.css"
	rel="stylesheet" type="text/css" />

<script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/data-generator.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">
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

<script>
    $(document).ready( function() {
        $('#userinfo-message').delay(20000).fadeOut();
      });
  </script>
<script type="text/javascript">
    $(function() {
      $('table').footable();
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
					//alert(ids);
					});
				
					
			
			
			$(document).on('change','#degree',function(e){
			
					//alert($(this).val());
					var id= $(this).val();
					
					if(id == 3)
						{
							$('#PhD').show();
							$('#otherDegree').hide();
						}
					else
						{
							if(id == -1)
								{
									$('#otherDegree').show();
								}
							else
								{
									$('#otherDegree').hide();
								}
							$('#PhD').hide();
						}
					
									
		//	$('#pubId').val(resultArray1[0]);
			
			});
			
			
			$(document).on('click','#Edit',function(e){
				var resultArray1 = $(this).closest('tr').find('td').map( function(){
						return $(this).text();
					}).get();
				
				
				for(var i=0;i<resultArray1.length;i++)
					//alert(resultArray1[i]);
				
				
					$('#qualificationId').val(resultArray1[0]);
				
				var degreevalue = resultArray1[1].split("-");
				var value = degreevalue[0].trim();
				
				//alert("Degree Id== "+value);
				
				var chkArray = [];
			     
			    $(".CheckBox:checked").each(function() {
			        chkArray.push($(this).val());
			    });
			    
			    var degreeType = chkArray[0];
			  
			   populateDegreeforEdit(resultArray1[11],value);
			   
				if(value != -1)
					{
						//alert("From if="+value);
						
						$('#degreeType').val(resultArray1[11]);
						$('#degree').val(value);
						$("#degree").trigger("liszt:updated");
						
						$("#degreeType").trigger("liszt:updated");
						//$('#degree').prop("selected",true);
						$('#otherDegree').hide();
					}
				else
					{
					//alert("From else="+value);
						
						$('#degree').val(-1);
						$('#otherDegree').show();
						$("#degree").trigger("liszt:updated");
						$('#otherQualificationDegree').val(degreevalue[2].trim());
						$('#otherDegreeId').val(degreevalue[1].trim());
					}
				
				$('#subject').val(resultArray1[2]);
				$('#division').val(resultArray1[3]);
				$('#year').val(resultArray1[4]);
				$('#institute').val(resultArray1[5]);
				if(resultArray1[6].trim() != "N.A" || resultArray1[7].trim() != "N.A")
				{
					$('#thesisTitle').val(resultArray1[6].trim());
					$('#projectGuide').val(resultArray1[7].trim());
					$('#PhD').show();
				}
				else
				{
					$('#PhD').hide();
				}
				
				$('#degreeType').val(resultArray1[11]);
				$("#degreeType").trigger("liszt:updated");
				$('#remarks').val(resultArray1[8]);
				$('#percentage').val(resultArray1[9]);
				$('#strThesisSubject').val(resultArray1[10]);
				$('.save_update').val('Update');
				});
			
</script>
<script>
	
	function setDegree()
	{
		$('.save_update').val('Save');
		$('#qualificationId').val(0);
		$('#degree').val("0");
		
			$('#year').val('');
		$("#degree").trigger("liszt:updated");

		
	}

	$(document).ready(function(){
	
		if($('#year').val() == 0)
		{
			$('#year').val('');
		}
		
		$("#percentage").on("input", function(evt) {
			   var self = $(this);
			   self.val(self.val().replace(/[^0-9\.]/g, ''));
			   if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) 
			   {
			     evt.preventDefault();
			   }
			 });
		
	});
	
</script>
<script>


$(document).on('click','#Save',function(e)
		{
	
	var $form = $(this);

    if ($form.data('submitted') === true) {
        e.preventDefault();
    } 
    else{
		
	
		if($('#degreeType').val() == 0)
		{
			alert("Please enter degree.");
			return false;
		}
		
		var degree = $('#degreeType').find(":selected").val();

		//alert(degree);
		var degree1 = $('#degree').find(":selected").val();
		if(degree1 == -1){
			var other= $('#otherQualificationDegree').val();
			if(other==""|| other==null){
				alert("Please enter other Qualification degree name.");
				return false;
			}
		}
		if(degree == 3){
		 
			  
			   if($('#thesisTitle').val() == "")
				{
					alert("Please enter PhD Thesis Title.");
					$('#thesisTitle').focus();
					return false;
				} 
			  
			  if($('#projectGuide').val() == "")
				{
					alert(" Please enter PhD Project Guide.");
					$('#projectGuide').focus();
					return false;
				} 
			
		}


		if($('#frm').form('validate'))
		{   
			document.getElementById("frm").submit();
		  }
		else
			{
			//alert("in else");
			} 	
    }
	}); 	
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
			document.frm.action = "/DLI/deleteQualification";
			document.getElementById("frm").submit();
			//alert("after submit");
		}
		
</script>

<script>

$(document).ready( function() {

		var pcode="PS_UQ"

			var token = $("meta[name='_csrf']").attr("content");
 		var header = $("meta[name='_csrf_header']").attr("content");
 		$(document).ajaxSend(function(e, xhr, options) {
 			xhr.setRequestHeader(header, token);
 		});
			
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

</script>

<link rel="stylesheet"
	href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">


</head>
<body>
	<c:if test="${errormsg!=null && errormsg != ''}">

		<div id="userinfo-message" class="msg msgbg centered">${errormsg}</div>
	</c:if>
	<div class="padded">
		<article class="row">

			<section class="whole">
				<div class="align-center">
					<h4 class="asphalt pad-top">Qualification</h4>
					 <div class="whole align-center gap-top gap-bottom double">
    <div class="one eighth align-left"><input type="button" value="<< Prev" onclick="goprev()" name="Prev" class="blue gap-top gap-left tooltip button-tooltip align-left gap-right gap-bottom " title="<%= prevToolTip %>"></div>
    
   <div class="align-right">
<%-- <input name="Next" type="button" value="Next" onclick="javascript: gonext()" class="blue gap-right tooltip button-tooltip" title="<%=nextToolTip %>"> --%>
<input name="Next" title="<%=nextTooltip %>" type="button" value="Next >>" onclick="javascript: gonext()" class="blue gap-right tooltip button-tooltip">
	</div> 	

 		</div>
    
				</div>



				<div class="grey_border rounded padded centered gap-top gap-bottom">
					<form:form action="AddUpdateQualificationYSS" id="frm" name="frm"
						method="POST" modelAttribute="ProfileQualification">
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
								<span class="red">*</span> Mandatory Fields ${ProfileQualification.numQualificationId}
							</div>


							<div class="whole pad-bottom double">
								<p class="info message">User can save multiple
									Qualifications.</p>

							</div>

							<div class="whole pad-bottom">
								<form:hidden path="objRegistrationForm.numUserId"
									value="<%=userId%>"></form:hidden>
								<form:hidden path="numQualificationId" id="qualificationId"></form:hidden>
							</div>
							
							<div class="whole">
								<!--first row-->
								<div class="one fourth">
									<form:label path="numDegreeYear" for="year" class="pull-left">Degree Type :<font
											color="red">*</font>
									</form:label>
								</div>
								<div class="three fourth">
									<div class="three eleventh">
										<label><form:select path="degreeTypeId" id="degreeType"
												data-placeholder="Select" style="width:90%;"
												class="chzn-select">
												<form:option value="0">[Select]</form:option>
												<c:forEach items="${DegreeTypes}" var="listDegreeTypes">
													<form:option value="${listDegreeTypes.numDegreeTypeId}">
														<c:out value="${listDegreeTypes.degreeTypeName}"></c:out>
													</form:option>
												</c:forEach>
											</form:select></label>
									</div>
								</div>


							</div>
							
							
							<div class="whole"  id="second_row">
								<!--first row-->
								<div class="one fourth">
									<form:label path="degreeId" for="degree" class="pull-left">Degree:<font
											color="red">*</font>
									</form:label>
								</div>
								
								<div class="three fourth"  id="second_row">

									<div class="three eleventh">
										<label><form:select path="degreeId" id="degree"
												data-placeholder="Select" style="width:90%;"
												class="chzn-select">
												
											</form:select></label>
									</div>
									
									<div class="skip-one three eleventh">
										<form:label path="strDegreeFields" for="subject"
											class="pull-left">Subject:<font color="red">*</font>
										</form:label>
									</div>
									<div class="skip-one three eleventh">
										<form:input path="strDegreeFields" id="subject"
											placeholder="Subject"></form:input>
									</div>
								</div>


							</div>
							<!-- end of first row-->
							<div class="whole hide" id="otherDegree">
								<form:hidden id="otherDegreeId" path="numOtherQualificationId" />
								<div class="one fourth">
									<form:label path="strOtherQualification" for="otherDegreeType">Other Degree Name:<font
											color="red">*</font>
									</form:label>
								</div>
								<div class="three fourth">
									<div class="half">
										<form:input id="otherQualificationDegree"
											path="strOtherQualification" />
									</div>
								</div>
							</div>
							<div class="whole hide" id="PhD">
								<!--second row-->
								<div class="one fourth">
									<form:label path="strPhdThesisTitle" for="thesisTitle"
										class="pull-left">PhD Thesis Title:<font
											color="red">*</font>
									</form:label>
								</div>
								<div class="three fourth">

									<div class="three eleventh">
										<form:input path="strPhdThesisTitle" id="thesisTitle"
											placeholder="Thesis Title"></form:input>
									</div>
									<div class="skip-one three eleventh">
										<form:label path="strPhdProjectGuide" for="projectGuide"
											class="pull-left">PhD Project Guide:<font
												color="red">*</font>
										</form:label>
									</div>
									<div class="skip-one three eleventh">
										<form:input path="strPhdProjectGuide" id="projectGuide"
											placeholder="Project Guide"></form:input>
									</div>
								</div>


							</div>

							<div class="whole">
								<!--third row-->
								<div class="one fourth">
									<form:label path="strClassDivision" for="division"
										class="pull-left">Class/Division:</form:label>
								</div>
								<div class="three fourth">

									<div class="three eleventh">
										<form:input path="strClassDivision" id="division"
											maxlength="60" placeholder="Class/Division"></form:input>
									</div>
									<div class="skip-one three eleventh">
										<form:label path="strInstituteName" for="institute"
											class="pull-left">Institute:<font color="red">*</font>
										</form:label>
									</div>
									<div class="skip-one three eleventh">
										<form:input path="strInstituteName" id="institute"></form:input>
									</div>
								</div>


							</div>
							<!-- end of third row-->

							<div class="whole">
								<!--fourth row-->
								<div class="one fourth">
									<form:label path="numDegreeYear" for="year" class="pull-left">Year of Passing:<font
											color="red">*</font>
									</form:label>
								</div>
								<div class="three fourth">
									<div class="three eleventh">
										<form:input path="numDegreeYear" id="year"
											maxlength="40" placeholder="Year"></form:input>
									</div>
									<div class="skip-one three eleventh">
										<form:label path="numPercentage" for="percentage"
											class="pull-left">Percentage (%):
										</form:label>
									</div>
									<div class="skip-one three eleventh">
										<form:input path="numPercentage" id="percentage"  placeholder="Percentage" ></form:input>
									</div>
								</div>
							
								

							</div>
							
							<!-- Below is the row added for Thesis subject -->
							
							
							<div class="whole">
								<div class="one fourth">
									<form:label path="strThesisSubject" for="strThesisSubject">Thesis Subject (if any):
									</form:label>
								</div>
								<div class="three fourth">
									<div class="half">
										<form:input id="strThesisSubject"
											path="strThesisSubject" />
									</div>
								</div>
							</div>
							
							
							
							
							
							
							
							<!-- end of fourth row-->


							<div class="whole">
								<!--fifth row-->
								<div class="one fourth">
									<form:label path="strRemarks" for="remarks" class="pull-left">Other Achievements (like Scholarships, Medals,Prizes, Awards, distinction or honor etc.):</form:label>
								</div>
								<div class="three fourth">
									<form:textarea path="strRemarks" id="remarks"
										placeholder="remarks" rows="5"></form:textarea>
								</div>


							</div>
							<!-- end of fourth row-->

							<div class="whole">&nbsp;</div>


							<div class="align-center row">

								<div class="one eighth align-left"></div>
								<div class="six eighth align-center">
									<input type="button" name="Save" value="Save" id="Save"
										title="<%=addToolTip%>"
										class="blue gap-right save_update tooltip button-tooltip">&nbsp;
									<input name="Reset" type="reset" value="Reset"
										onclick="javascript: setDegree()" class="blue gap-right">&nbsp;

								</div>
								<div class="one eighth align-right">
									<input name="Next" title="<%=nextToolTip%>" type="button"
										value="Next >>" onclick="javascript: gonext()"
										class="blue tooltip button-tooltip">
								</div>






							</div>

						</div>
						<!-- end of fifth row-->


						<fieldset>
							<legend class="info"> Qualification Details </legend>
							<div class="whole">
								<div class="one half">
									<div class="one sixth">Search:</div>
									<div class="five sixth">
										<input id="filter" type="text" />
									</div>
								</div>
								<div class="one half">
									<div class="two sixth"></div>
									<div class="four sixth align-right">
										<input type="button" name="Delete" id="Delete" value="Delete"
											class="pull-right blue tooltip button-tooltip"
											title="<%=deleteToolTip%>"></input>
									</div>
								</div>
							</div>
							<table class="footable blue" data-filter="#filter"
								data-page-size="5" id="tab1">
								<thead>
									<tr>
										<th class="nobreak" data-sort-initial="false"></th>
										<th class="nobreak" data-class="expand"
											data-sort-initial="true">Degree</th>
										<th class="nobreak">Subject</th>
										<th class="nobreak" data-hide="phone">Class/Division</th>
										<th class="nobreak" data-hide="phone,tablet">Year of
											Passing</th>
										<th class="nobreak" data-hide="phone,tablet">Institute</th>
										<th class="nobreak" data-hide="all">Thesis Title</th>
										<th class="nobreak" data-hide="all">Project Guide</th>
										<th class="nobreak" data-hide="all">Remarks</th>
										<th class="nobreak" data-hide="all">Percentage</th>
										<th class="nobreak" data-hide="all">Thesis subject</th>
										<th class="nobreak" class="width8"></th>
										<th class="nobreak" class="width8"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${QualificationList}" var="listQualification">
										<tr>
											<td><form:checkbox path="arrQualificationId"
													class="CheckBox" name="CheckBox"
													value="${listQualification.numQualificationId}"></form:checkbox><span
												class="hide"><c:out
														value="${listQualification.numQualificationId}"></c:out></span></td>
											<td class="nobreak"><span class="hide"><c:out
														value="${listQualification.degreeMaster.numDegreeId}-${listQualification.degreeMaster.isVerified}"></c:out>-</span>
												<c:out
													value="${listQualification.degreeMaster.strDegreeName}"></c:out></td>
											<td><c:out value="${listQualification.strDegreeFields}"></c:out></td>
											<td><c:out value="${listQualification.strClassDivision}"></c:out></td>
											<td class="nobreak"><c:out
													value="${listQualification.numDegreeYear}"></c:out></td>
											<td><c:out value="${listQualification.strInstituteName}"></c:out></td>
											<td><c:choose>
													<c:when test="${listQualification.degreeId == 3}">
														<c:out value="${listQualification.strPhdThesisTitle }"></c:out>
													</c:when>
													<c:otherwise>
														<c:out value="N.A"></c:out>
													</c:otherwise>
												</c:choose></td>
											<td><c:choose>
													<c:when test="${listQualification.degreeId == 3}">
														<c:out value="${listQualification.strPhdProjectGuide}"></c:out>
													</c:when>
													<c:otherwise>
														<c:out value="N.A"></c:out>
													</c:otherwise>
												</c:choose></td>
											<td><c:out value="${listQualification.strRemarks}"></c:out></td>
											 <td> <c:out value="${listQualification.numPercentage}"></c:out></td>
											<td><c:out value="${listQualification.strThesisSubject}"></c:out></td>
											<td class="nobreak"><span class="hide"><c:out value="${listQualification.degreeTypeId}"></c:out></span></td>

											<td><a href="#" class="no-line"> <i
													class="icon-edit asphalt tooltip" title="Edit" id="Edit">
												</i>
											</a></td>
										</tr>

									</c:forEach>
								</tbody>
								<tfoot class="footable-pagination">
									<tr>
										<td colspan="10"><ul id="pagination" class="footable-nav"></ul></td>
									</tr>
								</tfoot>
							</table>



						</fieldset>




					</form:form>
				</div>
				<!-- end of grey border-->
			</section>
		</article>


	</div>

	<!-- scripts-->

	<!--script for select box-->
	<script src="/DLI/resources/app_srv/msip/gl/jssrc/chosen.jquery.js"
		type="text/javascript"></script>
	<script type="text/javascript"> 
    var config = {
      '.chzn-select'           : {},
      '.chzn-select-deselect'  : {allow_single_deselect:true},
      '.chzn-select-no-single' : {disable_search_threshold:10},
      '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chzn-select-width'     : {width:"95%"}
    }
    for (var selector in config) 
      $(selector).chosen(config[selector]);
    }
      </script>



	<script type="text/javascript"
		src="/DLI/resources/app_srv/msip/gl/jssrc/charCount.js"></script>

	<script type="text/javascript">
	
	function populateDegreeforEdit(degreetypeVal,degreeVal)
	{
		
		var typeval = degreetypeVal;
		if(typeval == 0)
			{
			$('#otherDegree').hide();
			$('#degree').html("");
			$('#degree').attr('disabled', true);
			$('#PhD').hide();
			$('#second_row').show();
			}
		else if(typeval == 3)
			{
			$('#PhD').show();
			$('#otherDegree').hide();
			$.ajax({
				type: 'POST',
				url: '/DLI/degreeTypes',
				data:{type:typeval}
			}).done(function(response){
				var select = $("#degree");
				select.html('');
				response = eval(response);
				$.each(response, function(index, obj) {
					
					select.append($('<option/>')
							.val(obj.numDegreeId)
							.text(obj.strDegreeName));
				});
				$('#degree').val(degreeVal);
				$("#degree").trigger("liszt:updated");
				
			}).fail(function(jqXHT, statusResponse){
				
				//alert(statusResponse);
			});
			}
		else
			{
			//alert(typeval);
			$('#second_row').show();
			$('#PhD').hide();
			$('#otherDegree').hide();
			$('#degree').attr('disabled', false);
		$.ajax({
			type: 'POST',
			url: '/DLI/degreeTypes',
			data:{type:typeval}
		}).done(function(response){
			var select = $("#degree");
			select.html('');
			response = eval(response);
			$.each(response, function(index, obj) {
				select.append($('<option/>')
						.val(obj.numDegreeId)
						.text(obj.strDegreeName));
			});
			select.append($('<option/>')
					.val('-1')
					.text('Others'));
			
			$('#degree').val(degreeVal);
			$("#degree").trigger("liszt:updated");
			
		}).fail(function(jqXHT, statusResponse){
			
			//alert(statusResponse);
		});}
		
	}
	
	</script>


	<script type="text/javascript">
	
	

	
	var numScheme=$('#numScheme').val();
	if(numScheme != 42){

		
		$("#degreeType").change(function(){
			
			var typeval = $(this).val();
			if(typeval == 0)
				{
				$('#otherDegree').hide();
				$('#degree').html("");
				$('#degree').attr('disabled', true);
				$('#PhD').hide();
				$('#second_row').show();
				}
			else if(typeval == 3)
				{
				$('#PhD').show();
				$('#otherDegree').hide();
				$.ajax({
					type: 'POST',
					url: '/DLI/degreeTypes',
					data:{type:typeval}
				}).done(function(response){
					var select = $("#degree");
					select.html('');
					response = eval(response);
					$.each(response, function(index, obj) {
						
						select.append($('<option/>')
								.val(obj.numDegreeId)
								.text(obj.strDegreeName));
					});
				}).fail(function(jqXHT, statusResponse){
					
					//alert(statusResponse);
				});
				}
			else
				{
				$('#second_row').show();
				$('#PhD').hide();
				$('#otherDegree').hide();
				$('#degree').attr('disabled', false);
			$.ajax({
				type: 'POST',
				url: '/DLI/degreeTypes',
				data:{type:typeval}
			}).done(function(response){
				var select = $("#degree");
				select.html('');
				response = eval(response);
				$.each(response, function(index, obj) {
					select.append($('<option/>')
							.val(obj.numDegreeId)
							.text(obj.strDegreeName));
				});
				select.append($('<option/>')
						.val('-1')
						.text('Others'));
			}).fail(function(jqXHT, statusResponse){
				
				alert(statusResponse);
			});}
		});

		
		
	}
	else{
		$("#degreeType").click(function(){
			
			var typeval = $(this).val();
		
		});
$("#degreeType").change(function(){
	
	
	var typeval = $(this).val();
	if(typeval == 0)
	{
	$('#otherDegree').hide();
	$('#degree').html("");
	$('#degree').attr('disabled', true);
	$('#PhD').hide();
	$('#second_row').show();
	}
			
	else if(typeval == 1)
				{
							$.ajax({
					type: 'POST',
					url: '/DLI/degreeTypes',
					data:{type:typeval}
				}).done(function(response){
					var select = $("#degree");
					select.html('');
					response = eval(response);
					$.each(response, function(index, obj) {
						//alert("id: "+obj.numDegreeId+ "name : " +obj.strDegreeName);
						if(obj.numDegreeId == 1 && obj.strDegreeName == "MBBS"){
						select.append($('<option/>')
								.val(obj.numDegreeId)
								.text(obj.strDegreeName));
						
						
						}
					});
					select.append($('<option/>')
							.val('-1')
							.text('Others'));
				}).fail(function(jqXHT, statusResponse){
					
					alert(statusResponse);
				});
				}
	else if(typeval == 2)
	{
		
				$.ajax({
		type: 'POST',
		url: '/DLI/degreeTypes',
		data:{type:typeval}
	}).done(function(response){
		var select = $("#degree");
		select.html('');
		response = eval(response);
		$.each(response, function(index, obj) {
			//alert("id: "+obj.numDegreeId+ "name : " +obj.strDegreeName);
			if(obj.strDegreeName == "MD" || obj.strDegreeName =="MS" || obj.strDegreeName =="DNB"){
			select.append($('<option/>')
					.val(obj.numDegreeId)
					.text(obj.strDegreeName));
			 
			}
			 
		});
		select.append($('<option/>')
				.val('-1')
				.text('Others'));
	}).fail(function(jqXHT, statusResponse){
		
		alert(statusResponse);
	});
	}
	else if(typeval == 3)
	{
	$('#PhD').show();
	$('#otherDegree').hide();
	$.ajax({
		type: 'POST',
		url: '/DLI/degreeTypes',
		data:{type:typeval}
	}).done(function(response){
		var select = $("#degree");
		select.html('');
		response = eval(response);
		$.each(response, function(index, obj) {
			
			select.append($('<option/>')
					.val(obj.numDegreeId)
					.text(obj.strDegreeName));
		});
	}).fail(function(jqXHT, statusResponse){
		
		alert(statusResponse);
	});
	}
	else if(typeval == 5)
	{
		
				$.ajax({
		type: 'POST',
		url: '/DLI/degreeTypes',
		data:{type:typeval}
	}).done(function(response){
		var select = $("#degree");
		select.html('');
		response = eval(response);
		$.each(response, function(index, obj) {
			//alert("id: "+obj.numDegreeId+ "name : " +obj.strDegreeName);
			if(obj.numDegreeId ==4245 || obj.numDegreeId ==3828){
			//if(obj.strDegreeName == "doctor of medicine(DM)" || obj.numDegreeId ==4245){
			select.append($('<option/>')
					.val(obj.numDegreeId)
					.text(obj.strDegreeName));
			 
			}
			 
		});
		select.append($('<option/>')
				.val('-1')
				.text('Others'));
	}).fail(function(jqXHT, statusResponse){
		
		alert(statusResponse);
	});
	}
		
	else{
		$('#second_row').show();
		$('#PhD').hide();
		$('#otherDegree').hide();
		$('#degree').attr('disabled', false);
	$.ajax({
		type: 'POST',
		url: '/DLI/degreeTypes',
		data:{type:typeval}
	}).done(function(response){
		var select = $("#degree");
		select.html('');
		response = eval(response);
		$.each(response, function(index, obj) {
			select.append($('<option/>')
					.val(obj.numDegreeId)
					.text(obj.strDegreeName));
		});
		
		select.append($('<option/>')
				.val('-1')
				.text('Others'));
		
	}).fail(function(jqXHT, statusResponse){
		
		alert(statusResponse);
	});}
		});

	}
	
	function goprev()
	{
		document.frm.action="/DLI/prevRedirectPage";
		document.frm.method="POST";
		document.frm.submit();
	}


	function gonext()
	{
		//alert("scheme = "+$('#numScheme').val());
		document.frm.action="/DLI/nextRedirectPageWithoutModel?schid="+$('#numScheme').val()+"&currprocessid="+$('#strCurrentProcessId').val()+"&proid=0&version=0&numProposalSeq=0&strFormStatus=SAVEASDRAFT";
		document.frm.method="POST";
		document.frm.submit();
	}

	
	
$(document).ready(function(){	
	//custom usage
	$("#remarks").charCount({
		allowed: 500,		
		warning: 10,
		counterText: 'Characters left:  '	
	});
});

</script>


	<script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.easyui.js"></script>
	<script
		src="/DLI/resources/app_srv/msip/gl/jssrc/ValidationFunctions.js"
		type="text/javascript"></script>


	<script>
  
  $('#subject').validatebox({
	    required: true,
	    validType: ['AlphaNumeric','maxLength[50]']
	});
  

  $('#percentage').validatebox({
	    required: false,
	    validType: ['maxLength[5]']
	});
  
  $('#strThesisSubject').validatebox({
	    required: false,
	    validType: ['maxLength[50]']
	});
  
  $('#division').validatebox({
	    required: false,
	    validType: ['AlphaNumeric','maxLength[50]']
	});
  
  $('#remarks').validatebox({
	    required: false,
	    validType: ['AlphaNumericWithSpecial','maxLength[500]']
	});
  
  $('#institute').validatebox({
	    required: true,
	    validType: ['AlphaNumeric','maxLength[50]']
	});
  $('#year').validatebox({
	    required: true,
	    validType: ['Numeric','minLength[4]','maxLength[4]']
	});
  

 
  
 
   
		function submit_form()
		{
		document.getElementById("frm").submit();
		}
  
  </script>
</body>
</html>
