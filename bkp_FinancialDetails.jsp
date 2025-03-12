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

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<div id="image" class="loader"></div>

	<c:if test="${errormsg!=null && errormsg != ''}">
		<div id="userinfo-message" class="msg msgbg centered">${errormsg}</div>
	</c:if>
	
 	<div class="card card-chart">
  						<div class="card-header" data-background-color="orange">
	                        <h4 class="title"> Financial Details ( Self - Certified ) </h4>
	                    </div>
	                    
    <div class="card-body">
	<form:form action="SaveCreditHistory" id="reqform2" name="reqform2" method="POST" modelAttribute="temp">
		<fieldset>
           	<legend>Financial Details FY wise</legend>
	 		
		   	<div class="row">
					<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
						<div class="form-group">
							<form:label path="" for="selectFinancialYear" > Select Financial Year </form:label>
 							<div class="input-group">
                               	<div class="input-group-prepend">
                                   	<span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                </div>
								<form:input path="" id="selectFinancialYear" class="form-control"  placeholder="dd month,yyyy" readonly="" ></form:input>
							</div>
						</div>
					</div>
				</div>
				
 	  <div class="row">
		<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
			<div class="form-group">
				<form:label path="" for="" > Turnover </form:label>
	 		<div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-rupee-sign"></i></span>
                </div>
                
		<form:input path="" id="turnover" class="form-control" placeholder="Turnover" onkeyup="" ></form:input>
			</div></div>
		</div>
			
		<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
			<div class="form-group">
				<form:label path="" for="" >Net Worth</form:label>
			<div class="input-group">
             <div class="input-group-prepend">
                 <span class="input-group-text"><i class="fas fa-rupee-sign"></i></span>
             </div>
				<form:input path="" id="netWorth" class="form-control" placeholder="in Crores" onkeyup=""></form:input>
			</div></div>
		</div>
	</div>
	
	 <div class="row">
		<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
			<div class="form-group">
				<form:label path="" for="" > Profit Before Tax ( PBT ) </form:label>
	 		<div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-rupee-sign"></i></span>
                </div>
                
		<form:input path="" id="profitBeforeTax" class="form-control" placeholder="PBT" onkeyup="" ></form:input>
			</div></div>
		</div>
			
		<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
			<div class="form-group">
				<form:label path="" for="" >Profit After Tax ( PAT )</form:label>
			<div class="input-group">
             <div class="input-group-prepend">
                 <span class="input-group-text"><i class="fas fa-rupee-sign"></i></span>
             </div>
				<form:input path="" id="profitAfterTax" class="form-control" placeholder="PAT" onkeyup=""></form:input>
			</div></div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
			<div class="form-group">
				<form:label path="" for="" > Revenue from Development </form:label>
	 		<div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-rupee-sign"></i></span>
                </div>
                
		<form:input path="" id="revenueFromDevelopment" class="form-control" placeholder="Development Revenue" onkeyup="" ></form:input>
			</div></div>
		</div>
			
		<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
			<div class="form-group">
				<form:label path="" for="" > Revenue from Maintenance </form:label>
			<div class="input-group">
             <div class="input-group-prepend">
                 <span class="input-group-text"><i class="fas fa-rupee-sign"></i></span>
             </div>
				<form:input path="" id="revenueFromMaintenance" class="form-control" placeholder="Maintainance Revenue" onkeyup=""></form:input>
			</div></div>
		</div>
	</div>
 </fieldset>
 
 <fieldset>
      <legend>Company's Experience Completed / Go LIVE</legend>
	
 	  <div class="row" id="CompanyExperienceCompleted_0">
		<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
			<div class="form-group">
				<form:label path="" for="" > Name of the client </form:label>
	 		<div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                </div>
                
		<form:input path="" id="clientName_0" class="form-control" placeholder="Client Name" onkeyup="" ></form:input>
			</div></div>
		</div>
			
		<div class="col-md-6 col-sm-12 col-lg-6 col-xs-12">
			<div class="form-group">
				<form:label path="" for="" > Nature of Business </form:label>
			<div class="input-group">
             <div class="input-group-prepend">
                 <span class="input-group-text"><i class="fa fa-list-ol"></i></span>
             </div>
				<form:input path="" id="natureOfBusiness_0" class="form-control" placeholder="Nature Of Business" onkeyup=""></form:input>
			</div></div>
		</div>
	</div>
	
	<div id="content">
	</div>
	
	<div class="align-center">
	 	<input type="button" name="Add Another" value="Add Another ( Upto 3 )" id="addAnother" onclick="appendHouse();" class="blue gap-right">
	 </div>
   	
 </fieldset>
 
  	<!-- <div class="align-center">
	    <input name="Upload" type="upload" value="Upload" onclick="" class="blue gap-right">
	    <input type="submit" name="Submit" value="Submit" id="submit" onclick="" class="blue gap-right">
	 </div> -->
	 
	 <div class="align-center">
	 	<input type="submit" name="Submit" value="Submit" id="submitRequest" onclick="" class="blue gap-right">
	 </div>
</form:form>
</div></div></section>
</body>

 <script> 	
	$(window).on('load', function (){ 
     var $datepicker_start_input = $("#selectFinancialYear").pickadate({
  		  selectYears: true,
      	    selectMonths: true,
      	    selectYears: 100,
      	    weekdaysShort: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
  	     hiddenSuffix: 'date_start_submit'
  	     
  	 });
  	 from_picker = $datepicker_start_input.pickadate('picker');  
 });
</script>

<script>
var count = 0;
function appendHouse() {
  var newIDFrom;
  var newIDTo;
  count++;
  if(count>2){
	  return;
  }
  var rowdata='<div class="row"  id="CompanyExperienceCompleted_"'+count+'>' ;
                rowdata+=' '
                var clone = $("#CompanyExperienceCompleted_0").clone();
                clone.attr("id", "CompanyExperienceCompleted_"+count);
                
                clone.find("#clientName_0").attr("id","clientName_"+count).val("");
                clone.find("#natureOfBusiness_0").attr("id","natureOfBusiness_"+count).val("");
                
                $("#content").append(clone); 
}
</script>

<script >
     /* $(document).ready(function() {
    	 $("#addAnother").click(function() {
    	        //$("form > div:first-child").clone(true).insertBefore("form > div:last-child");
    		    $('#CompanyExperienceCompleted form>div:last').clone(true).insertAfter('#CompanyExperienceCompleted form>div:last');
    	        return false;
    	    });
    });  */

   /*  $(".remove").click(function() {
        $(this).parent().remove();
    }); */
</script>
