<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import=" java.io.File,java.util.*"%>
  <%@ page isELIgnored="false" %>

<html>
<head>




<!-- CSS anf JS for responsive tables -->

 <link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css" rel="stylesheet" type="text/css" />
   <link href="/DLI/resources/app_srv/msip/gl/theme/footable.sortable-0.1.css" rel="stylesheet" type="text/css" />
  <link href="/DLI/resources/app_srv/msip/gl/theme/footable.paginate.css" rel="stylesheet" type="text/css" />
  
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/data-generator.js" type="text/javascript"></script>
 
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sortable.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter.js" type="text/javascript"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate.js" type="text/javascript"></script>
   
  <link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
  
   <style>
		.error {
    		color: #E94646;
    		font-style: italic;
    		font-size: 70%;
    	}
	</style>
	
	<style>
	.buttonnew {
  		display: inline-block;
  		padding: 10px 15px;
  		font-size: 15px;
  		cursor: pointer;
  		text-align: center;
  		text-decoration: none;
  		outline: none;
  		color: #fff;
  		background-color: #4CAF50;
  		border: none;
  		border-radius: 15px;
  		box-shadow: 0 9px #999;
	}

	.buttonnew:hover {background-color: #3e8e41}

	.buttonnew:active {
  		background-color: #3e8e41;
  		box-shadow: 0 5px #666;
  		transform: translateY(4px);
}
</style>
   
   <script>
		$(document).ready( function() {
        $('#userinfo-message').delay(5000).fadeOut();
        
      });
               
	</script>
	
	<script type="text/javascript">
    $(function() {
      $('table').footable();
    });
    </script>
    
    <script>
    
    $(document).ready(function(){
    	if('${errormsg}'!='')
    		{
    		alert("error msg present");
    		$('#modal1').modal('show');	
    		}
    })   
    
    </script>
    
    <script>
    $(document).on('click','#Edit',function(e){
    	
    	
    	
    	
    });	
    
    
    </script>

	<script>
	function openPopUp() 
    { 
		alert("open popup jsp")
      $('#modal1').css('display','block'); 
      $('#modal1').dialog(); 
    } 
	
	</script>
	
	
	
	<script>
		function OpenEditWindow(paramuserid, parampropid) {
	
			/* var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});  */
			
			alert("userid == "+paramuserid+" , propossalid == "+parampropid)
			
			var urlparams = ""+paramuserid+parampropid;
			var params = DataEncoder.encode(urlparams.toString());
			
			var myWindow = window.open("/DLI/UpdateApplicantCompany?param="+params, '_blank');
    		
		}
    </script>
	
	
	
	
	
	
</head>

<body>

<form:form name= "form"  id= "form" method="post" action="" modelAttribute="EditApplicantDetailForm">

<c:if test="${Message != null && Message != ''}">
	<div id="userinfo-message"><p class="msg msgbg">${Message}</p></div> 
</c:if>	


<article class="row">
	<section class="whole">
    	<div class="align-center">
            <h4 class="asphalt pad-top">List of Company Submitted Proposals</h4>
       	</div>
     	<div class="row">
    		<div class="grey_border rounded padded gapped">
		 	<fieldset>
   				<legend class="info">Proposal/Company Details</legend>
    			<div class="whole">
	 				<div class="one half"> 
	 					<div class="one sixth"> Search:</div> 
	 					<div class="five sixth"> <input id="filter" type="text" /></div>
					</div>
					
      				<table class="footable blue" data-filter="#filter" data-page-size="20"  id="tab1">
						<thead>
          					<tr>
		  						<th data-sort-initial="false">
								<%int i=0; %>
          							
          						</th>
            					<th data-class="expand" data-sort-initial="true">
           							Company Name
            					</th>
								<th data-hide="phone">Application Id</th>
             					<th data-hide="phone">Applicant UserId</th>
                          		<th data-hide="phone">Status</th>
          						<th>Edit company</th>
          					</tr>
						</thead>
						
						<tbody>
		     				<c:forEach items="${datalist}" var="list">  
          					<tr>
          						<td><input type="radio" class="radio" name="radio" value="${list.numApplicantUserid}"/></td>
            					<td>${list.strCompanyName}</td> 
             					<td>${list.numProposalId}</td>
            					<td>${list.numApplicantUserid}</td>
            					<td>${list.status}</td>
 
  								<td>
  									<div id="Edit" class="nav navbar-nav pull-right">
  									<!-- <a href="#" class="no-line">
    										<i class="icon-edit asphalt tooltip" title="Edit"></i>
  									</a> -->
  									<!-- <a href="#" data-target="#modal1" data-toggle="modal" class="yellow font_16">
										<i class=""></i>Edit Company
									</a> -->
									
									<!-- <a href="javaScript:{openPopUp();}">Edit Company</a>  -->
  										<input type="button" class="buttonnew" 
												onclick="OpenEditWindow(${list.numApplicantUserid},${list.numProposalId})" 
														value="Edit Company" />
  									</div>
  									

    
								</td>
    						</tr>
     						<%++i; %>
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



</body>
</html>