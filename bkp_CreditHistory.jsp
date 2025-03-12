<%@page import="in.cdacnoida.msips.gl.misc.AlertMessagesFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="in.cdacnoida.msips.gl.model.UserInfo"%>

<%
	String addToolTip= AlertMessagesFile.getValueFromKey("SAVE_TOOLTIP");
    String nextToolTip= AlertMessagesFile.getValueFromKey("NEXT_TOOLTIP");
    String prevToolTip= AlertMessagesFile.getValueFromKey("PREV_TOOLTIP");
    String deleteToolTip= AlertMessagesFile.getValueFromKey("DELETE_TOOLTIP");
%>

<script>
	$(document).ready(function() {
		$('#userinfo-message').delay(20000).fadeOut();
	});
</script>

<div id="image" class="loader"></div>

	<c:if test="${errormsg!=null && errormsg != ''}">
		<div id="userinfo-message" class="msg msgbg centered">${errormsg}</div>
	</c:if>
	
 	<div class="card card-chart">
  						<div class="card-header" data-background-color="orange">
	                        <h4 class="title"> Credit History </h4>
	                    </div>
	                    
    <div class="card-body">
	<form:form action="SaveCreditHistory" id="reqform2" name="reqform2" method="POST" modelAttribute="temp">
		<fieldset>
           	<legend> Presence of Applicant / Non-Independent Directors / Promoters </legend> 
	 		
		   	<div class="row">
	 			<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12"> 
	 				<div class="form-group">
					<form:label  path="" for="strRBIDefaulterList"  class="">RBI's Defaulter List<font color="red">*</font></form:label>
	 				
	 			 <div class="input-group">
                        <form:label path="" for="strRBIDefaulterList" class="">
    					<form:radiobutton path='' id='button' value="Yes" name='selradio' onclick="" class="option-input radio"  />Yes</form:label>
    					<form:label  path="" for="strRBIDefaulterList"  class="r">
    					<form:radiobutton path="" name="selradio" value="No"  onclick="" class="option-input radio" id="button1" />No</form:label>
				</div></div>
			</div></div> 
			
			<div class="row">
	 			<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12"> 
	 				<div class="form-group">
					<form:label  path="" for="strWilfulDefaulterList"  class="">Wilful Defaulter List<font color="red">*</font></form:label>
	 				
	 			 <div class="input-group">
                        <form:label path="" for="strWilfulDefaulterList" class="">
    					<form:radiobutton path='' id='button2' value="Yes" name='selradio1' onclick="" class="option-input radio"  />Yes</form:label>
    					<form:label  path="" for="strWilfulDefaulterList"  class="r">
    					<form:radiobutton path="" name="selradio1" value="No"  onclick="" class="option-input radio" id="button3" />No</form:label> 
				</div></div>
			</div></div>
			
			<div class="row">
	 			<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12"> 
	 				<div class="form-group">
					<form:label  path="" for="strSEBIDebarredList"  class="">SEBI Debarred List<font color="red">*</font></form:label>
	 				
	 			 <div class="input-group">
                        <form:label path="" for="strSEBIDebarredList" class="">
    					<form:radiobutton path='' id='button4' value="Yes" name='selradio2' onclick="" class="option-input radio"  />Yes</form:label>
    					<form:label  path="" for="strSEBIDebarredList"  class="r">
    					<form:radiobutton path="" name="selradio2" value="No"  onclick="" class="option-input radio" id="button5" />No</form:label>
				</div></div>
			</div></div>
	 
	 <div class="uploaddocdivmr" id="uploaddocdiv">
	 	<div class="whole up_frm">
			<div class="one fourth"></div>
			<div class="one fourth">
				<label id="fileupload">Certificate from Company Secretary / Board of Directors certifying the above :</label>
			</div>
			<div class="three eleventh">
				<input type="file" id="uploadOtherDoc" name="OtherDocfile" data-url=""  accept="" />
				<!-- <input type="button" id="Attach" value="Attach PDF" class="blue gap-right" name="Attach" /> -->
 			</div>  
 		</div>  
 	 </div> 
 	 
 	 <div class="uploaddocdivmr" id="uploaddocdiv1">
	 	<div class="whole up_frm">
			<div class="one fourth"></div>
			<div class="one fourth">
				<label id="fileupload1">Self Certificate that the applicant is not blacklisted by any Government department :</label>
			</div>
			<div class="three eleventh">
				<input type="file" id="uploadOtherDoc" name="OtherDocfile" data-url=""  accept="" />
				<!-- <input type="button" id="Attach" value="Attach PDF" class="blue gap-right" name="Attach" /> -->
 			</div>  
 		</div>  	
 	 </div>
			
		<div class="row">
			<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
				<div class="form-group">
						<form:label path="" for="strApplicantName" style="">CIBIL Score</form:label>
	 				
	 			 		<div class="input-group">
                    		<div class="input-group-prepend">
                        		<span class="input-group-text"><i class="fa fa-building"></i></span>
                    		</div>
           					<form:input path="" id="strApplicantName2" class="form-control" placeholder="CIBIL Score" value="" readonly="false"></form:input>
						</div>
				</div>
			</div>
			
			<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
				<div class="form-group">
						<form:label path="" for="strApplicantName" style=""></form:label>
						<form:label path="" for="strApplicantName" style=""></form:label>
	 				
	 			 		<div class="input-group">
           					<input type="file" id="uploadOtherDoc" name="OtherDocfile" data-url=""  accept="" />
						</div>
				</div>
 			</div> 
	</div>
			
	 <!-- <div class="align-center">
	    <input name="Upload" type="upload" value="Upload" onclick="" class="blue gap-right">
	    <input type="submit" name="Submit" value="Submit" id="submit" onclick="" class="blue gap-right">
	 </div> -->
	 
	 <div class="align-center">
	 	<input type="button" name="Submit" value="Upload" id="submitRequest" onclick="" class="blue gap-right">
	    <input type="submit" name="Submit" value="Submit" onclick="" class="blue gap-right">
	 </div>
	    </fieldset>
</form:form>
</div></div></section>
</body>



