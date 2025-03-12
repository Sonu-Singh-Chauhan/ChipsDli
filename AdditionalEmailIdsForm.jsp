<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.13.3/css/selectize.css'
	rel='stylesheet'>

</head>
<body>

	<h3 style="text-align: center">Additional Contact Details</h3>
	<div style='padding: 10px; max-width: 600px; margin: auto'>


		<form id='aeForm'>
			<!-- Options will be fetched and filled from Script.  -->
			Company Name <span style='color: red'>*</span>: <select
				id="companyNameSelect" onchange="getEmailIds(this.value)"></select>
			<br>
			<p id='usernames'>
				<a href='#' onclick='showUns()'>Show Usernames</a>
			</p>


			<p id='keyPersonnelEmails'>
				<a href='#' onclick='showKpes()'>Show Key Personnel Emails</a>


			</p>


			<p class='align-center'>
				<b> Additional Contact Detail 1</b>
			</p>
			Contact Name: <input type="text" id="contactName1"> <br>Email
			Id <span style='color: red'>*</span>: <input type="text"
				id="emailId1"> <br>Contact Number: <input type="text"
				placeholder="Mobile / Fixed" id="contactNumber1"> <br>
			<br>

			<p class='align-center'>
				<b> Additional Contact Detail 2</b>
			</p>
			Contact Name: <input type="text" id="contactName2"> <br>Email
			Id: <input type="text" id="emailId2"> <br>Contact
			Number: <input type="text" placeholder="Mobile / Fixed"
				id="contactNumber2"> <br> <br>



			<p class='align-center'>
				<b> Additional Contact Detail 3</b>
			</p>
			Contact Name: <input type="text" id="contactName3"> <br>Email
			Id: <input type="text" id="emailId3"> <br>Contact
			Number: <input type="text" placeholder=" Mobile / Fixed"
				id="contactNumber3"> <br> <br> <br>


			<div class='align-center'>
				<input type="button" class="gap-right" name="Submit"
					value="Save Or Update" onclick="saveEmailIds()">
			</div>

		</form>

		<div style='text-align: right'>
			<p>
				<span style='color: red'>*</span> = Required
			</p>
			<!-- <p>
				<span style='color: red'>^</span> = Atleast one Email Id required.
			</p> -->
		</div>
		
		<hr>
		<hr>	
		
		<h3 style="text-align: center">Reports</h3>
		<br>
		<div class='align-center'>
				<input type="button" class="gap-right" name="Submit"
					value="Show All Records" onclick="fetchAllAddlnContactDetails()">
			</div>
	</div>



	<div id='myLoader' class="loader"></div>

</body>
<script>
	//alert('ahh3mtxtf()')

	// When email ids for a company is/are fetched, global var are updated and checked at save.
	// global var here wrt emails used to detect any change to prevent redundant saves.
	gEmailId1 = ''
	gEmailId2 = ''
	gEmailId3 = ''

	gDataArray = []

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

	// Fetch the list to feed the Option/Dropdown.
	$.ajax({
		type : "GET",
		url : "/DLI/pmCompanies",
		success : function(response) {
			//console.log(response)
			//alert('response is ')
			fillSelectOptions('companyNameSelect', response)
		},
		complete : function(data) {
			//alert('ajax complete')
		}
	});

	function fillSelectOptions(elementID, companies) {
		var select = document.getElementById(elementID);
		//var companies = [ "A", "B", "C", "D", "E" ];

		var opt = "";
		var el = document.createElement("option");
		el.textContent = opt;
		el.value = opt;
		select.appendChild(el);

		for (var i = 0; i < companies.length; i++) {
			var opt = companies[i].trim();
			var el = document.createElement("option");
			el.textContent = opt;
			el.value = opt;
			select.appendChild(el);
		}

		$("#" + elementID + "").selectize({
			sortField : "text",
		});
	}

	function saveEmailIds() {

		companyName = $('#companyNameSelect').val().trim()

		// Do not Post if company name is empty.
		if (companyName == '' || companyName == " ") {
			alert("Please select a Company for this action.")
			return;
		}

		emailId1 = $('#emailId1').val().trim()
		emailId2 = $('#emailId2').val().trim()
		emailId3 = $('#emailId3').val().trim()

		// Do not Post if no email id/s provided. Can Validation js handle  this?
		if (emailId1 == '' && emailId2 == '' && emailId3 == '') {
			alert("Please Fill atleast 1 Email Id.")
			return;
		}

		// email Validation. Same (with a different syntax) is put @backend as well.
		regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/

		if (emailId1 != '' && !(emailId1.match(regex))) {
			alert('Email 1 Invalid. ' + emailId1 + ' is not a valid email.')
			return;
		}

		if (emailId2 != '' && !(emailId2.match(regex))) {
			alert('Email 2 Invalid. ' + emailId2 + ' is not a valid email.')
			return;
		}

		if (emailId3 != '' && !(emailId3.match(regex))) {
			alert('Email 3 Invalid. ' + emailId3 + ' is not a valid email.')
			return;
		}

		/* contactName1 = $('#contactName1').val().trim()
		contactName2 = $('#contactName2').val().trim()
		contactName3 = $('#contactName3').val().trim()

		contactNumber1 = $('#contactNumber1').val().trim()
		contactNumber2 = $('#contactNumber2').val().trim()
		contactNumber3 = $('#contactNumber3').val().trim() */
		
		// removes char ',' from name and contact. Corrupts the csv report.
		// to avoid 'abc,pqr' => 'abcpqr' we replace char ',' with a whitespace.
		// trim will handle extra whitespace/s if any.
		contactName1 = $('#contactName1').val().replaceAll(",", " ").trim()
		contactName2 = $('#contactName2').val().replaceAll(",", " ").trim()
		contactName3 = $('#contactName3').val().replaceAll(",", " ").trim()

		contactNumber1 = $('#contactNumber1').val().replaceAll(",", " ").trim()
		contactNumber2 = $('#contactNumber2').val().replaceAll(",", " ").trim()
		contactNumber3 = $('#contactNumber3').val().replaceAll(",", " ").trim()
		
		var letters = /^[A-Za-z]+$/;
		if(contactNumber1 != '' && contactNumber1.match(letters)){
			alert("Aplhabets not allowed in Contact Number 1")
			return
		}
		if(contactNumber2 != '' && contactNumber2.match(letters)){
			alert("Aplhabets not allowed in Contact Number 2")
			return
		}
		if(contactNumber3 != '' && contactNumber3.match(letters)){
			alert("Aplhabets not allowed in Contact Number 3")
			return
		}
		
		// Only Contact Name is of no use to us. Let us not allow saving of contact name only.
		if(contactName1 != "" && contactNumber1 == "" && emailId1 == ""){
			alert("No Email or Contact Number to save under Detail 1 Section. Kindly clear the Name therein")
			return
		}
		
		if(contactName2 != "" && contactNumber2 == "" && emailId2 == ""){
			alert("No Email or Contact Number to save under Detail 2 Section. Kindly clear the Name therein")
			return
		}
		
		if(contactName3 != "" && contactNumber3 == "" && emailId3 == ""){
			//alert("No Email or Contact Number to save under Detail 3 Section. Kindly clear the Name therein")
			return
		}

		// Do not post if fetched email ids are not changed.
		/* alert(emailId1 + " " + gEmailId1 + " a ")
		alert(emailId1 == gEmailId1)
		alert(emailId2 + " " + gEmailId2 + " a ")
		alert(emailId2 == gEmailId2)
		alert(emailId3 + " " + gEmailId3 + " a ")
		alert(emailId3 == gEmailId3) */

		data = {
			'emailId1' : emailId1,
			'emailId2' : emailId2,
			'emailId3' : emailId3,
			'contactName1' : contactName1,
			'contactName2' : contactName2,
			'contactName3' : contactName3,
			'contactNumber1' : contactNumber1,
			'contactNumber2' : contactNumber2,
			'contactNumber3' : contactNumber3,
			'companyName' : companyName,
		}
		
		//alert(gDataArray.length)
		
		// do not check change/noChange if no data fetched.
		if (gDataArray.length > 0) {
			
			//alert('Checking')

			dataArray = []
	
			for ( var i in data) {
				dataArray.push(data[i])
			}
	
			dataArray.pop() // remove the company name.
	
			//console.log(dataArray)
			//console.log(gDataArray)
			//console.log(dataArray.length == gDataArray.length)
			noChange = true;
			
			for (var i = 0, j = 0; i < dataArray.length
					&& j < gDataArray.length; i++, j++) {
				//console.log(dataArray[i])
				//console.log(gDataArray[j])
				//console.log(dataArray[i] == gDataArray[j])
				//console.log(dataArray[i] === gDataArray[j])
				if (dataArray[i] !== gDataArray[j]) {
					//console.log('change found d')
					noChange = false;
					break;
				}
			}

			/* if (emailId1 == gEmailId1 && emailId2 == gEmailId2
					&& emailId3 == gEmailId3) {
				alert("No Change/s to Save/Update.")
				return;
			} */
			
			//alert(gDataArray.length)
	
			if (noChange) {
				alert("No Change/s to Save/Update.")
				return;
			}
		}

		$('#myLoader').show()
		//data = 'emailId1='+emailId1+'&emailId2='+emailId2+'&emailId3='+emailId3+'&companyName='=companyName

		//console.log(data)
		//alert("POSTING")
		$.ajax({
			type : "POST",
			url : "/DLI/AdditionalEmailIds",
			dataType : 'JSON',
			data : data,
			success : function(response) {
				if (response == '0') {
					alert("Saved Successfully!")
					//console.log(response)
					//alert('response ' + response)
					//fillSelectOptions('companyNameSelect', response)
					updateEmailIdsGlobalVar([ $('#emailId1').val().trim(),
							$('#emailId2').val().trim(),
							$('#emailId3').val().trim(),
							$('#contactName1').val().trim(),
							$('#contactName2').val().trim(),
							$('#contactName3').val().trim(),
							$('#contactNumber1').val().trim(),
							$('#contactNumber2').val().trim(),
							$('#contactNumber3').val().trim()])
				} else if (response == "1") {
					alert('Unable to Process the Request. ECTC1653290721')
				} else if (response == "2")
					alert('Unable to Process Invalid Email. EEAFC0408')
			},
			error : function(data) {
				alert('Unable to Process the Request. SMIS0909020821')
			},
			complete : function(data) {
				//alert('ajax complete')
				$('#myLoader').hide()
			}
		});

	}

	function getEmailIds(companyName) {
		//alert('Fetching emaild ids to prefill the form for ' + companyName);
		//companyName = selectElement.value
		//data = 'comanyName=' + selectElement.value

		//alert('On change: ' + companyName)

		if (companyName == '') {
			//alert('No selections')
			fillEmailIdsInForm([])
			updateEmailIdsGlobalVar([])
			return;
		}

		$('#myLoader').show()
		$.ajax({
			type : "GET",
			url : "/DLI/AdditionalEmailIds?companyName=" + companyName,
			//url: "/DLI/RevertToApplicant?ProposalId="+value+"&numDisbursementId="+numDisbursementId+"&strNewClaimNo="+strNewClaimNo+"&companyName="+companyName,
			//data : data,
			success : function(response) {
				//console.log(response);
				//alert('response');
				// make emailIds array of the response.;
				fillEmailIdsInForm(response);
				updateEmailIdsGlobalVar(response);
			},
			error : function(data) {
				alert('Unable to Process the Request. GEI0944020821')
			},
			complete : function(data) {
				//alert('ajax complete')
				$('#myLoader').hide()
			}
		});

		$('#usernames').html(
				"<a href='#' onclick='showUns()'>Show Usernames</a>")
		$('#keyPersonnelEmails')
				.html(
						"<a href='#' onclick='showKpes()'>Show Key Personnel Emails</a>")

	}

	function fillEmailIdsInForm(emailIds) {
		//alert('Filling the form now. Values are fetched (or taken from UI table of all email ids.)')
		$('#emailId1').val(emailIds[0])
		$('#emailId2').val(emailIds[1])
		$('#emailId3').val(emailIds[2])

		$('#contactName1').val(emailIds[3])
		$('#contactName2').val(emailIds[4])
		$('#contactName3').val(emailIds[5])

		$('#contactNumber1').val(emailIds[6])
		$('#contactNumber2').val(emailIds[7])
		$('#contactNumber3').val(emailIds[8])
	}

	function updateEmailIdsGlobalVar(emailIds) {
		//alert('@updateEmailIdsGlobalVar(')
		/* gEmailId1 = emailIds[0]
		gEmailId2 = emailIds[1]
		gEmailId3 = emailIds[2] */

		gDataArray = emailIds;
	}

	function showUns() {
		companyName = $('#companyNameSelect').val().trim()
		if (companyName == '') {
			alert("Please select a Company for this action.")
			return;
		}

		//fetchUsernames(companyName)
		$('#myLoader').show()
		$.ajax({
			type : "GET",
			url : "/DLI/Usernames?companyName=" + companyName.trim(),
			//url: "/DLI/RevertToApplicant?ProposalId="+value+"&numDisbursementId="+numDisbursementId+"&strNewClaimNo="+strNewClaimNo+"&companyName="+companyName,
			//data : data,
			success : function(response) {
				//console.log(response)
				//alert('response')
				$('#usernames').html('<b>Username/s</b>	: <Br>'
				+'Login Id: ' + response[0]
				+'<br>Full Name: ' + response[1]
				+'<br>Contact: ' + response[2]
				)
			},
			error : function(data) {
				alert('Unable to Process the Request. GEP1111060821')
			},
			complete : function(data) {
				//alert('ajax complete')
				$('#myLoader').hide()
			}
		});

	}

	function showKpes() {
		companyName = $('#companyNameSelect').val().trim()
		if (companyName == '') {
			alert("Please select a Company for this action.")
			return;
		}

		//fetchKeyPersonneEmails(companyName)
		$('#myLoader').show()
		$
				.ajax({
					type : "GET",
					url : "/DLI/KeyPersonnelEmails?companyName="
							+ companyName.trim(),
					//url: "/DLI/RevertToApplicant?ProposalId="+value+"&numDisbursementId="+numDisbursementId+"&strNewClaimNo="+strNewClaimNo+"&companyName="+companyName,
					//data : data,
					success : function(response) {
						//console.log(response)
						//alert('response')
						$('#keyPersonnelEmails').html(
			  
								'<b>Key Personnel Email/s</b>: <Br>' + response)
					},
					error : function(data) {
						alert('Unable to Process the Request. GEP1024060821')
					},
					complete : function(data) {
						//alert('ajax complete')
						$('#myLoader').hide()
					}
				});
	}
	
	
	function fetchAllAddlnContactDetails(){
		//alert('Coming Soon !')
		
		$('#myLoader').show()
		$
				.ajax({
					type : "GET",
					url : "/DLI/AddlnContact",
					//url: "/DLI/RevertToApplicant?ProposalId="+value+"&numDisbursementId="+numDisbursementId+"&strNewClaimNo="+strNewClaimNo+"&companyName="+companyName,
					//data : data,
					success : function(response) {
						//console.log(response);
						//alert('responsess');
						
						// src: https://stackoverflow.com/questions/14964035/how-to-export-javascript-array-info-to-csv-on-client-side
						// the below does not work if not nested.
						// CSV will not be generated if array/list is not nested.
						rows = [['Company Name','Name1','Email Id1','Contact1'
						        ,'Name2','Email Id2','Contact2	'
						        ,'Name3','Email Id3','Contact3'
						        ]].concat(response)
						csvContent = "data:text/csv;charset=utf-8," 
						    + rows.map(e => e.join(",")).join("\n");
						var encodedUri = encodeURI(csvContent);
						var link = document.createElement("a");
						link.setAttribute("href", encodedUri);
						link.setAttribute("download", "AdditionalContactDetails.csv");
						document.body.appendChild(link); // Required for FF
						link.click();
						
						
					},
					error : function(data) {
						alert('Unable to Process Request. ADC1553290921');
						console.log("ADC1553290921");
						console.log(data.status)
					},
					complete : function(data) {
						//alert('ajax complete')
						$('#myLoader').hide()
					}
				});
	}
</script>

<script
	src='https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.13.3/js/standalone/selectize.js'>
	
</script>
<!-- 
READ ME
https://cdnjs.com/libraries/selectize.js 
https://selectize.dev/docs.html#installation
https://selectize.dev/demos.html
https://stackoverflow.com/questions/31133249/searchable-select-option
https://select2.org/tagging-->
</html>
