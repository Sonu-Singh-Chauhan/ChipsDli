<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import=" java.io.File,java.util.*"%>
 <%@ page isELIgnored="false" %>

  
  
  
<!-- CSS anf JS for responsive tables -->

 <link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css" rel="stylesheet" type="text/css" />
 <link href="/DLI/resources/app_srv/msip/gl/theme/footable.sortable-0.1.css" rel="stylesheet" type="text/css" />
 <link href="/DLI/resources/app_srv/msip/gl/theme/footable.paginate.css" rel="stylesheet" type="text/css" />
  
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/data-generator.js" type="text/javascript"></script>
 
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sortable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate.js" type="text/javascript"></script>
  <script type="text/javascript">
    $(function() {
      $('table').footable();
    });
    $("#reset").click(function() {
        alert("hello"); // id of clicked li by directly accessing DOMElement property
        
    });
    
    function changeValues()
    {
    	 $('#numBroadAreaId').val(0);
    	
    }
    
  </script>
  <style>
.error {
    color: #E94646;
    font-style: italic;
    font-size: 70%;
   
}
</style>


   <script>
$(window).load(function(){
$(function () {
$('#Save').click(function () {
var result = $( "#select-result" ).empty();	//Variable to store the Process Names
var n = $("#numBroadAreaId option:selected").map(function(){return $(this).val()}).get().join(", ");
result.append(n);
});
});
});

</script>
        <script>
$(document).ready( function() {
        $('#userinfo-message').delay(5000).fadeOut();
      });
               
</script>
  
  <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">
  
  </head>
  <body>
<form:form method="post" id="broadAreaSubAreaForm" name="broadAreaSubAreaForm" modelAttribute="broadAreaSubAreaForm">

	<div id="userinfo-message">
  
 <c:set var="message" scope="session" value="${Message}"/>
            		<c:choose>
            			<c:when test="${message == 'Saved' }"><p class="info message  pad-bottom">Saved successfully.</p></c:when>
            			<c:when test="${message == 'Deleted' }"><p class="info message  pad-bottom">Deleted successfully.</p></c:when>
            			<c:when test="${message == 'Modified' }"><p class="info message  pad-bottom">Modified successfully.</p></c:when>
            			<c:when test="${message == 'Error' }"><p class="error message  pad-bottom">Sorry.. an error occured.</p></c:when>
            			<c:when test="${message == 'Message Delete' }"><p class="error message  pad-bottom">Please select at least one record to delete.</p></c:when>
            			
            	</c:choose>
            	</div>   
        <article class="row">
        
        <section class="whole">
          <div class="align-center">
            <h4 class="asphalt pad-top">
        Broad Area Sub Area
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
<div class="whole pad-bottom">
<div class="one half centered">
		 <div class="two sixth">
<form:label path="numBroadAreaId">Broad Area Name</form:label>
		</div>
		<div class="four sixth pad-top-half">

<form:select path="numBroadAreaId" id="numBroadAreaId" name="numTest" class="chzn-select whole">
 <form:option value="0">-------------------------Select BroadArea---------------------------</form:option>
<c:forEach items="${broadAreaList}" var="bal">
<form:option value="${bal[0]}">${bal[1]}</form:option>
</c:forEach>
</form:select>
<form:errors path="numBroadAreaId" cssClass="error" />
		</div> 
		
		</div><!--  end of one half div -->
</div>

<div class="whole pad-bottom">
<div class="one half centered">
<div class="two sixth">
<form:label path="numSubAreaId">Sub Area</form:label>
		</div>
		<div class="four sixth">
  <select id="numSubAreaId" name="numSubAreaId"  multiple class="chzn-select whole">
<c:forEach items="${subAreaList}" var="sal">
<option value="${sal[0]}">${sal[1]}</option>
</c:forEach>
</select>
<form:errors path="numSubAreaId" cssClass="error" />
		</div>
</div> <!--  end of one half div -->
</div>

	

</div> <!-- end of whole div-->
 <script>changeValues();</script>
        
    <div class="whole pad-top">
		<div class="align-center">
		<input type="button" id="Save" name="Save" value="Save" class="blue gap-right"/><input type="button" value="Reset" class="blue" id="reset"/>
		
		</div>
		</div>
      

		 <fieldset>
    <legend class="info">
     Sub Area Details
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
            
            <th data-hide="phone" data-sort-initial="true">
         Broad Area Name
            </th>
			
			
			<th data-class="expand">
              Sub Area Name
            </th>
		              
          </tr>
		</thead>
		<tbody>
		     <c:forEach items="${mapping}" var="l">  
          <tr>
          <td><input type="checkbox" class="CheckBox" id="mappingCheckBox" name="mappingCheckBox" value="${l.numMappingId}"/></td>
		     <td>${l.broadAreaMap.strBroadAreaDesc}</td>
             <td>${l.subArea.strSubAreaDesc}</td> 
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

<script>
$('#Save').click(function(){
	var result=$('#numBroadAreaId').val();
	var result1=$('#numSubAreaId').val();
	//alert(result);
	//var numBroadAreaId = document.getElementById("numBroadAreaId");
	//var selectedText = numBroadAreaId.options[numBroadAreaId.selectedIndex].text;
	//alert("blah"+selectedText);
	
	if(result==0)
		{
		alert("please select a broad area");
		}
	
	else if(result1==null)
		{
	    alert("please select some sub areas");
		}
	
    if((result!=0) && (result1!=null)){
    submit_form();
    }  
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
		        $("#userinfo-message").show().delay(3000).fadeOut();
		    }
		    }
	    else{
	        alert("Please at least one of the checkbox");  
	}
	 
});




function submit_form()
{
document.broadAreaSubAreaForm.action = "/DLI/saveBroadAreaSubArea";
document.getElementById("broadAreaSubAreaForm").submit();
}

function submit_form_delete()
{
document.broadAreaSubAreaForm.action = "/DLI/deleteBroadAreaSubArea";
document.getElementById("broadAreaSubAreaForm").submit();
} 
</script> 


</body>
</html>