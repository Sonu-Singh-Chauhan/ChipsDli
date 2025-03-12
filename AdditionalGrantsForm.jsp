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
 
   <link rel="stylesheet" type="text/css" href="/DLI/resources/app_srv/msip/gl/theme/validateBox.css">
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

      <script type="text/javascript">
 
    $(function() {
      $('table').footable();
    });
  </script>

<script>
 $(document).on('click','#Save',function(e){
 var value = $.trim($('#ProposalSequence').find(":selected").val());
 var remarks = $.trim($('#Remarks').val());
 var amount = $.trim($('#Amount').val());
var duration = 0;
 var flag = true;
	if (amount <= 0 || amount == ""){
		flag = false;
	}
	 


 		if(value!=0 && flag){
 			
 			var token = $("meta[name='_csrf']").attr("content");
 	 		var header = $("meta[name='_csrf_header']").attr("content");
 	 		$(document).ajaxSend(function(e, xhr, options) {
 	 			xhr.setRequestHeader(header, token);
 	 		});
 			$.ajax(
				        {
					        type: "POST",
					        url: "/DLI/Extension/Save",
					        data: "numProposalId=" +value+"&strReason="+remarks+"&numDration="+duration+"&numTotalAmount="+amount,
					        success: function(data){
					           alert(data);
					           bringData();
					           $('#Remarks').val("");
					           $('#Amount').val("");
					         },
					        
					        error: function(e){
					        	alert("Invalid Proposal!");
					    	}
			});
			
		}
		else{
			alert("Please input valid data");
		}
	});
 </script>

 <script>
 function bringData(){
  
	 
	 var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
				 var value = "ADL_F";
	       	 $.ajax(
		        {
			        type: "POST",
			        url: "/DLI/GetSubmittedRequestPIDs",
			        data: "requestName=" +value, 
			        success: function(response){
			        	
			        	$('#ProposalSequence').find('option').remove();
			 			var seloption = "<option value='select filenumber'></option>";
			 			for(var i = 0; i < response.length; i++)
			 			{
			 				seloption += "<option value='"+response[i].proposalId+"'>"+response[i].filename+"</option>";
			 			}	        
			 			$('#ProposalSequence').append(seloption);
			 			$("#ProposalSequence").trigger("liszt:updated");
			        	
			        	
			         },
			        
			        error: function(e){
			        	alert("Error in posting path here!");
			    	}
		        
		        });
	      	if($('#Amount').val()==0.0 || $('#Amount').val()==0)
     		 {
     		$('#Amount').val("");
     		 }
	       	 

				        
	}
 
 </script>
 
<script type="text/javascript" src="/DLI/resources/app_srv/msip/gl/jssrc/charCount.js"></script>
  <script> 
 $(document).ready(function(){	
		//custom usage
		$("#Remarks").charCount({
			allowed: 250,		
			warning: 10,
			counterText: 'Characters left:  '	
		});
	});

 </script>

   <link rel="stylesheet" href="/DLI/resources/app_srv/msip/gl/theme/chosen.css">
 
  </head>
  <body onload="bringData()">
 <form:form name="form"  id="form" method="post" action="" modelAttribute="ExtensionRequest">
 
          <article class="row">
        
        <section class="whole">
          <div class="align-center">
            <h4 class="asphalt pad-top">
                Additional Grant
            </h4>
          </div>
           <div class="row">
        
              <div class="grey_border rounded padded gapped whole">
    
          
           

<div class="whole">
<div class="one half centered">
         <div class="one fourth">
<form:label path="numProposalId">File Number<span class="red"><font size="3">*</font></span></form:label>
        </div>
        <div class="three fourth pad-top-half">

<form:select path="numProposalId" id="ProposalSequence" style="width:465px" class="chzn-select">

<form:option value="0">Select Proposal</form:option>

</form:select>
        </div>
        
        </div><!--  end of one half div -->
</div>                         


    
<div class="whole">
<div class="one half centered">
<div class="one fourth">


<form:label path="numTotalAmount">Amount(in INR)<span class="red"><font size="3">*</font></span></form:label>
        </div>
        <div class="three fourth">
<form:input path="numTotalAmount" id="Amount"></form:input>
        </div>
</div> <!--  end of one half div -->
</div>



<div class="whole">
<div class="one half centered">
<div class="one fourth">


<form:label path="strReason" >Remarks<span class="red"><font size="3">*</font></span></form:label>
        </div>
        <div class="three fourth">
<form:textarea path="strReason" id="Remarks"></form:textarea>
        </div>
</div> <!--  end of one half div -->
</div>


     
        
        <div class="whole align-center pad-top">
            <input type="button" id="Update" value="Update" class="blue gap-right" name="Update" style="display:none"/>
            
        <input type="button" id="Save" value="Save" class="blue gap-right" name="Save"/><input type="button" onclick="location.reload(true)" value="Reset" class="blue"/>
    
        </div>
      
</div>
            
</div>
<!-- end of grey border-->


</section>
</article>

</form:form>
<!-- scripts-->

  <script src="/DLI/resources/app_srv/msip/gl/jssrc/jquery.easyui.js"></script>
  <script src="/DLI/resources/app_srv/msip/gl/jssrc/ValidationFunctions.js" language="JavaScript" type="text/javascript"></script>
<script>
$('#ProposalSequence').validatebox({
    required: true,
});

$('#Amount').validatebox({
    required: true,
    validType: ['minLength[1]','maxLength[50]','Numeric']
});
$('#Remarks').validatebox({
    required: true,
    validType: ['minLength[1]','maxLength[50]']
});

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
 
</body>
</html>