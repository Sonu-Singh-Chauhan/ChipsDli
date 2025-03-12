<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="/DLI/resources/app_srv/msip/gl/theme/dashboardjs/applicationdashboard_chart.js"></script>

</head>
<body>
<input type="hidden" value="${dbFormlist.applications}" id="applicationReceivedYear">
<input type="hidden" value="${dbFormlist.cumulitiveApplication}" id="applicationReceived">
<input type="hidden" value="${dbFormlist.applicationYear}" id="financialYear">

<input type="hidden" value="${apApplist.applicationsApproved}" id="applicationApprovedYear">
<input type="hidden" value="${apApplist.cumulitiveApplicationApproved}" id="applicationApproved">
<input type="hidden" value="${apApplist.applicationApprovedYear}" id="financialYearApproved">

<input type="hidden" value="${listIPG.investmentPotentialYearlyAmount}" id="investmentPotentialYear">
<input type="hidden" value="${listIPG.investmentPotentialcumulitive}" id="investmentPotential">
<input type="hidden" value="${listIPG.investmentPotentialYear}" id="financialYearInvestmentPotential">

<input type="hidden" value="${listIAG.investmentApprovedYearlyAmount}" id="investmentApprovedYear">
<input type="hidden" value="${listIAG.investmentApprovedcumulitive}" id="investmentApproved">
<input type="hidden" value="${listIAG.investmentApprovedYear}" id="financialYearInvestmentApproved">

<input type="hidden" value="${listInA.incentiveApprovedYearlyAmount}" id="incentiveApprovedYear">
<input type="hidden" value="${listInA.incentiveApprovedcumulitive}" id="incentiveApproved">
<input type="hidden" value="${listInA.incentiveApprovedYear}" id="financialYearIncentiveApproved">

<input type="hidden" value="${liststateApproved.stateWise1}" id="stateWise1">
<input type="hidden" value="${liststateApproved.stateWiseApprovedApplication}" id="stateApproved">

<input type="hidden" value="${liststateInvestment.stateWise2}" id="stateWise2">
<input type="hidden" value="${liststateInvestment.stateWiseApprovedInvestment}" id="stateInvestment">

<input type="hidden" value="${liststateIncentive.stateWise3}" id="stateWise3">
<input type="hidden" value="${liststateIncentive.stateWiseApprovedIncentive}" id="stateIncentive">

<input type="hidden" value="${listsectorApproved.sector1}" id="sector1">
<input type="hidden" value="${listsectorApproved.sectorApprovedApplication}" id="sectorApproved">

<input type="hidden" value="${listsectorInvestment.sector2}" id="sector2">
<input type="hidden" value="${listsectorInvestment.sectorApprovedInvestment}" id="sectorInvestment">

<input type="hidden" value="${listsectorIncentive.sector3}" id="sector3">
<input type="hidden" value="${listsectorIncentive.sectorApprovedIncentive}" id="sectorIncentive">

<input type="hidden" value="Financial Year-Wise" id="year">
<!-- ====  Cumulative section   ==== -->
<section class="padded rounded gapped" style="background:#c3e4bb4f;">
<div class="w3-container">
<div class="w3-row">
<div class="w3-bar w3-col m7 l7 s12">
<div class="w3-bar w3-col s12">
<div class="w3-container">
<div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">Initial Applications (Projects)</h5>
                  </div>
        <div class=" card-body">
            
 
  
<div class="table-responsive">  
  <table class="table table-bordered" id="apprst">
  <thead>
    <tr>
      <th></th>
      <th>Number</th>
      <th>Investment Proposed (Rs. Cr.)</th>
      <th>Employment Proposed (Nos.)</th>
	  <th>Investment Approved/ Under Consideration (Rs. Cr.)</th>
	  <th>Incentives Committed/ Under Consideration (Rs. Cr.)</th>
    </tr>
    
    </thead>
    <tbody>
    <tr>
      <td>Approved</td>
      <td>${dbForm.approvedApplication}</td>
      <td>${dbForm.investmentPotentialApprovedInitial}</td>
      <td>${dbForm.employmentPotentialApprovedInitial}</td>
	  <td>${dbForm.approvedInvestment}</td>
      <td>${dbForm.approvedIncentive}</td>
    </tr>
    <tr>
      <td>Recommended</td>
      <td>${dbForm.recommeded}</td>
      <td>${dbForm.investmentPotentialRecommendedInitial}</td>
      <td>${dbForm.employmentPotentialRecommendedInitial}</td>
	  <td>${dbForm.recommendedInvestment}</td>
      <td>${dbForm.recommendedIncentive}</td>
    </tr>
    <tr>
      <td>Under Appraisal</td>
      <td>${dbForm.underAppraisal}</td>
      <td>${dbForm.investmentPotentialUnderAppraisalInitial}</td>
      <td>${dbForm.employmentPotentialUnderAppraisalInitial}</td>
	  <td>${dbForm.underAppraisalInvestment}</td>
      <td>${dbForm.underAppraisalIncentive}</td>
    </tr>
      <tr>
      <td>Total</td>
      <td>${dbForm.totalInitial}</td>
      <td>${dbForm.totalInvestmentPotential}</td>
      <td>${dbForm.totalEmploymentPotential}</td>
	  <td>${dbForm.totalIntitalInvestment}</td>
      <td>${dbForm.totalIntitalIncentive}</td>
    </tr>
    
      
    </tbody>
  </table>
  </div>
   </div>
      </div>
</div>

</div></div>

<!-- ====  Cumulative section   ==== -->

<div class="w3-bar w3-col m5 l5 s12">
<div class="w3-bar w3-col s12">
<div class="w3-container">
<div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">Follow-up Applications</h5>
                  </div>
        <div class=" card-body">
            
 
  
<div class="table-responsive">  
  <table class="table table-bordered" id="apprst">
  <thead>
    <tr>
      <th></th>
      <th>Number</th>
      <th>Investment Approved/ Under Consideration (Rs. Cr.)</th>
      <th>Incentives Committed/ Under Consideration (Rs. Cr.)</th>
	  
    </tr>
    
    </thead>
    <tbody>
    <tr>
      <td>Approved</td>
      <td>${dbForm.approvedFollowUp}</td>
      <td>${dbForm.approvedFollowUpInvestment}</td>
      <td>${dbForm.approvedFollowUpIncentive}</td>
	  
    </tr>
    <tr>
      <td>Recommended</td>
      <td>${dbForm.recommededFollowUp}</td>
      <td>${dbForm.recommededFollowUpInvestment}</td>
      <td>${dbForm.recommededFollowUpIncentive}</td>
	  
    </tr>
    <tr>
      <td>Under Appraisal</td>
      <td>${dbForm.underAppraisalFollowUp}</td>
      <td>${dbForm.underAppraisalFollowUpInvestment}</td>
      <td>${dbForm.underAppraisalFollowUpIncentive}</td>
	  
    </tr>
      <tr>
      <td>Total</td>
      <td>${dbForm.totalFollowUp}</td>
      <td>${dbForm.totalFollowUpInvestment}</td>
      <td>${dbForm.totalFollowUpIncentive}</td>
	  
    </tr>
    
      
    </tbody>
  </table>
  </div>
   </div>
      </div>
</div>




</div></div></section>
<section class="padded rounded gapped chartscls">
<!-- == tabs == -->
<div class="w3-container">
<div class="w3-row">
 <div class="w3-bar w3-col s6 w3-left">
 <button type="button" class="btn btn-primary" id="filter-panel-button"  onclick="myFunction();">
           <i class="fa fa-search-plus" ></i> Advanced Search
        </button>
 
  

 </div>
  <div class="w3-bar w3-col s6 w3-blacks w3-right">
      <button class=" w3-button tablink w3-amber" onclick="openDataChart(event,'monthly')">Applications</button>
       <button class="w3-button tablink" onclick="openDataChart(event,'quarterly')">Investments</button>
       <button class=" w3-button tablink" onclick="openDataChart(event,'yearly')">Incentives</button>
    
  
  </div>
    <div class="w3-row filter-panel" id="filter-panel" style="display:none;">
<!--   <div class="w3-row collapse filter-panel" id="filter-panel" style="display:none;"> -->
    <div class="w3-bar w3-col s12">
  <div class="container_flt">
	<div class="w3-row">
	 <div class="w3-col notecl">
       <span class="nt1">Note: </span> <span class="nt2"> Changes will be reflected on clicking the submit button.</span> </div>  
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form class="form-inline" role="form">
                                                      
                         <div class="form-group col-md-2 col-lg-2 col-sm-4 col-xs-12">
                            <label class="filter-col" style="margin-right:0;" for="pref-perpage">Select Type:</label>
                            <select id="pref-perpage1" class="form-control" onchange ="GraphData(event)">
                                <option value="1">Cumulative</option>  
                                <option value="2">Financial Year-Wise</option> 
                                <option value="3">Period Wise</option>         
                                                                                             
                            </select>                                
                        </div> 
                        
                        <div class="form-group col-md-2 col-lg-2 col-sm-4 col-xs-12" id="freq">
                            <label class="filter-col" style="margin-right:0;">Frequency:</label>
                            <select id="pref-perpage4" class="form-control" onchange ="freqData(event)">
                            <option value="all">Select</option> 
                                <option value="1">Monthly</option>    
                                <option value="2">Quarterly</option> 
                                <option value="3">Between Dates</option>      
                                                                                             
                            </select>                                
                        </div>
                        
                        <div class="form-group col-md-2 col-lg-2 col-sm-4 col-xs-12" id="finYear">
                            <label class="filter-col" style="margin-right:0;">Year:</label>
                            <select id="pref-perpage5" class="form-control" onchange ="">
                            <option value="all">Select</option> 
                               <c:forEach items="${finYear}" var="finYear">
												<option value="${finYear}">
													<c:out value="${finYear}"></c:out>
												</option>
											</c:forEach>     
                                                                                             
                            </select>                                
                        </div>
                      
       
         <div class="form-group col-md-4 col-lg-4 col-sm-4 col-xs-12" id="btwdt">
                        <div class="form-group col-md-6 col-lg-6 col-sm-6 col-xs-12">
                        <label class="filter-col" style="margin-right:0;" for="pref-perpage">From Date:</label>
                        <div class="input-group">
        <div class="input-group-addon">
         <i class="fa fa-calendar">
         </i>
        </div>
        <input class="form-control" type="date" id="frmdate" name="frmdate" placeholder="MM/DD/YYYY">
       </div>

       </div><!-- form group [rows] -->
       
       <div class="form-group col-md-6 col-lg-6 col-sm-6 col-xs-12">
                        <label class="filter-col" style="margin-right:0;" for="pref-perpage">To Date:</label>
   <div class="input-group">
        <div class="input-group-addon">
         <i class="fa fa-calendar">
         </i>
        </div>
        <input class="form-control" type="date" id="todate" name="todate" placeholder="MM/DD/YYYY">
       </div>

       </div><!-- form group [rows] -->
       </div>
        <div class="form-group col-md-2 col-lg-2 col-sm-4 col-xs-12">
                            <label class="filter-col" style="margin-right:0;" for="pref-perpage">State:</label>
                            <select id="pref-perpage2" class="form-control">
                                        <option value="all">All</option> 
                               <c:forEach items="${StateList}" var="listState">
                                     
														<option value="${listState.numStateId}">
															<c:out value="${listState.strStateName}"></c:out>
														</option>
													</c:forEach>
                                                               
                            </select> 
                                                           
                        </div> <!-- form group [rows] -->
                        
                         <div class="form-group col-md-2 col-lg-2 col-sm-4 col-xs-12">
                            <label class="filter-col" style="margin-right:0;" for="pref-perpage">Sector:</label>
                            <select id="pref-perpage3" class="form-control">
                                    <option value="all">All</option>  
                                   <c:forEach items="${listSector}" var="sectorList" >
								<option value="${sectorList.numSectorId}">
								<c:out value="${sectorList.strSector}">
								</c:out>
								</option>
							</c:forEach>                                                          
                            </select>                                
                        </div> 
                        
                      
                    </form>
                    
                           <div class=" form-group col-md-2 col-lg-2 col-sm-2 col-xs-12">
	<div class="vertical-center">
	
	
	 <button type="submit" form="forms1" id="submitGraph" onclick="graphDataSearch()" value="submit">Submit</button>
	
	</div>
	</div>  
                </div>
            </div>
        </div>  
      
	</div>
</div>
 
  </div>
 
  
  </div>
  <div class="w3-row">
  <!-- ==  cumulative chart data code === -->
  <!-- ==  cumulative chart code end    === -->
  <div id="monthly" class="w3-container city">
   <div class="w3-row">
     <div class="w3-col l6 m12 s12">
  
  <div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">Applications Under Consideration (Nos.)</h5>
                  </div>
        <div class=" card-body">
          <div class=" chart-area" id="a1"><canvas id="monthwise-stat9" height="200"> </canvas></div>
        </div>
      </div>
     
  
  </div>
  
  <div class="w3-col l6 m12 s12"> <div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">Applications Approved (Nos.)</h5>
          
        </div>
        <div class=" card-body">  
          <div class=" chart-area" id="a2">
       <%-- <canvas id="monthwise-stat10" height="200"> </canvas> --%></div>
        </div>
      </div></div>
      
      
  
  
   </div>
 <div class="w3-row">
 
      <div class="w3-col l12 m12 s12"> <div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">State-wise distribution of Approved Initial Applications (Top 10)</h5>
          
        </div>
        <div class=" card-body">
          <div class=" chart-area" id="a3"><canvas id="monthwise-stat5" height="200"> </canvas></div>
        </div>
      </div></div>
      
      </div>
      
      <div class="w3-row">
 <div class="w3-col l12 m12 s12"> <div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">Major Sector-wise Distribution of Approved  Applications </h5>
          
        </div>
        <div class=" card-body">
          <div class=" chart-area" id="a4"><canvas id="CumulativeChart6"  height="200"> </canvas></div>
        </div>
      </div></div>
      
      </div>


      




  </div>

  <div id="quarterly" class="w3-container  city" style="display:none">
  <div class="w3-row">
 
  
  
      
      <div class="w3-col l6 m12 s12 ">
  
  <div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">Investment Proposed (Rs. Cr.) </h5>
          
        </div>
        <div class=" card-body">
          <div class=" chart-area" id="a5"><canvas id="CountryChart5"> </canvas></div>
        </div>
      </div>
     
  
  </div>
  
   <div class="w3-col l6 m12 s12">
  
  <div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">Investment Approved (Rs. Cr.)</h5>
          
        </div>
        <div class=" card-body">
          <div class=" chart-area" id="a6"><canvas id="CountryChart6"> </canvas></div>
        </div>
      </div>
     
  
  </div>
       </div>
       
    <div class="w3-row">
 
  
  <div class="w3-col s12 m12 l12"><div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">State-wise distribution of Approved Investments (Top 10)</h5>
          
        </div>
        <div class=" card-body">
          <div class=" chart-area" id="a8"><canvas id="CountryChart11" height="200"> </canvas></div>
        </div>
      </div></div>
  
  </div>
  
  <div class="w3-row">
 <div class="w3-col s12 m12 l12">
  
  <div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">Major Sector-wise Distribution of Approved  Investments </h5>
                 </div>
        <div class=" card-body">
          <div class=" chart-area" id="a9"><canvas id="CumulativeChart17" height="200"> </canvas></div>
        </div>
      </div>
     
  
  </div>
</div>

       




  </div>

  <div id="yearly" class="w3-container  city" style="display:none">
  
  <div class="w3-row">
  <div class="w3-col s12 m12 l12">
  
  <div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">Incentives Approved (Rs. Cr.)</h5>
                 </div>
        <div class=" card-body">
          <div class=" chart-area" id="a7"><canvas id="CountryChart12" height="200"> </canvas></div>
        </div>
      </div>
     
  
  </div></div>
  
   <div class="w3-row">
  <div class="w3-col s12 m12 l12">
  
  <div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">State-wise Incentives Approved (Top 10)</h5>
                 </div>
        <div class=" card-body">
          <div class=" chart-area"><canvas id="incentiveschart2"> </canvas></div>
        </div>
      </div>
     
  
  </div></div>
  
  <div class="w3-row">
  <div class="w3-col s12 m12 l12">
  
  <div class=" card card-chart">
        <div class=" card-header">
          <h5 class=" card-category">Major Sector-wise Incentives Approved</h5>
                 </div>
        <div class=" card-body">
          <div class=" chart-area"><canvas id="incentiveschart3"> </canvas></div>
        </div>
      </div>
     
  
  </div></div>
   

      
 
  </div>

</div>

</div>
</div>



<!-- == tabs closed == -->

   
</section> 


</body>
</html>