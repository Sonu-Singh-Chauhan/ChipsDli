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
  
<!--  <script>
 function resetValues(){
	 $('#strBEGenericName').val("");
	$('#strBEMake').val("");
	$('#strBEModelNo').val("");		
	$('#strBEImported').val("");
	$('#numBEEstimatedCostINR').val("");
	$('#strEquipCostWithoutTax').val("");
	$('#strTaxes').val("");
	$('#numBEEstimatedCostFC').val("");
	$('#strBESpareTime').val("");
	$('#strQuantity').val("");
	$('#numExchangeRate').val("");
 
 	$("#uploaded-files").find("tr:gt(0)").remove();
		        $('#progress .bar').css(
			        'width',
			        0 + '%'
			     );
 }
 
 function isimport(val)
{
   if(val=="N") 
   {
     document.getElementById('strBEImported').value='N';
     
     //  document.getElementById('strIntsa').value="";
     
	   //$('#currency11').hide();
	  // $('#currency21').hide();
	  // $('#foreign').hide();
	   
	   $('#numBEEstimatedCostFC').val("0");
	   $('#numExchangeRate').val("0");
		$('#numCurrencyUnit').val("0");
	   $('#currency12').show();	
	   //$('#currency22').show();	
   }
    else
   {
    document.getElementById('strBEImported').value='Y';
    
	  // $('#currency11').show();
	   //$('#currency21').show();
	 //  $('#foreign').show();
	   //document.getElementById('numSubArea').value="0"; 
	   $('#currency12').hide();	
	   //$('#currency22').hide();	
	   
   }
}
 
 </script> -->
 <script>
 function removeBorder(id)
 {
	 $('#'+id).removeClass('red-border');
 }
 </script>
  <script>
  function Remove(proposalId, equipmentId){
  	$.ajax(
  	{
  			type: "POST",
	        url: "/DLI/controller/removeEquipmentTemporary/"+proposalId+"/"+equipmentId,
	        success: function(){
		        $("#uploaded-files").find("tr:gt(0)").remove();
		        $('#progress .bar').css(
			        'width',
			        0 + '%'
			     );
	        },
	        
	        error: function(e){
	        alert("Error while removing equipment quotation");
        	}
  	});
  }
  
  </script>	
  
  <script>
  function RemoveDocument(ProId, RefNo, NumId)
  {
	  //alert(ProId+", "+RefNo+", "+NumId);
	  if(confirm("Are you sure you want to remove the uploaded quotation?"))
	  {
	$.ajax(
  {
        type: "POST",
        url: "/DLI/controller/RemoveQuotaion/"+ProId+"/"+RefNo+"/"+NumId,
        success: function(response){   
        	alert(response);
        	if(response == 'File Removed succefully')
        		{
        	$("#dataTable").find("tr:gt(0)").remove();
        		}
        		},
        
        error: function(e){
        	alert('Error: ' + e);
  	}
  
  });
	  }
  }
  </script>
  
  <script>
  $(function () {
	    $('#uploadrtgs').fileupload({
		    submit: function (e, data) {
	  			data.url = '/DLI/uploadChangeRTGS/'+$('#ProposalId').val()+'/'+$('#copiid').val();
			},
     
     done: function (e, data) {

     	if (data.result == 1){
     	alert("Please upload only PDF files");
     	}
     	if (data.result == 2){
     	alert ("File size exceeds 10 MB");
     	}
     	if (data.result == 3){
     	alert("There was some error uploading files");
     	}
     	if (data.result == 0){
     	 $('#progress-rtgs .bar').css('width','100%');
     	
     	 $("#uplaoded").find("tr").remove();
    	$("#uplaoded").append("<tr><td><a href='/DLI/FindAbstractFile?FileName=RTGS_"+$('#ProposalId').val()+"_"+$('#copiid').val()+".pdf&Path=dhrupload/current/proposals/"+$('#ProposalId').val()+"/TempDocs/'>RTGS Detail</a></td><td><a href='#' onclick='RemoveRTGS("+$('#ProposalId').val()+","+$('#copiid').val()+")'><i title='Delete' class='pad-left icon-remove-sign asphalt tooltip'></i></a></td></tr>");
    	
    	$("#dataTable-rtgs").trigger("liszt:updated");
    	/* added by madhuresh */ 
    	alert("File Uploaded Successfully ");
    	window.parent.$.magnificPopup.close();
     	}
     	             
     }
	        
	    });
	    
	});
	
	
  
  </script>
   <script>
  $(function () {
	    $('#uploadend').fileupload({
		    submit: function (e, data) {
	  			data.url = '/DLI/uploadCOPIEnd/'+$('#ProposalId').val()+'/'+$('#copiid').val();
			},
     
     done: function (e, data) {

     	if (data.result == 1){
     	alert("Please upload only PDF files");
     	}
     	if (data.result == 2){
     	alert ("File size exceeds 10 MB");
     	}
     	if (data.result == 3){
     	alert("There was some error uploading files");
     	}
     	if (data.result == 0){
     	 $('#progress-rtgs .bar').css('width','100%');
     	
     	 $("#uplaoded").find("tr").remove();
    	$("#uplaoded").append("<tr><td><a href='/DLI/FindAbstractFile?FileName=COPIEND_"+$('#ProposalId').val()+"_"+$('#copiid').val()+".pdf&Path=dhrupload/current/proposals/"+$('#ProposalId').val()+"/COPITemp/'>Endorsement Certificate</a></td><td><a href='#' onclick='RemoveEND("+$('#ProposalId').val()+","+$('#copiid').val()+")'><i title='Delete' class='pad-left icon-remove-sign asphalt tooltip'></i></a></td></tr>");
    	
    	$("#dataTable-rtgs").trigger("liszt:updated");
    	/* added by madhuresh */ 
    	alert("File Uploaded Successfully ");
    	window.parent.$.magnificPopup.close();
     	}
     	             
     }
	        
	    });
	    
	});
	
	
  
  </script>
  <script>
  function RemoveEND(ProposalId,copiid){
	 // alert("remove "+ProposalId);
	  if(confirm("Are you sure you want to remove the uploaded Endorsement Certificate?"))
		  {
		$.ajax(
      {
	        type: "POST",
	        url: "/DLI/RemoveChangedEND/"+ProposalId+"/"+copiid,
	        success: function(response){   
	        	alert(response);
	        	$("#uplaoded").find("tr").remove();
	        },
	        
	        error: function(e){
	        	alert('Error: ' + e);
      	}
      
      });
		  }
}
  </script>
  <%-- <script>
$(document).on('click','#Add-rtgs',function(e){
	
	var plId = $('#ProposalId').val();
	// alert("add "+plId);
	 
		   
				
					$("#uplaoded").find("tr").remove();
					$.ajax(
					        {
						        type: "POST",
						        url: <%=contextpath%>+"CheckRTGS",
						        data: "proId=" +plId,
						        success: function(response){
						        //	alert("check rtgs "+response);
										if(response==1){	
											$("#uploaded-files-rtgs").find("tr:gt(0)").remove();
									        $('#progress-rtgs .bar').css(
										        'width',
										        0 + '%'
										     );
									        
											$.ajax({
												        type: "POST",
												        url: <%=contextpath%>+"RTGSSave",
												        data: "proId=" +plId,
												        success: function(response){
												        	
												        	alert(response);
												        	$("#uplaoded").find("tr").remove();
												        	$("#uplaoded").append("<tr><td><a href='getUploadedRTGS/"+plId+"' target='_new'> RTGS Details </a></td><td><a href='#' onclick='RemoveRTGS("+plId+")'><i title='Delete' class='pad-left icon-remove-sign asphalt tooltip'></i></a></td></tr>");
												        	$("#dataTable-rtgs").trigger("liszt:updated");
												        	
												        	
												        },
												        
												        error: function(e){
												        	alert('Error: ' + e);
												    	}
												    
												    });
								    			}
								    			else{
								    				alert("Please upload the document");
								    			}
							        },
							        
							        error: function(e){
						        	}
						        
						        });
								    
					
					
	
	
});
 
 </script> --%>

   </head>
 
  <body>
  <input type="hidden" id="ProposalId" value="${ProposalId}">
  <input type="hidden" id="copiid" value="${copiid}">
   <script type="text/javascript">
   $(document).ready(function(){
	   alert($('#copiid').val());
	   var data1= false;
	   var data2 = false;
	   $.ajax({
	        type: "POST",
	        url: "/DLI/checkFTPFiles?ProposalId="+$('#ProposalId').val()+"&copiid="+$('#copiid').val(),
	        success: function(response){    
	        	$.each(response, function(key, value){
	        	    if(key=='rtgs'){
	        	    	data1	=value;
	        	    }
	        	    if(key=='end')
	        	    	{
	        	    	data2 = value;
	        	    	}
		     });
	        	if(data2)
	   {
  		$("#uplaoded").find("tr").remove();
	 	$("#uplaoded").append("<tr><td><a href='/DLI/FindAbstractFile?FileName=END_"+$('#ProposalId').val()+"_"+$('#copiid').val()+".pdf&Path=dhrupload/current/proposals/"+$('#ProposalId').val()+"/TempDocs/'>Endorsement Certificate</a></td><td><a href='#' onclick='RemoveRTGS("+$('#ProposalId').val()+","+$('#copiid').val()+")'><i title='Delete' class='pad-left icon-remove-sign asphalt tooltip'></i></a></td></tr>");
 		}
	        },
	        error: function(e){
	        	alert('Error: ' + e);
    	}
    
   });	 
 		});
  
  </script>
  
  <div class="align-center">
            <h4 class="asphalt pad-top">
              Upload Endorsement Certificate
            </h4>
          </div>
          <div class="whole pad-bottom">
           	   	<div class="success message">Only <span class="red">PDF</span> files are allowed and the size of the file should <span class="red">not be greater than 10 MB.</span></div>
           	   </div>  
  <fieldset>
<div class="whole">
<div class="one fourth"></div>
	<div class="one fourth"><label id="YearLabel">Upload File:</label></div>
	<div id="image" class="whole pad-top hide align-center">
<center>
<img src="/DLI/resources/app_srv/msip/gl/images/loading.gif" alt="loading" class="middle" />
</center>
</div>
     <div class="one fourth"><input id="uploadend" type="file" name="files-rtgs[]" data-url="" accept="application/pdf" /></div>
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
<div id="image" class="whole pad-top hide align-center">
    <center>
<img src="/DLI/resources/app_srv/msip/gl/images/loading.gif" alt="loading" class="middle">
</center>
</div>
  
  
 <div class="align-center">
		<!-- <input type="button" id="Add-rtgs" value="Save" class="blue gap-right"> --><input type="button" id="Close" value="Close" class="blue gap-right" onclick="window.parent.$.magnificPopup.close();">
		</div>
		
		 <fieldset>
    <legend class="info">
     Endorsement Certificate Detail
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
		<c:if test="${updet != null}">
		<tr>
		<td><a href="getUploadedRTGS/${updet.numProposalId}/${copiid}" target="_new"> RTGS Details </a></td>
		<td><a href="#" onclick="RemoveRTGS(${updet.numProposalId},${copiid})"><i title='Delete' class='pad-left icon-remove-sign asphalt tooltip'></i></a></td>
		</tr> 
		</c:if>
  </tbody>
 
</table>
</div> <!--end of div before table-->
</fieldset>
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

