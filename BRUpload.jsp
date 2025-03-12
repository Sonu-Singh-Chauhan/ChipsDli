<%@ page isELIgnored="false" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
  
 <link href="/DLI/resources/app_srv/msip/gl/theme/footable-0.1.css" rel="stylesheet" type="text/css" />
 <link href="/DLI/resources/app_srv/msip/gl/theme/footable.sortable-0.1.css" rel="stylesheet" type="text/css" />
 <link href="/DLI/resources/app_srv/msip/gl/theme/footable.paginate.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.js" type="text/javascript"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.sortable.js" type="text/javascript"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.filter.js" type="text/javascript"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/libs/footable.paginate.js" type="text/javascript"></script>
  
  
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.ui.widget.js"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.iframe-transport.js"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.fileupload.js"></script>
	<script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.easyui.js"></script>
 <script src="/DLI/resources/app_srv/msip/gl/jssrc/ValidationFunctions.js"  type="text/javascript"></script>
	<!-- bootstrap just to have good looking page -->
 <script src="/DLI/resources/app_srv/msip/gl/jssrc//bootstrap.min.js"></script>
	
	<!-- we code these -->
 <%@ page import="in.cdacnoida.msips.gl.misc.ResourceBundleFile" %>
	
	<%!
 	public String FOLDERPATH = ResourceBundleFile.getValueFromKey("DOCUPLOADPATH");	
	public String contextpath = ResourceBundleFile.getValueFromKey("CONTEXT_PATH");	
	%>

	<%!
 	public String DOCUMENTNAME = "";	
	%>	
 <script> 
 $(function() {
	 $('table').footable();
	 $('#ProposalId').val('${ProposalId}'); 
	 
    });
 
  </script>	
 <script>
 function removeBorder(id)
 {
	 $('#'+id).removeClass('red-border');
 }
 </script>
 
  
  
  <script>
  $(function () {
	  
	  populateBRDoc();
	
	/*   var fromdate = '${fromdate}';
	  var todate = '${todate}';
	  alert(fromdate); */
	  $('#uploadpr').fileupload({
		    submit: function (e, data) {
	  			data.url = '/DLI/uploadBR/'+$('#ProposalId').val()+'/'+$('#numPRId').val()+'/'+$('#strFileName').val();
			},
			
     done: function (e, data) {

     	if (data.result == 1){
     	alert("Please upload only Image files");
     	}
     	if (data.result == 2){
     	alert ("File size exceeds 10 MB");
     	}
     	if (data.result == 3){
     	alert("There was some error uploading files");
     	}
     	if (data.result == 0){
     	 $('#progress-rtgs .bar').css('width','100%');
     	
     	$('#strFileName').val("");
     	populateBRDoc()
     	
    	$("#dataTable-rtgs").trigger("liszt:updated");
    	/* added by madhuresh */ 
    	alert("File Uploaded Successfully ");
    	//window.parent.$.magnificPopup.close();
     	}
     	             
     }
	        
	    });
	    
	});
  </script>
 
  
  
  
 <script>
  function RemoveBR(ProposalId,numPRId,docid){
	  
	  
	  var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});	

	  if(confirm("Are you sure you want to remove the uploaded JPEG File?"))
		  {
		$.ajax(
      {
	        type: "POST",
	        url: "/DLI/RemoveUploadedBR/"+ProposalId+"/"+numPRId+"/"+docid,
	        success: function(response){   
	        	
	        	
	        	//alert(response);
	        	populateBRDoc();
	        },
	        
	        error: function(e){
	        	alert('Error: ' + e);
      	}
      
      });
		  }
}
  </script>
</head>
  <body>

  <input type="hidden" id="ProposalId" value="${ProposalId}">
  <input type="hidden" id="numPRId" value="${numPRId}">
  

  <script type="text/javascript">
 function populateBRDoc(){

	 var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});	
	 
	  $.ajax({
	        type: "POST",
	        url: "/DLI/getBRFTPFiles?ProposalId="+$('#ProposalId').val()+"&numPRId="+$('#numPRId').val(),
	        success: function(response){    
	        	
	        	$("#uplaoded").find("tr").remove();
	 			for(var i = 0; i < response.length; i++)
	 			{
	 				var savedocname=response[i].documentName; 				
	 				var ext = savedocname.substring(savedocname.lastIndexOf(".")+1,savedocname.length);

	 				$("#uplaoded").append("<tr><td><a href='/DLI/FindAbstractFile?FileName="+$('#numPRId').val()+"_"+response[i].numDocuumentId+"."+ext+"&Path=dhrupload/current/proposals/"+$('#ProposalId').val()+"/Monitoring/BR/'>"+response[i].documentName+"</a></td><td><a href='#' onclick='RemoveBR("+$('#ProposalId').val()+","+$('#numPRId').val()+","+response[i].numDocuumentId+")'><i title='Delete' class='pad-left icon-remove-sign asphalt tooltip'></i></a></td></tr>");
	 			}	
	
	        },
	        error: function(e){
	        	alert('Error: ' + e);
    	}
    
   });	 
	  
 }
  
  </script>
   <div class="align-center">
            <h4 class="asphalt pad-top">
              Upload File
            </h4>
          </div>
          <div class="whole pad-bottom">
           	   	<div  id = "notetext" class="success message">Upload the File. Only <span class="red">JPEG</span> file are allowed and the size of the file should <span class="red">not be greater than 500 KB.</span></div>
           	   </div>  
  <fieldset>
  
<div class="whole">
	<div class="one fourth"></div>
	<div class="one fourth"><label id="UploadStatus">File Name:</label></div>
	<div class="one fourth"><input type="text" name="strFileName" id="strFileName" maxlength="50"></div>
	<div class="one fourth"></div>
</div>
  
<div class="whole">
<div class="one fourth"></div>
	<div class="one fourth"><label id="YearLabel">Upload File:</label></div>
	<div id="image" class="whole pad-top hide align-center">
<center>
<img src="/DLI/resources/app_srv/msip/gl/images/loading.gif" alt="loading" class="middle" />
</center>
</div>
     <div class="one fourth"><input id="uploadpr" type="file" name="files-rtgs[]" data-url="" accept="image/jpeg" /></div>
	<div class="one fourth"></div>
</div>
<div class="whole">
	<div class="one fourth"></div>
	<div class="one fourth"><label id="UploadStatus">Upload Status:</label></div>
	<div class="one fourth"><div id="progress-rtgs" class="progress">
    	<div class="bar" style="width: 0%;"></div>
	</div></div>
	<div class="one fourth"></div>
</div>

  
  
 <div class="align-center">
		<!-- <input type="button" id="Add-rtgs" value="Save" class="blue gap-right"> --><input type="button" id="Close" value="Close" class="blue gap-right" onclick="window.parent.$.magnificPopup.close();">
		</div>
		
		 <fieldset>
    <legend class="info">
     Saved File Details
    </legend>
    <div class="whole">
	 <div class="one half"> 
	 <div class="one sixth"> Search:</div> <div class="five sixth"> <input id="filter" type="text" /></div>
	</div>
      <table class="footable blue" data-filter="#filter" data-page-size="5"  id="dataTable-rtgs">
		<thead>
          <tr>
                      
            <th data-hide="phone">
              Document Name
            </th>
                
             <th data-hide="phone">
              Delete
            </th>
          </tr>
		</thead>
		<tbody id="uplaoded">
  </tbody>
</table>
</div> <!--end of div before table-->
</fieldset>
 
  
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
  </body>
