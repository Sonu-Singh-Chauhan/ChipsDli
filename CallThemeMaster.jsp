<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import=" java.io.File,java.util.*"%>
 <%@ page isELIgnored="false" %>
    
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
  <script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/charCount.js"></script>
  
   <link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
   <script type="text/javascript">
     $(function() {
       $('table').footable();
       
       $("#strThemeName").charCount({
   		allowed: 6000,		
   		warning: 10,
   		counterText: 'Characters left:  '	
   	});
     });
        
  </script>

   <script>
$(document).ready( function() {
        $('#userinfo-message').delay(5000).fadeOut();
        resetval();
      });
               
</script>
   
	<script>
	
							
					
					$(document).on('click','#Edit',function(e){
						 $("#Save").prop("style").display="none";
				    	 $("#Update").show();
						var resultArray1 = $(this).closest('tr').find('td').map( function()
								{
								return $(this).text();
							}).get();
						
						var checkID = $(this).closest('tr').find('input[type=checkbox]').map( function()
								{
								return $(this).val();
							}).get();
							
					   $('#numCallThemeId').val(checkID);
					   $('#numSpecialCallId').val(resultArray1[1]);
                    	$("#numSpecialCallId").trigger("liszt:updated");
						$('#strThemeName').val(resultArray1[3]);
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
				
					function resetval()
					{
						document.getElementById("numSpecialCallId").value=0;
						document.getElementById("numCallThemeId").value=0;
						document.getElementById("strThemeName").value="";
						$('.chzn-select').val(0).trigger('liszt:updated');
					
					}  
					
  </script>
  
     <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">
  
  </head>
  <body onload="resetval()">
<form:form name="form" id="form" method="post" action="" modelAttribute="callThemeForm">
	 <c:if test="${Message != null && Message != ''}">
       				           <div id="userinfo-message"><p class="msg msgbg">${Message}</p></div> 
        </c:if>	
        <article class="row">
        
        <section class="whole">
          <div class="align-center">
            <h4 class="asphalt pad-top">
                Call wise Theme
            </h4>
          </div>
		   
              <div class="row">
    
          <div class="grey_border rounded padded gapped">
           
               
              <div class="whole"><!--first row-->
<form:hidden path="numCallThemeId" value="0"/>              
<div class="whole">
<div class="one half centered">
		<div class="five sixth pad-top-half">
			
		</div> 
		
		</div><!--  end of one half div -->
</div>
<div class="whole">
<div class="one half centered">
		 <div class="two sixth">
<form:label path="numSpecialCallId">Special Call Name</form:label>
		</div>
		
		
		
		
		<div class="four sixth pad-top-half">
		<form:select path="numSpecialCallId" id="numSpecialCallId" class="chzn-select whole">
			<form:option value="0">Select Special Call</form:option>
			<c:forEach items="${CallList}" var="l">
				<form:option value="${l.numSpecialCallId}">${l.strSpecialCallTitle}</form:option>
			</c:forEach>
		</form:select>
	</div> 
		</div><!--  end of one half div -->
</div>		                 
<br>
<div class="whole">
<div class="one half centered">
<div class="two sixth pad-top gap-top">
<form:label path="strThemeName">Theme Name</form:label>
		</div>
		<div class="four sixth pad-top gap-top">
<form:textarea path="strThemeName" id="strThemeName"></form:textarea>
<form:errors path="strThemeName" cssClass="error" />
		</div>
</div> <!--  end of one half div -->
</div>

	

</div> <!-- end of whole div-->
 
        
      <br>
      
      
      	<div class="whole">
								<!-- sixth row-->
								<div class="one half centered">
									<div class="two sixth pad-bottom gap-bottom">

										<label> Status: </label>
									</div>
									
										<div class="two fourth pad-top pad-bottom gap-bottom">
											
												<form:radiobutton path="toggleA" value="true" id="toggle-on"
													 cssClass="toggle toggle2 toggle-left inline" />
												<form:label path="toggleA" for="toggle-on"
													class="btn inline zero round">
													<span class="pad-left">Active</span>
												</form:label>
												<form:radiobutton path="toggleA" value="false"
													id="toggle-off" cssClass="toggle toggle2 toggle-right" />

												<form:label path="toggleA" for="toggle-off"
													 class="btn round inline zero">
													<span class="pad-right pad-left">Inactive</span>
												</form:label>

											</div>
										


									</div>
								</div>
      
      
      
      
      
		<div class="align-center">
	
		    <input type="button" id="Update" value="Update" class="blue gap-right" name="Update" style="display:none"/>
		    
		<input type="button" id="Save" value="Save" class="blue gap-right gap-top" name="Save"/><input type="reset" value="Reset" id="reset" class="blue gap-top"/>
		
		</div>
      

		 <fieldset>
    <legend class="info">
     Call wise Theme Details
    </legend>
    <div class="whole">
	 <div class="one half"> 
	 <div class="one sixth"> Search:</div> <div class="five sixth whole"> <input id="filter" type="text" /></div>
	</div><div class="one half"><div class="two sixth"></div><div class="four sixth"> <input type="button" id="Delete" value="Delete" class="pull-right blue" name="Delete"></input></div></div>

      <table class="footable blue" data-filter="#filter" data-page-size="20"  id="tab1">
		<thead>
          <tr>
		  <th data-sort-initial="false">
             <input type="checkbox">
	      </th>
          <th data-hide="all"></th>
          <th data-class="" data-sort-initial="true">
           Call Name
           </th>
		   <th data-hide="phone">
              Theme Name
            </th>
            
            <th>Status</th>
		         <th>
		    </th>
		              
          </tr>
		</thead>
		<tbody>
		     <c:forEach items="${CallThemeList}" var="l">  
          <tr>
          <td><input type="checkbox" class="CheckBox" name="CheckBox" value="${l.numCallThemeId}"/></td>
          <td><span class="hide"><c:out value="${l.numSpecialCallId}"></c:out></span></td>
		     <td>${l.strCallName}</td>
             <td>${l.strThemeName}</td>
               <c:choose>
			    <c:when test="${l.toggleA eq 'true'}">
					<td class="nobreak">Active</td>
				 </c:when>
				 <c:when test="${l.toggleA eq 'false'}">
					 <td class="nobreak">Inactive</td>
				</c:when>
										   
			</c:choose> 
       
  <td>
  <div id="Edit" onclick="changeButton()">
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
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/ValidationFunctions.js" language="JavaScript" type="text/javascript"></script>
<script>
$('#strThemeName').validatebox({
    required: true,
    validType: ['minLength[1]','maxLength[6000]']
});

</script>
<script>
	
    
			    $('#Save').click(function()
			    		{
				 
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
			   	 
				var result= $('#numSpecialCallId').val();
					if(result==0)
					{
					   alert("Please select a Special Call");
					   return false;
					}
					
					if($('#form').form('validate') && (result!=0)){
				    	
						submit_form();
						
				    }  
				});
				
			$('#Update').click(function(){
				
				var istoggle="";
			   	 if($("#toggle-on").prop("checked")==true)
			   		 {
			   		 
			   		 istoggle=true;
			   		 }
			   	 else if($("#toggle-off").prop("checked")==true)
			   	 {
			   	  istoggle=false;

			   	 }
			   	 $('#toggleA').val(istoggle);
					
				var result= $('#numSpecialCallId').val();
				if(result==0)
				{
				   alert("Please select a Special Call");
				   return false;
				}
				
				if($('#form').form('validate') && (result!=0)){
			    	
					submit_form_update(); 
			
			    } });
				

				function reload()
				{
				  $('.chzn-select').val(0).trigger('liszt:updated');
				  
				}
				
				
				  $('#reset').click(function()
						  
							 {
					 			// alert('reset');
							 	 $('#schemename').val('-1');
							 	reload();
							 	$('#strIsTechnical').attr('checked', false);
							 	resetval();
							 	
							 	//document.getElementById("strSchemeName").value="";
							 	//document.getElementById("strCommitteeTypeName").value="";
							 	//document.getElementById("strCommitteeTypeName").value="";
							 	//$('#strIsTechnical').val('0');
									//$("#Save").show();
									//$("#Modify").hide();
							 
				});
				
			$('#Delete').click(function(){
				//alert("in delete");
				    var chkArray = [];
				     
				    $(".CheckBox:checked").each(function() {
				        chkArray.push($(this).val());
				    });
				     
				     
				    var selected;
				    selected = chkArray.join(',') + ","; 
				     
				    if(selected.length > 1){
				  	  if(confirm("Are you sure you want to delete the record"))
					  {
						submit_form_delete();
					  }
				    }else{
				        alert("Please at least one of the checkbox");
				}
				 
			});

				function submit_form_update()
					{
					document.form.action = "/DLI/SaveThemeCall";
					document.getElementById("form").submit();
					}
				function submit_form()
				{
				document.form.action = "/DLI/SaveThemeCall";
				document.getElementById("form").submit();
				}
				function submit_form_delete()
				{
				document.form.action = "/DLI/DeleteCallTheme";
				document.getElementById("form").submit();
				}

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
 <script language="javascript" type="text/javascript">

    //this code handles the F5/Ctrl+F5/Ctrl+R
    document.onkeydown = checkKeycode;
   
    function checkKeycode(e) 
    {
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
           		 if (keycode == 116 || (window.event.ctrlKey && keycode == 82))
            		{
                window.event.returnValue = false;
                window.event.keyCode = 0;
                window.status = "Refresh is disabled";
           			 }
        
       		 } 
        }
			
</script>
</body>
</html>