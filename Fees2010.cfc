<cfcomponent>
	<cffunction name="getFees" output="true" returntype="query">
<cfargument name="transaction_type" type="string"default="">
<cfargument name="property_state" type="string" default="">
<cfargument name="property_county" type="string" default="">
<cfargument name="property_city" type="string" default="">
<cfargument name="loan_amount" type="string" default="0">
<cfargument name="purchase_price" type="string" default="0">
<cfargument name="previous_loan_amount" default=0>
<cfargument name="property_use_type" type="string" default="">
<cfargument name="company_id" type="string" default="">
<cfargument name="return_data" type="string" default="1">
<cfargument name="previous_loan_month" default=1>
<cfargument name="previous_loan_year" default=1996>
<cfargument name="previous_purch_year" default=1>
<cfargument name="previous_purch_month" default=1996>
<cfargument name="previous_purch_amount" default=0>
<cfargument name="same_lender" type="string" default="0">
<cfargument name="reissue_rates" type="string" default="0">
<cfargument name="jlp_policy" type="string" default="0">
<cfargument name="property_report" type="string" default="0">
<cfargument name="appraised_value" type="string" default="0">
<cfargument name="seller_paid_lender_policy" type="string" default="0">
<cfargument name="seller_paid_owner_policy" type="string" default="0">
<cfargument name="buyer_paid_lender_policy" type="string" default="0">
<cfargument name="buyer_paid_owner_policy" type="string" default="0">
<cfargument name="asset_manager" type="string" default="">
<cfargument name="opt_alta_4" type="string" default="0">
<cfargument name="opt_alta_4_1" type="string" default="0">
<cfargument name="opt_alta_5" type="string" default="0">
<cfargument name="opt_alta_5_1" type="string" default="0">
<cfargument name="opt_alta_6" type="string" default="0">
<cfargument name="opt_alta_6_1" type="string" default="0">
<cfargument name="opt_alta_6_2" type="string" default="0">
<cfargument name="opt_alta_7" type="string" default="0">
<cfargument name="opt_alta_8_1" type="string" default="0">
<cfargument name="opt_alta_9" type="string" default="0">


<cfargument name="opt_tx_1" type="string" default="0">
<cfargument name="opt_tx_2" type="string" default="1">
<cfargument name="opt_tx_3" type="string" default="0">
<cfargument name="opt_tx_4" type="string" default="0">
<cfargument name="opt_tx_5" type="string" default="1">
<cfargument name="opt_tx_6" type="string" default="0">
<cfargument name="opt_tx_7" type="string" default="0">
<cfargument name="opt_tx_8" type="string" default="0">
<cfargument name="opt_tx_9" type="string" default="0">
<cfargument name="opt_tx_10" type="string" default="0">
<cfargument name="opt_tx_11" type="string" default="0">
<cfargument name="opt_tx_12" type="string" default="0">
<cfargument name="opt_tx_13" type="string" default="0">
<cfargument name="opt_tx_14" type="string" default="0">

<cfargument name="opt_ut_4" type="string" default="0">
<cfargument name="opt_ut_41" type="string" default="0">
<cfargument name="opt_ut_5" type="string" default="0">
<cfargument name="opt_ut_51" type="string" default="0">
<cfargument name="opt_ut_6" type="string" default="0">
<cfargument name="opt_ut_61" type="string" default="0">
<cfargument name="opt_ut_62" type="string" default="0">
<cfargument name="opt_ut_81" type="string" default="0">
<cfargument name="opt_ut_9" type="string" default="0">
<cfargument name="opt_fl_nav" type="string" default="0">

<cfargument name="opt_sd_comp" type="string" default="0">
<cfargument name="opt_sd_balloon" type="string" default="0">
<cfargument name="opt_sd_credit" type="string" default="0">
<cfargument name="opt_sd_7" type="string" default="0">
<cfargument name="opt_sd_6" type="string" default="0">
<cfargument name="opt_sd_4" type="string" default="0">
<cfargument name="opt_sd_5" type="string" default="0">
<cfargument name="opt_sd_9" type="string" default="0">
<cfargument name="opt_sd_8" type="string" default="0">

<cfargument name="cema" type="string" default="0">
<cfargument name="enhanced_coverage" type="string" default="0">

<cfargument name="transfer_tax_paid_by" type="string" default="">
<cfargument name="title_id"  default="">
<cfargument name="first_time_buyer"  default="0">
<cfargument name="encompass"  default="0">
<cfargument name="underwriter_choice"  default="0">
<cfargument name="delinquency"  default="0">
<cfargument name="insured"  default="">
<cfargument name="assessed_value"  default="0">
<cfargument name="new_deed" default="0">
<cfargument name="current_deed_num" default="0">
<cfargument name="spouses_removed" default="0">
<cfargument name="non_spouses_removed" default="0">
<cfargument name="spouses_added" default="0">
<cfargument name="non_spouses_added" default="0">


<cfargument name="construction_draws" default="0">
<cfargument name="end_loan_original_loan_amount" default="0">
<cfargument name="closing_type" default="0">
<cfargument name="borrower_owns" default="0">
<cfargument name="PREVIOUS_PURCHASE_MORTGAGE" default="0">


<cfargument name="p_email" default="">
<cfargument name="o_email" default="">




<cfset treat_as_purchase = 0>
<cfset treat_as_refi = 0>


 

<!--- 
1x close Purchase

Encompass:
Construction-Perm is checked
Refinance is not checked

In the Calc would be:
Construction selected
1X Close selected
"Does buyer own the property" = No

this calc will run, picking up fees as if it's a Purchase (except for the 1100's, which will pick up from Construction 1x Close in the fee set ups).
 Owner's policy, simul fee and loan rates



1x close Refinance

 Encompass:
 Construction-Perm is checked
 Refinance is checked

In the Calc would be:
 Construction selected
 1X Close selected
 "Does buyer own the property" = Yes

this calc will run, picking up fees as if it's a refi (except for the 1100's, which will pick up from Construction 1x Close in the fee set ups).
 loan rates apply for lender's insurance

2x close Purchase

 Encompass:
Construction is checked
 Refinance is not checked

In the Calc would be:
Construction selected
 2X Close selected
 "Does buyer own the property" = No

this calc will run, picking up fees as if it's a purchase (except for the 1100's, which will pick up from Construction 2x Close in the fee set ups).
 Owner's policy, simul fee and loan rates


2x close Refinance

 Encompass:
Construction is checked
 Refinance is checked

In the Calc would be:
Construction selected
 2X Close selected
 "Does buyer own the property" = Yes

this calc will run, picking up fees as if it's a refi (except for the non-itemized 1100's, which will pick up from Construction 2x Close in the fee set ups).
 loan rates apply for lender's insurance


End Loan (used to be Perm Loan)
 Encompass:
No Cash-Out Refi is checked
 "Is this a New Construction Loan" contains a value

 

In the Calc would be:
Construction selected
 End Loan selected
 "Does buyer own the property" = Yes

 

this calc will run, picking up fees as if it's a refi (except for the non-itemized 1100's, which will pick up from Construction 2x Close in the fee set ups).
 refi rates apply for lender's insurance

 
 --->


<cfif arguments.transaction_type eq 'Construction' and arguments.closing_type eq 1 and arguments.borrower_owns eq 0>
<cfset treat_as_purchase = 1>
<cfelseif arguments.transaction_type eq 'Construction' and arguments.closing_type eq 1 and arguments.borrower_owns eq 1>
<cfset treat_as_refi = 1>
<cfelseif arguments.transaction_type eq 'Construction' and arguments.closing_type eq 2 and arguments.borrower_owns eq 0>
<cfset treat_as_purchase = 1>
<cfelseif arguments.transaction_type eq 'Construction' and arguments.closing_type eq 2 and arguments.borrower_owns eq 1>
<cfset treat_as_refi = 1>
<cfelseif arguments.transaction_type eq 'Construction' and arguments.closing_type eq 3>
<cfset arguments.borrower_owns = 1>
<cfset treat_as_refi = 1>
</cfif>

<cfif arguments.transaction_type eq 'Purchase'>
<cfset treat_as_purchase = 1>
<cfelseif arguments.transaction_type eq 'Refinance' or  arguments.transaction_type eq 'Reverse Mortgage'>
<cfset treat_as_refi = 1>
</cfif>

<cfset arguments.purchase_price = ReplaceNoCase(arguments.purchase_price, ",", "", "ALL")>


<cfset is_natic = 0>


<!--- if this is CA and one of the counties NATIC servers, switch underwriter to NATIC --->
<cfset temp = checkNatic(arguments.property_state, arguments.property_county)>
<cfif temp eq 30>
<cfset arguments.underwriter_choice = 30>
</cfif>

<!--- if this is 
7134	North American Title-Commercial
7491	NORTH AMERICAN TITLE-RESIDENTIAL
7625	NTS - Chevron FCU
8090	North American Title-Residential
8408	North American-Residential-Mark Bauwin
switch underwriter to NATIC --->
<CFQUERY datasource="#request.dsn#" NAME="check_natic_available" maxrows="1">
	SELECT * FROM title_companies_states WHERE st_abbrev = '#arguments.property_state#' and title_co_id = 30
</CFQUERY>

<cfif (arguments.company_id eq 7134 or arguments.company_id eq 7491 or arguments.company_id eq 7625 or arguments.company_id eq 8090 or arguments.company_id eq 8408) and check_natic_available.recordcount eq 1>
<cfset arguments.underwriter_choice = 30>
</cfif>


<cfif Trim(previous_loan_amount) eq ''>
<cfset previous_loan_amount = 0>
</cfif>


<cfif arguments.property_state eq 'AK'>
<cfset arguments.enhanced_coverage = 1>
</cfif>

<cfif arguments.underwriter_choice eq '25' and (arguments.property_state eq 'MD' or arguments.property_state eq 'DC')>
<cfset arguments.reissue_rates = 0>
</cfif>



<!--- if this is a refi, Eagle Bank, in MD, DC, or VA they get special rates under First AM - so switch em to First Am --->
<CFQUERY datasource="#request.dsn#" NAME="check_company" maxrows="1">
SELECT company FROM companies where ID =  #arguments.company_id#
</CFQUERY>
<cfif (Mid(check_company.company, 1,10) eq 'Eagle Bank') and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and (arguments.property_state eq 'MD' or arguments.property_state eq 'VA' or arguments.property_state eq 'DC')>
<cfset arguments.underwriter_choice = 25>
</cfif>

<cfset total_1101 = 0>
<cfset roll_up_1101 = 0>
<cfset roll_up_1104 = 0>
<cfset roll_up_1201 = 0>
<cfset roll_up_1203 = 0>
<cfset roll_up_1301 = 0>
<cfset bulk_rate = 0>
<cfset current_ins_premium = "">
<cfif arguments.previous_loan_month eq 'NULL' or arguments.previous_loan_month eq '' or arguments.previous_loan_month eq '0'>
<cfset arguments.previous_loan_month = 1>
</cfif>
<cfif arguments.previous_loan_year eq 'NULL' or arguments.previous_loan_year eq '' or arguments.previous_loan_year eq '0'>
<cfset arguments.previous_loan_year = 2006>
</cfif>
<cfif arguments.purchase_price eq "">
<cfset arguments.purchase_price = 0>
</cfif>
<cfset arguments.property_county = ReplaceNoCase(arguments.property_county, "'", "", "ALL")>
<cfif arguments.transaction_type eq "ConstructionOnly">
<cfset arguments.transaction_type = "Purchase">
</cfif>	
<CFSET item_count = 1>
<CFSET ReturnXml = XmlNew()>
<CFSET ReturnXml.XmlRoot = XmlElemNew(ReturnXml, "RESPONSE")>
<cfset ReturnXml.RESPONSE.xmlAttributes.Type = "FeeInquiry">
<cfset ReturnXml.RESPONSE.DATA = XmlElemNew(ReturnXml, "DATA")>
<cfset ReturnXml.RESPONSE.DATA.MAIN = XmlElemNew(ReturnXml, "MAIN")>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN = XmlElemNew(ReturnXml, "LOAN")>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN._APPLICATION = XmlElemNew(ReturnXml, "_APPLICATION")>
<cfif isDefined("session.comp_id") AND Len(session.comp_id)>
<CFQUERY datasource="#request.dsn#" NAME="insert_hit">
Insert into Fee_Generator_Hits (date_of_use, comp_id, state, transaction_type, processor_email, officer_email)
values (#createodbcdatetime(now())#, #session.comp_id#, '#arguments.property_state#', '#arguments.transaction_type#', '#arguments.p_email#', '#arguments.o_email#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="insert_hit">
Insert into Fee_Generator_Hits (date_of_use, comp_id, state, transaction_type, processor_email, officer_email)
values (#createodbcdatetime(now())#, #arguments.company_id#, '#arguments.property_state#', '#arguments.transaction_type#', '#arguments.p_email#', '#arguments.o_email#')
</CFQUERY>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="get_all_comp_info">
SELECT * FROM Companies where ID = #trim(arguments.company_id)#
</CFQUERY>
<cfset fees_query = QueryNew("Line_Number, Description, Amount, Payer, Outside, Payto")>	

<cfif get_all_comp_info.alta_8_1 eq 1>
<cfset arguments.opt_alta_8_1 = 1>
</cfif>
<cfif get_all_comp_info.alta_9 eq 1>
<cfset arguments.opt_alta_9 = 1>
</cfif>


<cfparam name="arguments.add_or_remove_num" default="0">
<cfparam name="arguments.add_or_remove" default="0">

<cfset temp = #GetRecFees(arguments.transaction_type,arguments.property_state,arguments.property_county,arguments.property_city,arguments.loan_amount,arguments.purchase_price,arguments.previous_loan_amount,arguments.property_use_type,arguments.company_id,arguments.return_data,arguments.previous_loan_month,arguments.previous_loan_year,arguments.previous_purch_year,arguments.previous_purch_month,arguments.previous_purch_amount,arguments.enhanced_coverage,arguments.same_lender,arguments.reissue_rates,arguments.jlp_policy,arguments.property_report,arguments.appraised_value,arguments.seller_paid_lender_policy,arguments.seller_paid_owner_policy,arguments.buyer_paid_lender_policy,arguments.buyer_paid_owner_policy,arguments.asset_manager,arguments.cema,arguments.transfer_tax_paid_by,arguments.title_id,arguments.first_time_buyer,arguments.encompass,arguments.underwriter_choice,arguments.delinquency,arguments.insured,arguments.assessed_value,arguments.new_deed,arguments.current_deed_num,arguments.add_or_remove,arguments.add_or_remove_num,arguments.previous_purchase_mortgage)#>



<cfset pre_enhanced_amount = 0>
<cfset buyers_portion_owner_policy = 0>


<cfif arguments.property_report eq 0>
 
<cfif arguments.property_state eq 'UT'>
<cfset title_co_name = "Cottonwood Title Insurance Agency, Inc.">
<cfelseif arguments.property_state eq 'IA'>
<cfset title_co_name = "Gomez May LLP">
<cfelseif arguments.property_state eq 'NV'>
<cfset title_co_name = "Placer Title Company">
<cfelseif arguments.property_state eq 'AR'>
<cfset title_co_name = "Capstone Pioneer Settlement Services">
<cfelseif arguments.property_state eq 'CA'>
<cfset title_co_name = "North American Title Company">
<cfelseif arguments.company_id eq 2632>
<cfset title_co_name = "Axiom Title">
<cfelseif  arguments.company_id eq 3722 or arguments.company_id eq 4752>
<cfset title_co_name = "Community Real Estate Services, LLC">
<cfelse>
<cfset title_co_name = "First Title & Escrow, Inc.">
</cfif>

<!--- 1109 TITLE INSURANCE --->
<!--- is this an ROA Hutton file, even though it's a refi, needs to record Title Insurance as if it's a purchase, so we'll temporarily make this a purchase, figure out TI, then change it back to a refi --->
<cfif arguments.company_id eq 3276 or arguments.company_id eq 3943 or arguments.company_id eq 4043 or arguments.company_id eq 4042 or arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702>
<cfset arguments.transaction_type = "Purchase">
</cfif>
<cfset a_ins_premium = "">

<!--- now let's check if this is a Junior Loan Policy, and if so, calculate the insurance --->
<cfif arguments.transaction_type contains 'Second Mortgage' and arguments.jlp_policy eq 1 and arguments.loan_amount LTE 200000>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>	
<CFQUERY datasource="#request.dsn#" NAME="get_table_name" maxrows="1">		
SELECT jlp_table
FROM Zip_info
where state = '#arguments.property_state#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT second_mortgage FROM #get_table_name.jlp_table# WHERE a_to >= #x_final# order by a_to
</CFQUERY>
<cfset a_ins_premium = read_ins_calc.second_mortgage>

<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", NumberFormat(Ceiling(a_ins_premium), '_____.__'), "Buyer", 1)>
<cfif a_ins_premium eq ''><cfset a_ins_premium = 0></cfif>

<cfset roll_up_1101 = roll_up_1101 + a_ins_premium>
<cfelse>
<cfset expedite_states = "AL,AR,DE,DC,GA,IL,IN,IA,KY,LA,ME,MD,MA,MN,MI,MO,NH,NC,ND,OK,SC,VT,VA,WI,WV">


<!--- getUnderwriter function goes here --->
<cfset temp = getUnderwriter(arguments.property_state, arguments.property_county, arguments.property_city, arguments.underwriter_choice, arguments.title_id, arguments.transaction_type, arguments.enhanced_coverage, arguments.company_id)>


<cfset out_of_range = 0>



<cfif arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1>
<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
<cfelse>
<cfif NOT IsNumeric(arguments.loan_amount) or arguments.loan_amount eq '' or arguments.loan_amount eq 'NULL'>
<CFSET   arguments.loan_amount = 0>
</cfif>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
</cfif>			




<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to>= #x_final# order by a_to
</CFQUERY>


<cfif arguments.property_state eq 'TX'>
<cfif arguments.loan_amount eq 0>
  <cfif x_final LTe 100000>
  <cfset read_ins_calc.sale = read_ins_calc.sale>
  <cfelseif x_final LTe 1000000>
  <cfset leftover = x_final - 100000>
  <cfset premium = Round(leftover * .00554)>
  <cfset read_ins_calc.sale = premium + 875>
  <cfelseif x_final LTe 5000000>
  <cfset leftover = x_final - 1000000>
  <cfset premium = Round(leftover * .00456)>
  <cfset read_ins_calc.sale = premium + 5861>
  <cfelseif x_final LTe 15000000>
  <cfset leftover = arguments.loan_amount - 5000000>
  <cfset premium = Round(leftover * .00376)>
  <cfset read_ins_calc.sale = premium + 24101>
  </cfif>
<cfset a_ins_premium = read_ins_calc.sale>



<cfelseif x_final LTe 100000>

<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT * FROM StateTexasStewart WHERE a_to >= #x_final# order by a_to
</CFQUERY>
<cfelseif x_final LTe 1000000>
  <cfset leftover = x_final - 100000>
  <cfset premium = Round(leftover * .00554)>
  <cfset read_ins_calc.sale = premium + 875>
<cfelseif x_final LTe 5000000>
  <cfset leftover = x_final - 1000000>
  <cfset premium = Round(leftover * .00456)>
  <cfset read_ins_calc.sale = premium + 5861>
<cfelseif x_final LTe 15000000>
  <cfset leftover = x_final - 5000000>
  <cfset premium = Round(leftover * .00376)>
  <cfset read_ins_calc.sale = premium + 24101>
</cfif>
  <cfset a_ins_premium = read_ins_calc.sale>
</cfif>


<cfset request.new_owners_premium = read_ins_calc.sale>

<cfif read_ins_calc.recordcount eq 0>
<cfset out_of_range = 1>
</cfif>


<cfif ((arguments.transaction_type eq "Refinance" or treat_as_refi eq 1) or arguments.transaction_type eq "Reverse Mortgage")>
<CFIF (arguments.company_id eq 1847 or arguments.company_id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
<CFSET a_ins_premium = #read_ins_calc.expedite#>
<cfelse>
<cfif arguments.property_state eq 'MI'>
<cfif IsNumeric(read_ins_calc.sale) and read_ins_calc.sale NEQ 'Call for Quote!'>
<CFSET a_ins_premium = (read_ins_calc.refinance)>
<cfelse>
<CFSET a_ins_premium = "Call for Quote!">
</cfif>
<cfelse>



<cfif arguments.underwriter_choice eq '25' and arguments.property_state eq 'MD' and arguments.enhanced_coverage eq 1>
<CFSET a_ins_premium = #read_ins_calc.enhanced_lenders#>
<cfelseif arguments.underwriter_choice eq '25' and arguments.property_state eq 'MD' and arguments.enhanced_coverage neq 1>
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6> 

			<cfif a_ins_premium LT 150>
			<CFSET a_ins_premium = 150>
			</cfif>

<cfelseif arguments.property_state eq 'KS'><!--- any underwriter --->
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .7>
<cfelseif arguments.property_state eq 'OH'><!--- any underwriter --->
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .7>
<cfelseif arguments.property_state eq 'CT'><!--- any underwriter --->
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>
<cfelseif arguments.underwriter_choice eq '25' and arguments.property_state eq 'DC'>
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>
<cfelseif arguments.underwriter_choice eq '25' and arguments.property_state eq 'CO'>
			<cfif arguments.loan_amount lte 250000>
			<cfset a_ins_premium = 350>
			<cfelseif arguments.loan_amount lte 500000>
			<cfset a_ins_premium =  350 + 400>
			<cfelseif arguments.loan_amount lte 750000>
			<cfset a_ins_premium =  350 + 400 + 450>
			<cfelseif arguments.loan_amount lte 1000000>
			<cfset a_ins_premium =  350 + 400 + 450 + 500>
			</cfif>
			<cfif arguments.loan_amount gt 5000000>
			<cfset a_ins_premium =  "Call for Quote!">
			<cfelseif arguments.loan_amount gt 3000000>
			<cfset a_ins_premium =  a_ins_premium + ((arguments.loan_amount-3000000) / 1000 * 1.55)>
			<cfset a_ins_premium =  a_ins_premium + ((2000000) / 1000 * 1.65)>
			<cfelseif arguments.loan_amount gt 1000000>
			<cfset a_ins_premium =  350 + 400 + 450 + 500>
			<cfset a_ins_premium =  a_ins_premium + ((arguments.loan_amount-1000000) / 1000 * 1.65)>
			</cfif>



<cfelseif arguments.underwriter_choice eq '16' and arguments.property_state eq 'WI'>
			<cfif arguments.loan_amount lte 500000>
				<cfset a_ins_premium = 475>
				<cfelseif arguments.loan_amount gte 500000>
				<cfset a_ins_premium =  475 + ((arguments.loan_amount-500000) / 1000 * 1)>			
			</cfif>			
			



<cfelseif arguments.underwriter_choice eq '25'  and arguments.property_state eq 'MA'>

<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>

<cfelseif arguments.underwriter_choice eq '16'  and arguments.property_state eq 'MA'>
	<cfset NumYears = 0>
	<cftry>
	<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
	<cfcatch>
	<cfset NumYears = 10>
	</cfcatch>
	</cftry>
	<cfif NumYears LTE 7>
	<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>
	<cfelse>
	<CFSET a_ins_premium = #read_ins_calc.Refinance#>
	</cfif>
<cfelseif arguments.underwriter_choice eq '16'  and arguments.property_state eq 'RI'>
<cftry>
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>
<cfcatch type="any">
<CFSET a_ins_premium = 'Call for Quote!'>
</cfcatch>
</cftry>

<cfelseif arguments.property_state eq 'VA' and (arguments.underwriter_choice eq '25'  or arguments.underwriter_choice eq '16')>

<cftry>
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .7>

<cfcatch type="any">
<CFSET a_ins_premium = 'Call for Quote!'>
</cfcatch>
</cftry>


<cfelseif arguments.property_state eq 'VA' and (arguments.underwriter_choice eq '30')>
<cftry>
			<cfif arguments.loan_amount lte 250000>
			<cfset a_ins_premium = arguments.loan_amount * .00167>
			<cfelseif arguments.loan_amount lte 500000>
			<cfset a_ins_premium = (250000 * .00167) + ((arguments.loan_amount - 250000) * .00133)>
			<cfelseif arguments.loan_amount lte 1000000>
			<cfset a_ins_premium = (250000 * .00167) + (250000 * .00133) + ((arguments.loan_amount - 500000) * .00116)>
			<cfelseif arguments.loan_amount lte 5000000>
			<cfset a_ins_premium = (250000 * .00167) + (250000 * .00133) + (500000 * .00116) + ((arguments.loan_amount - 1000000) * .00101)>
			<cfelseif arguments.loan_amount gt 5000000>
			<cfset a_ins_premium =  "Call for Quote!">
			</cfif>
			<cfif a_ins_premium lt 200>
			<cfset a_ins_premium = 200>
			</cfif>

<cfcatch type="any">
<CFSET a_ins_premium = 'Call for Quote!'>
</cfcatch>
</cftry>


<cfelseif arguments.property_state eq 'AL' and (arguments.underwriter_choice eq '16') and arguments.transaction_type eq 'Reverse Mortgage'>

<!---
Up to $100,000 of liability written ................................................. $3.50 
Over $100,000 and up to $500,000, add ....................................... $3.00 
Over $500,000 and up to $10,000,000, add ................................... $2.00 
Over $10,000,000 and up to $15,000,000, add .............................. $1.50 
Over $15,000,000, add ............................................................... $1.00 
Minimum charge ........................................ ...............................$125.00 
--->

			<cfif arguments.loan_amount lte 100000>
			<cfset a_ins_premium = arguments.loan_amount * .0035>
			<cfelseif arguments.loan_amount lte 500000>
			<cfset a_ins_premium = (100000 * .0035) + ((arguments.loan_amount - 100000) * .003)>
			<cfelseif arguments.loan_amount lte 10000000>
			<cfset a_ins_premium = (100000 * .0035) + (400000 * .003) + ((arguments.loan_amount - 500000) * .002)>
			<cfelseif arguments.loan_amount gt 10000000>
			<cfset a_ins_premium =  "Call for Quote!">
			</cfif>
			<cfif a_ins_premium lt 125>
			<cfset a_ins_premium = 125>
			</cfif>




<cfelseif arguments.property_state eq 'AL' and (arguments.underwriter_choice eq '30')>

<cftry>
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>
<cfcatch type="any">
<CFSET a_ins_premium = 'Call for Quote!'>
</cfcatch>
</cftry>


<cfelseif arguments.property_state eq 'OR' and arguments.opt_alta_9 eq 1>
<CFSET a_ins_premium = #read_ins_calc.enhanced_lenders#>

<cfelse>
<CFSET a_ins_premium = #read_ins_calc.Refinance#>
</cfif>


</cfif>
</CFIF>

<cfelseif arguments.transaction_type eq "Purchase" or treat_as_purchase eq 1>
<cfif a_ins_premium neq 'Call for Quote!'>
<CFSET a_ins_premium = #read_ins_calc.sale#>
</cfif>

<cfelseif arguments.transaction_type contains "Second Mortgage">
<CFSET a_ins_premium = #read_ins_calc.second_mortgage#>
</cfif>			


<cfif arguments.property_state eq 'NV' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and  arguments.underwriter_choice eq '25'>
<CFSET a_ins_premium = read_ins_calc.sale>
<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>

<cfif NumYears  LTE 3>
<CFSET a_ins_premium = read_ins_calc.short_term>
</cfif>
</cfif>

<cfif arguments.property_state eq 'PA' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>

<CFSET a_ins_premium = (#read_ins_calc.refinance#)>

</cfif>



<cfif arguments.property_state eq 'MD' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.underwriter_choice eq '16'>

<CFSET a_ins_premium = (#read_ins_calc.refinance# * .60)>

</cfif>


<cfif arguments.property_state eq 'NJ' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>
<cfif arguments.loan_amount LTE 100000>
<cfset a_ins_premium = arguments.loan_amount * .00275>
<cfelseif arguments.loan_amount LTE 500000>
<cfset a_ins_premium = 275 + ((arguments.loan_amount - 100000) * .0025)>
<cfelseif arguments.loan_amount LTE 2000000>
<cfset a_ins_premium = 275 + 1000 + ((arguments.loan_amount - 500000) * .00225)>
<cfelse>
<cfset a_ins_premium = 275 + 1000 + 3375 + ((arguments.loan_amount - 2000000) * .0015)>
</cfif>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="check_streamline">
SELECT * FROM companies where (id = #arguments.company_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="is_shapiro">
SELECT * FROM companies where (id = 2368 or master_co_id = 2368) and (id <> 3568)
</CFQUERY>
<cfset all_shapiro = ValueList(is_shapiro.ID, ",")>

<!--- Florida Refi but only for company ID 3910 --->
<cfif arguments.property_state eq 'FL' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.company_id eq 3910>
<cfset a_ins_premium = read_ins_calc.sale - 35>
<!--- the -35 part is because we have 35 dollars added to the "sale" transaction rate in the florida table --->
</cfif>



<cfset temp = getTexasRefis2nds(arguments.property_state, arguments.transaction_type,  arguments.previous_loan_amount, arguments.loan_amount, arguments.previous_loan_year, arguments.previous_loan_month)>



<!--- IN NATIC refi's and 2nds 1109--->
<CFIF arguments.property_state eq "IN" and ((arguments.transaction_type eq "Refinance" or treat_as_refi eq 1) or arguments.transaction_type contains "Second Mortgage" or arguments.transaction_type contains "Reverse Mortgage") and  arguments.underwriter_choice eq '30'>
<CFQUERY datasource="#request.dsn#" NAME="read_prev_ins_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #arguments.loan_amount# order by a_to
</CFQUERY>
<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>

<cfif NumYears LTE 3>
<CFSET a_ins_premium = #read_ins_calc.refinance#  * .7>
<cfelseif NumYears LTE 5>
<CFSET a_ins_premium = #read_ins_calc.refinance#  * .6>
<cfelseif NumYears LTE 10>
<CFSET a_ins_premium = #read_ins_calc.refinance#  * .5>
<cfelse>
<CFSET a_ins_premium = #read_ins_calc.refinance#>
</cfif>

<cfif a_ins_premium LT 150>
<cfset a_ins_premium = 150>
</cfif>

</cfif>


<cfset request.got_reissue_rate = 0>
<!--- MI no longer has reissue or subrates, so dont trigger these in MI, all other states should trigger --->
<cfif arguments.property_state neq 'MI'>

	<cfif arguments.underwriter_choice neq 25 or (arguments.underwriter_choice eq 25 and arguments.property_state neq 'DC' and arguments.property_state neq 'MD' and arguments.property_state neq 'MI' and arguments.property_state neq 'VA' and arguments.property_state neq 'CO') ><!--- first american has no reissue in DC, so run this only if it's not DC --->

<cfset a_ins_premium = #GetReissuerates(a_ins_premium, arguments.previous_loan_year, arguments.previous_loan_month,  arguments.previous_purch_year, arguments.previous_purch_month, arguments.previous_purch_amount, arguments.transaction_type, arguments.property_state, arguments.previous_loan_amount, arguments.loan_amount, arguments.company_id,  arguments.reissue_rates,  arguments.underwriter_choice)#>

	 </cfif>
     
     

	<cfif arguments.underwriter_choice neq 25><!--- first american has no sub-rates, so run 
	                                           this only if it's not first american --->
	
	

<cfset temp = GetSubrates(a_ins_premium, arguments.previous_loan_year, arguments.previous_loan_month,  arguments.previous_purch_year, arguments.previous_purch_month, arguments.previous_purch_amount, arguments.transaction_type, arguments.same_lender, arguments.property_state, arguments.previous_loan_amount, arguments.loan_amount, arguments.underwriter_choice)>
	
	</cfif>
	
</cfif>


<!--- if this is Chase, we need to take 70% off the current title ins premium, and record this new number for future use in the code (line 1101) --->
<cfif arguments.company_id eq 3343>
<cfif a_ins_premium lt 200>
<cfset a_ins_premium = 200>
</cfif>
<cfset chase_ti = a_ins_premium>
</cfif>
<!--- end --->


<!--- if this is Axcidion, and loan is less than, they get a 40% discount, then use the resulting number to figure out 1101 --->
<cfif (arguments.company_id eq 3492 or  arguments.company_id eq 5223) and arguments.loan_amount LT 500000>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>

<cfif (((arguments.company_id eq 3492 or (arguments.company_id eq 5223)) and arguments.loan_amount LT 500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1)) and arguments.property_state eq 'MD')>
<cfset a_1101 = 1070 <!--- - 320 ---> - a_ins_premium>
<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1070, '_____.__'), "Buyer")>
<cfif a_1101 gt 0>
<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
<cfset total_1101 = total_1101 + a_1101>
</cfif>
</cfif>


<cfif (arguments.company_id eq 7088 and arguments.loan_amount LT 500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and (arguments.property_state eq 'MD' or arguments.property_state eq 'VA'))>
<cfset a_1101 = 1100 <!--- - 320 ---> - a_ins_premium>
<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1100, '_____.__'), "Buyer")>
<cfif a_1101 gt 0>
<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
<cfset total_1101 = total_1101 + a_1101>
</cfif>
</cfif>

<cfif (arguments.company_id eq 7088 and arguments.loan_amount LT 500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and (arguments.property_state eq 'DC'))>
<cfset a_1101 = 1350 <!--- - 320 ---> - a_ins_premium>
<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1350, '_____.__'), "Buyer")>
<cfif a_1101 gt 0>
<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
<cfset total_1101 = total_1101 + a_1101>
</cfif>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="check_company" maxrows="1">
SELECT company FROM companies where ID =  #arguments.company_id#
</CFQUERY>
<cfif (Mid(check_company.company, 1,10) eq 'Eagle Bank') and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1)  and arguments.previous_loan_amount gt 0  and arguments.previous_loan_amount neq 'NULL'>
	<cfif arguments.property_state eq 'MD' or arguments.property_state eq 'VA'>
		<cfif arguments.loan_amount lte 500000>
			<cfset a_1101 = 1070 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 1070>
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1070, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 600000>
			<cfset a_1101 = 1350 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 1350>
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1350, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 700000>
			<cfset a_1101 = 1520 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 1520>
		<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1520, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 800000>
        
<cfif cgi.REMOTE_ADDR eq '98.233.235.105'>
<cfoutput>a_ins_premium = #a_ins_premium#</cfoutput>
<cfabort>
</cfif>

			<cfset a_1101 = 1680 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1680>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1680, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 900000>
			<cfset a_1101 = 1850 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 1850>
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1850, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1000000>
			<cfset a_1101 = 2020 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 2020>
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2020, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		</cfif>
	<cfelseif arguments.property_state eq 'DC' >
		<cfif arguments.loan_amount lte 500000>
			<cfset a_1101 = 1370 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 1370>
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1370, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 600000>
			<cfset a_1101 = 1650 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 1650>
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1650, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 700000>
			<cfset a_1101 = 1850 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 1850>
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1850, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 800000>
			<cfset a_1101 = 2050 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 2050>
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2050, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 900000>
			<cfset a_1101 = 2250 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 2250>
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2250, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1000000>
			<cfset a_1101 = 2450 <!--- - 320 ---> - a_ins_premium>
			<cfset a_ins_premium = 2450>
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2450, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		</cfif>
	</cfif>
</cfif>
<!--- NY Refinance --->
<cfif arguments.property_state eq 'NY' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>
	<cfset NumYears = 0>
	<cftry>
	<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
	<cfcatch>
	<cfset NumYears = 0>
	</cfcatch>
	</cftry>
	<cfif NumYears LTE 10>
		<cfif arguments.loan_amount gte 475000>
		<CFSET a_ins_premium = (#a_ins_premium# * .70)>
		<cfelse>
		<CFSET a_ins_premium = (#a_ins_premium# * .50)>
		</cfif>
	<cfelse>
	<CFSET a_ins_premium = #a_ins_premium#>
	</cfif>
</cfif>
<!--- end NY Refi --->



<!--- NJ Refinance --->
<cfif arguments.property_state eq 'NJ' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>
<cfif arguments.same_lender eq 1>
<cfif arguments.previous_loan_amount gt 0 and arguments.previous_loan_amount lt arguments.loan_amount>
<cfset new_money = arguments.loan_amount - arguments.previous_loan_amount>
<CFQUERY datasource="#request.dsn#" NAME="new_money_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #new_money# order by a_to
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="orig_money_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #arguments.previous_loan_amount# order by a_to
</CFQUERY>
<cfset a_ins_premium = new_money_calc.sale + orig_money_calc.refinance>
</cfif>
</cfif>
</cfif>
<!--- end NJ Refi --->


<!--- MS Refi, North American  --->
<cfif arguments.property_state eq 'MS' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.underwriter_choice eq 30>
	<cfset NumYears = 0>
	<cftry>
	<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
	<cfcatch>

	<cfset NumYears = 0>
	</cfcatch>
	</cftry>
	<cfif NumYears LTE 10>
		<CFSET a_ins_premium = (#a_ins_premium# * .50)>
	<cfelseif NumYears LTE 5>
		<CFSET a_ins_premium = (#a_ins_premium# * .40)>
	<cfelseif NumYears LTE 3>
		<CFSET a_ins_premium = (#a_ins_premium# * .30)>
	<cfelse>
	<CFSET a_ins_premium = #a_ins_premium#>
	</cfif>
</cfif>
<!--- end MS Refi, North American  --->

<!--- Chase/RealEC accounts get a special bucket rate in MI on North American  --->
<cfif arguments.property_state eq 'MI' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.underwriter_choice eq 30 and (arguments.company_id eq 7393 OR arguments.company_id eq 7402)>
<cfset get_table.table_to_use = "StateMichiganNaticBucketRates">
<CFQUERY datasource="#request.dsn#" NAME="get_refi_rate" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #arguments.loan_amount# order by a_to
</CFQUERY>
<cfset a_ins_premium = get_refi_rate.refinance>
</cfif>
<!--- end Chase/RealEC accounts get a special bucket rate in MI on North American --->


<!--- CA NATIC REFI --->
 <cfset temp = getNaticRefiCA(arguments.property_state, arguments.transaction_type, is_natic, arguments.loan_amount)>


<!--- If this is a refi, but there's no previous loan amount, then really it's not  refi and should either get the full loan rate, or a reissue loan rate if availale --->
<cfif (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and (arguments.previous_loan_amount eq 0 or arguments.previous_loan_amount eq '' or arguments.previous_loan_amount eq 'NULL') and request.got_reissue_rate eq 0>
<cfset a_ins_premium = read_ins_calc.refinance>
</cfif>






<!--- ALL Purchases --->
<CFIF arguments.transaction_type eq "Purchase" or treat_as_purchase eq 1>



<cfset temp = getSimulRate(arguments.property_state, arguments.property_county, arguments.purchase_price, arguments.loan_amount, arguments.underwriter_choice, arguments.enhanced_coverage)>

<cfset full_lenders = 0>
<cfset set_amount2 = 0>



<cfif NOT IsNumeric(arguments.loan_amount)>
<cfset arguments.loan_amount = 0>
</cfif>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
	<cfif arguments.loan_amount gt 0>
	<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset full_lenders = read_ins_calc.refinance>
	</cfif>

<cfif arguments.property_state eq 'TX'>
<cfif (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1) and (arguments.loan_amount eq 0 or arguments.loan_amount eq "")>
<cfset full_lenders = 0>
<cfelse>
<cfset full_lenders = #a_ins_premium#>
</cfif>
</cfif>	

<cfset lenders_amount = full_lenders>

<cftry>
<cfif arguments.property_state eq 'GA'>
<cfset owners_amount = full_owners_simul>
<cfelseif arguments.property_state eq 'NE'>
<cfset owners_amount = full_owners_simul - simul_rate>
<cfset Lenders_amount = simul_rate>
<cfelse>
<cfset owners_amount = full_owners_simul - full_lenders>
</cfif>
<cfcatch type="any"></cfcatch></cftry>


<cfif owners_amount gt 0>
<cfset buyer_paid_owners = owners_amount>
<cfelse>
<cfset buyer_paid_owners = simul_rate>
</cfif>


<cfset buyer_paid_lenders = lenders_amount>
	<cfif arguments.enhanced_coverage eq 1>
		<cfif arguments.property_state neq 'MD' and arguments.property_state neq 'VA'  and arguments.property_state neq 'MI'  and arguments.property_state neq 'NJ'>
		<cfif full_owners_simul neq 'Call for Quote!' and full_owners_simul neq ''>
		<cfset pre_enhanced_amount = (full_owners_simul - simul_rate) * .80>
		</cfif>
		</cfif>
	<!--- MD & VA  Purchases with enhanced Coverage, need to find out the pre-enhanced amount so we can substract it later if needed --->
		<cfif get_table.table_to_use eq 'StateMarylandStewartEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateMarylandStewart WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateMarylandFirstAmerican'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateMarylandFirstAmerican WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateVirginiaStewartEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateVirginiaStewart WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateVirginiaFirstAmericanEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateVirginiaFirstAmerican WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateMichiganStewartEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateMichiganStewart WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		</cfif>
		
	</cfif>

<cfif arguments.seller_paid_owner_policy eq 1 or (arguments.property_state eq 'IL' and arguments.buyer_paid_owner_policy neq 1)>
	<cfif arguments.enhanced_coverage eq 1>
		<cftry>
		<!--- <cfset seller_paid_owners = pre_enhanced_amount - buyer_paid_lenders> --->
		<cfset seller_paid_owners = buyer_paid_owners - (full_owners_simul - pre_enhanced_amount)>
		<cfcatch type="any">
		<cfset seller_paid_owners = 'Call for Quote'>
		</cfcatch>
		</cftry>
		<!--- <cfset buyer_paid_owners = full_owners_simul - pre_enhanced_amount> --->
		<cftry>
		<cfset buyer_paid_owners = buyer_paid_owners - seller_paid_owners>
		<cfcatch type="any">
		<cfset buyer_paid_owners = 'Call for Quote'>
		</cfcatch>
		</cftry>
	<cfelse>
		<cfset seller_paid_owners = full_owners_simul>
		<cfset buyer_paid_owners = 0>
		<cfif arguments.loan_amount gt 0>
			<cftry>
			<cfset seller_paid_owners = full_owners_simul - full_lenders>
			<cfset buyer_paid_lenders = full_lenders>
			<cfcatch type="any">
			<cfset seller_paid_owners = 'Call for Quote'>
			</cfcatch>
			</cftry>
			<cfset buyer_paid_owners = 0>
		</cfif>
	</cfif>	
</cfif>
	

	<cfif arguments.seller_paid_lender_policy eq 1>
	<cfset seller_paid_lenders = full_lenders - simul_rate>
	<cfset buyer_paid_lenders = simul_rate>
	</cfif>

<cfif arguments.property_state eq 'TX'>
<cfset underwriter_name = 'Fidelity National Title'>
<cfset title_co_name = 'Allegiance Title Company'>
</cfif>

<cfif arguments.property_state eq 'NM'>
<cfset underwriter_name = 'Stewart Title Guaranty Company'>
<cfset title_co_name = 'Allegiance Title Company'>
</cfif>

<cfif buyer_paid_owners neq 0>
<cftry>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", NumberFormat(buyer_paid_owners, '_____.__'), "Buyer",0, underwriter_name)>
<cfcatch type="any">
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", "Call for Quote!", "Buyer",0, underwriter_name)>
</cfcatch>
</cftry>
</cfif>
<cfif buyer_paid_lenders neq 0>
<cfset buyer_paid_lenders = Ceiling(buyer_paid_lenders)>
<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", buyer_paid_lenders, "Buyer",1,title_co_name)>
<cfif IsNumeric(buyer_paid_lenders)>
<cfset roll_up_1101 = roll_up_1101 + buyer_paid_lenders>
</cfif>
</cfif>



<cfif seller_paid_owners eq 'Call for Quote'>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", seller_paid_owners, "Seller", 0, underwriter_name)>
<cfelseif seller_paid_owners neq 0>
<cfif arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", NumberFormat(seller_paid_owners, '_____.__'), "Buyer",0, underwriter_name)>
<cfelse>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", NumberFormat(seller_paid_owners, '_____.__'), "Seller", 0, underwriter_name)>
</cfif>
</cfif>
<cfif seller_paid_lenders neq 0>
<cfset seller_paid_lenders = Ceiling(seller_paid_lenders)>
<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", NumberFormat(seller_paid_lenders, '_____.__'), "Seller", 0, title_co_name)>
</cfif>

</cfif>


<cfif (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1) and out_of_range eq 1>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", "Call for Quote!", "Buyer",0, underwriter_name)>
</cfif>





<cfif a_ins_premium neq 0 and trim(a_ins_premium) neq '' and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1)>
<cfif current_ins_premium NEQ "" and current_ins_premium LT a_ins_premium >
<cfif is_natic eq 0>
<cfset a_ins_premium = current_ins_premium>
</cfif>
</cfif>


<cfif arguments.property_state eq 'CO' and IsDefined("new_ins_premium")>
<cfset a_ins_premium = new_ins_premium>
</cfif>


<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", Ceiling(a_ins_premium), "Buyer", 1, title_co_name)>
<cfif IsNumeric(a_ins_premium)>
 <cfset roll_up_1101 = roll_up_1101 + a_ins_premium>
</cfif>
</cfif>

</cfif>


<cfif arguments.property_state eq 'TX' and IsDefined("a_ins_premium") and arguments.transaction_type eq 'Reverse Mortgage'>
<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", Ceiling(a_ins_premium), "Buyer", 1, title_co_name)>
<cfif IsNumeric(a_ins_premium)>
 <cfset roll_up_1101 = roll_up_1101 + a_ins_premium>
</cfif>
</cfif>

<!--- is this an ROA Hutton file, even though it's a refi, needs to record Title Insurance as if it's a purchase, so we've already temporarily made this a purchase, and figured out TI, so now lets change it back to a refi --->			
<cfif arguments.company_id eq 3276 or arguments.company_id eq 3943 or arguments.company_id eq 4043 or arguments.company_id eq 4042 or arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702>
<cfset arguments.transaction_type = "Refinance">
</cfif>

</cfif>
	
<cfif arguments.loan_amount gt 0>
<cfset temp = AddQueryItem(1105, "Lender's Title Policy Limit - (" & DollarFormat(arguments.loan_amount) & ")" , arguments.loan_amount, "Buyer", 1)>
</cfif>
<cfif arguments.purchase_price gt 0>
<cfset temp = AddQueryItem(1106, "Owner's Title Policy Limit - (" & DollarFormat(arguments.purchase_price) & ")" , arguments.purchase_price, "Buyer", 1)>
</cfif>


<cfset total_ti = 0>
<cfset county_ti_tax = 0>
<cfset city_ti_tax = 0>
<cfloop query="fees_query">
<cfif (fees_query.line_number eq 1103 or fees_query.line_number eq 1104) and IsNumeric(fees_query.amount)>
<cfset total_ti = total_ti + fees_query.amount>
</cfif>
</cfloop>

<cfif arguments.property_state eq 'KY'>
<cfset city_ti_tax = 0>
<cfset county_ti_tax = 0>
<cfif read_rec_fees.ti_premium_tax_county neq 'NULL' and read_rec_fees.ti_premium_tax_county neq ''>
<cfset county_ti_tax = total_ti * read_rec_fees.ti_premium_tax_county>
<cfif county_ti_tax GT 0>
<cfset temp = AddQueryItem(DetermineAltaLine(), "County Title Insurance Premium Tax", NumberFormat(county_ti_tax, '_____.__'), "Buyer", 0)>
</cfif>
</cfif>
<cfif read_rec_fees.ti_premium_tax_city neq 'NULL' and read_rec_fees.ti_premium_tax_city neq ''>
<cfset city_ti_tax = total_ti * read_rec_fees.ti_premium_tax_city>
<cfif city_ti_tax GT 0>
<cfset temp = AddQueryItem(DetermineAltaLine(), "City Title Insurance Premium Tax", NumberFormat(city_ti_tax, '_____.__'), "Buyer", 0)>
</cfif>
</cfif>
</cfif>



<cfif arguments.property_state eq 'WA'>
<!--- get state title insurance premium tax for this state (and/or county) from our database --->
<CFQUERY datasource="#request.dsn#" NAME="get_state_ti_tax">
SELECT * FROM StateTitleInsTaxRates WHERE (state = '#arguments.property_state#' and county = '#arguments.property_county#' and city = '#arguments.property_city#')
</CFQUERY>
<cfif get_state_ti_tax.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="get_state_ti_tax">
SELECT * FROM StateTitleInsTaxRates WHERE state = '#arguments.property_state#' and county = '#arguments.property_county#' and (city = 'ALL')
</CFQUERY>
</cfif>


<cfif get_state_ti_tax.percentage neq 'NULL' and get_state_ti_tax.percentage neq ''>
<cfset state_ti_tax = total_ti * get_state_ti_tax.percentage>
<cfif state_ti_tax GT 0>
<cfset temp = AddQueryItem(DetermineAltaLine(), "State Title Insurance Premium Tax", NumberFormat(state_ti_tax, '_____.__'), "Buyer", 0)>
</cfif>
</cfif>
</cfif>


<cfset request.natic_bulk_rates_used = 0>
<cfset request.which_bulk_rate_used = 'none'>
<cfset bulk_rates_allowed = 0>
<cfif arguments.property_state neq 'CA'>
<cfset temp = getBulkRates(arguments.company_id, arguments.transaction_type, arguments.property_state, arguments.loan_amount, arguments.title_id)>
</cfif>

<cfif arguments.property_state eq 'IN'>
<cfset temp = getIndianaSpecialRates(arguments.company_id, arguments.transaction_type, arguments.property_state, arguments.loan_amount, arguments.title_id)>
</cfif>

<cfset chicago_rates_allowed = 0>
<cfset chicago_rates_allowed2 = 0>
<cfset temp = getChicagoRates(arguments.company_id, arguments.transaction_type, arguments.property_state, arguments.loan_amount)>
<cfset temp = getChicagoRates2(arguments.company_id, arguments.transaction_type, arguments.property_state, arguments.property_county, arguments.loan_amount)>

		
<!--- here we are going to see if we should get the fees from a different account, if an 'asset manager' is chosen, we'll get the fees from that company, otherwise, we'll get them from the company placing the order --->
<cfif arguments.asset_manager neq '' and arguments.asset_manager neq 'NULL' and arguments.asset_manager neq 0>
<cfset billing_co_id_to_use = arguments.asset_manager>
<cfelse>
<cfset billing_co_id_to_use = arguments.company_id>
</cfif>		




<!--- 1204 Intangible Tax --->
<cfif arguments.company_id neq 3722 and arguments.company_id neq 4752 and arguments.company_id neq 4702>
<CFIF #read_rec_fees.intangible_tax# neq 0 and isnumeric(read_rec_fees.intangible_tax)>
<cfif arguments.transaction_type eq 'Reverse Mortgage'>
<CFSET intang_tax = #Ceiling(arguments.loan_amount * 1.5)# * #read_rec_fees.intangible_tax#>
<cfelse>
<CFSET intang_tax = #Ceiling(arguments.loan_amount)# * #read_rec_fees.intangible_tax#>
</cfif>

<cfif arguments.property_state eq 'FL' or arguments.property_state eq 'GA'>

<cfset temp = AddQueryItem(1205, "State tax/stamps: Intangible Tax", NumberFormat(intang_tax, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + intang_tax>
<cfelse>
<cfset temp = AddQueryItem(1206, "State tax/stamps: Intangible Tax", NumberFormat(intang_tax, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + intang_tax>
</cfif>
</cfif>
</cfif>

<cfif roll_up_1201 neq 0>
	<cfset temp = AddQueryItem(1201, "Government Recording Charges", NumberFormat(roll_up_1201, '_____.__'), "Buyer", 0)>
</cfif>



<!--- special New Orleans Charges --->
<cfif arguments.property_city eq 'New Orleans' and arguments.property_state eq 'LA'>
<cfif (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1) and arguments.loan_amount gt 0>
<cfset temp = AddQueryItem(1208, "Recording Fee to City of New Orleans", NumberFormat(650, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + 650>
<cfset temp = AddQueryItem(1209, "Notorial Archive Fee to City of New Orleans", NumberFormat(40, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + 40>
<cfelse>
<cfset temp = AddQueryItem(1208, "Recording Fee to City of New Orleans", NumberFormat(325, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + 325>
<cfset temp = AddQueryItem(1209, "Notorial Archive Fee to City of New Orleans", NumberFormat(20, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + 20>
</cfif>
</cfif>

<cfif arguments.company_id neq 3722 and arguments.company_id neq 4752 and arguments.company_id neq 4702>
	<cfset temp = AddQueryItem(1203, "Transfer Taxes", NumberFormat(roll_up_1203, '_____.__'), "Buyer", 0)>
</cfif>


<!--- get custom fees for this client --->
<!--- First let's make sure they even have fees set up for this state, because if not, there's no reason to do it, and it would throw an error anyway --->
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states_HUD2010 WHERE company_id = '#billing_co_id_to_use#' and a_states = '#arguments.property_state#' and county = '#arguments.property_county#'
order by state_id desc
</CFQUERY>
<cfif read_this_sets_billing_states.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states_HUD2010 WHERE company_id = '#billing_co_id_to_use#' and a_states = '#arguments.property_state#' and (county = '' or county IS NULL)
order by state_id desc
</CFQUERY>
</cfif>



<cfif read_this_sets_billing_states.recordcount neq 0>
<cfset temp = #GetLineCosts(arguments.asset_manager,arguments.company_id,arguments.property_state,arguments.property_county,arguments.transaction_type,arguments.loan_amount, arguments.delinquency, arguments.cema, arguments.closing_type, arguments.previous_loan_amount)#>
</cfif>



<!--- get CPL fee --->


<cfset temp = #GetCPL_Extra(arguments.loan_amount, arguments.underwriter_choice, arguments.property_state, arguments.property_county,arguments.transaction_type, arguments.company_id,arguments.cema)#>




<cfset temp = #GetSubEscrowAttorneyFees(arguments.property_state, arguments.property_county, arguments.transaction_type, arguments.company_id)#>

<cfif arguments.property_state eq 'OH'><!--- all underwriters --->
<cfset temp = AddQueryItem(DetermineAltaLine(), "Binder Fee to First Title", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 50>
</cfif>

<cfif arguments.property_state eq 'PA'>
<cfset temp = AddQueryItem(DetermineAltaLine(), "Tax Search", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 50>
</cfif>

<cfif arguments.property_state eq 'GA'>
<cfif arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "GRMA fee to GA Dept. of Banking & Finance", NumberFormat(10, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 10>
</cfif>
</cfif>


<cfif roll_up_1101 neq 0>
<cfset total_1101 = total_1101 + roll_up_1101>
</cfif>



<!--- gonna add up alta fees to add them to lender's title premium so we can split them between agency and underwriter --->
<cfset temp = #GetAltas2(arguments.opt_alta_4, arguments.opt_alta_4_1, arguments.opt_alta_5, arguments.opt_alta_5_1, arguments.opt_alta_6, arguments.opt_alta_6_1, arguments.opt_alta_6_2, arguments.opt_alta_7, arguments.opt_alta_8_1, arguments.opt_alta_9, arguments.opt_tx_1, arguments.opt_tx_2, arguments.opt_tx_3, arguments.opt_tx_4, arguments.opt_tx_5, arguments.opt_tx_6, arguments.opt_tx_7, arguments.opt_tx_8, arguments.opt_tx_9, arguments.opt_tx_10, arguments.opt_tx_11, arguments.opt_tx_12, arguments.opt_tx_13, arguments.opt_tx_14, arguments.opt_ut_4, arguments.opt_ut_41, arguments.opt_ut_5, arguments.opt_ut_51, arguments.opt_ut_6, arguments.opt_ut_61, arguments.opt_ut_62, arguments.opt_ut_81, arguments.opt_ut_9, arguments.opt_sd_comp, arguments.opt_sd_balloon, arguments.opt_sd_credit, arguments.opt_sd_7, arguments.opt_sd_6, arguments.opt_sd_4, arguments.opt_sd_5, arguments.opt_sd_9, arguments.opt_sd_8, arguments.opt_fl_nav, arguments.property_state, arguments.property_county, arguments.transaction_type, arguments.loan_amount, arguments.company_id)#>



<cfif total_alta neq 0>
<cfset total_1101 = total_1101 + total_alta>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="check_streamline">
SELECT * FROM companies where (id = #arguments.company_id#)
</CFQUERY>


<!--- Axidion 3942 & 5223
      Eagle - Raj  6013
	  BMIC Mortgage - Schiller  7088   --->

<cfif (arguments.company_id eq 3492 or arguments.company_id eq 5223 or arguments.company_id eq 7088) and arguments.loan_amount LT 500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and arguments.property_state eq 'MD'>

<cfelseif arguments.company_id eq 7088 and arguments.loan_amount LT 500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and (arguments.property_state eq 'DC' or arguments.property_state eq 'VA')>

<cfelseif (Mid(check_streamline.company, 1, 10) eq 'Eagle Bank') and arguments.loan_amount LTE 1000000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and (arguments.property_state eq 'DC' or arguments.property_state eq 'VA' or arguments.property_state eq 'MD')  and arguments.previous_loan_amount gt 0  and arguments.previous_loan_amount neq 'NULL'> 

<cfelse>
<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(Ceiling(total_1101), '_____.__'), "Buyer", 0, "")>
</cfif>
<!--- end --->


<cfparam name="arguments.ADD_OR_REMOVE" default="">
<cfparam name="arguments.ADD_OR_REMOVE_NUM" default="">
<cfparam name="arguments.APPRAISED_VALUE" default="">
<cfparam name="arguments.ASSESSED_VALUE" default="">
<cfparam name="arguments.ASSET_MANAGER" default="">
<cfparam name="arguments.BORROWER_OWNS" default="">
<cfparam name="arguments.BUYER_PAID_LENDER_POLICY" default="">
<cfparam name="arguments.BUYER_PAID_OWNER_POLICY" default="">
<cfparam name="arguments.CEMA" default="">
<cfparam name="arguments.CLOSING_TYPE" default="">
<cfparam name="arguments.COMPANY_ID" default="">
<cfparam name="arguments.CONSTRUCTION_DRAWS" default="">
<cfparam name="arguments.CURRENT_DEED_NUM" default="">
<cfparam name="arguments.DELINQUENCY" default="">
<cfparam name="arguments.ENCOMPASS" default="">
<cfparam name="arguments.ENHANCED_COVERAGE" default="">
<cfparam name="arguments.FIRST_TIME_BUYER" default="">
<cfparam name="arguments.INSURED" default="">
<cfparam name="arguments.JLP_POLICY" default="">
<cfparam name="arguments.LOAN_AMOUNT" default="">
<cfparam name="arguments.NEW_DEED" default="">
<cfparam name="arguments.NON_SPOUSES_ADDED" default="">
<cfparam name="arguments.NON_SPOUSES_REMOVED" default="">
<cfparam name="arguments.OPT_ALTA_4" default="">
<cfparam name="arguments.OPT_ALTA_4_1" default="">
<cfparam name="arguments.OPT_ALTA_5" default="">
<cfparam name="arguments.OPT_ALTA_5_1" default="">
<cfparam name="arguments.OPT_ALTA_6" default="">
<cfparam name="arguments.OPT_ALTA_6_1" default="">
<cfparam name="arguments.OPT_ALTA_6_2" default="">
<cfparam name="arguments.OPT_ALTA_7" default="">
<cfparam name="arguments.OPT_ALTA_8_1" default="">
<cfparam name="arguments.OPT_ALTA_9" default="">
<cfparam name="arguments.OPT_SD_4" default="">
<cfparam name="arguments.OPT_SD_5" default="">
<cfparam name="arguments.OPT_SD_6" default="">
<cfparam name="arguments.OPT_SD_7" default="">
<cfparam name="arguments.OPT_SD_8" default="">
<cfparam name="arguments.OPT_SD_9" default="">
<cfparam name="arguments.OPT_SD_BALLOON" default="">
<cfparam name="arguments.OPT_SD_COMP" default="">
<cfparam name="arguments.OPT_SD_CREDIT" default="">
<cfparam name="arguments.OPT_TX_1" default="">
<cfparam name="arguments.OPT_TX_10" default="">
<cfparam name="arguments.OPT_TX_11" default="">
<cfparam name="arguments.OPT_TX_12" default="">
<cfparam name="arguments.OPT_TX_13" default="">
<cfparam name="arguments.OPT_TX_14" default="">
<cfparam name="arguments.OPT_TX_2" default="">
<cfparam name="arguments.OPT_TX_3" default="">
<cfparam name="arguments.OPT_TX_4" default="">
<cfparam name="arguments.OPT_TX_5" default="">
<cfparam name="arguments.OPT_TX_6" default="">
<cfparam name="arguments.OPT_TX_7" default="">
<cfparam name="arguments.OPT_TX_8" default="">
<cfparam name="arguments.OPT_TX_9" default="">
<cfparam name="arguments.OPT_UT_4" default="">
<cfparam name="arguments.OPT_UT_41" default="">
<cfparam name="arguments.OPT_UT_5" default="">
<cfparam name="arguments.OPT_UT_51" default="">
<cfparam name="arguments.OPT_UT_6" default="">
<cfparam name="arguments.OPT_UT_61" default="">
<cfparam name="arguments.OPT_UT_62" default="">
<cfparam name="arguments.OPT_UT_81" default="">
<cfparam name="arguments.OPT_UT_9" default="">
<cfparam name="arguments.PREVIOUS_LOAN_AMOUNT" default="">
<cfparam name="arguments.PREVIOUS_LOAN_MONTH" default="">
<cfparam name="arguments.PREVIOUS_LOAN_YEAR" default="">
<cfparam name="arguments.PREVIOUS_PURCH_AMOUNT" default="">
<cfparam name="arguments.PREVIOUS_PURCH_MONTH" default="">
<cfparam name="arguments.PREVIOUS_PURCH_YEAR" default="">
<cfparam name="arguments.end_loan_original_loan_amount" default="">
<cfparam name="arguments.PROPERTY_CITY" default="">
<cfparam name="arguments.PROPERTY_COUNTY" default="">
<cfparam name="arguments.PROPERTY_REPORT" default="">
<cfparam name="arguments.PROPERTY_STATE" default="">
<cfparam name="arguments.PROPERTY_USE_TYPE" default="">
<cfparam name="arguments.PURCHASE_PRICE" default="">
<cfparam name="arguments.REISSUE_RATES" default="">
<cfparam name="arguments.RETURN_DATA" default="">
<cfparam name="arguments.SAME_LENDER" default="">
<cfparam name="arguments.SELLER_PAID_LENDER_POLICY" default="">
<cfparam name="arguments.SELLER_PAID_OWNER_POLICY" default="">
<cfparam name="arguments.SPOUSES_ADDED" default="">
<cfparam name="arguments.SPOUSES_REMOVED" default="">
<cfparam name="arguments.TITLE_ID" default="">
<cfparam name="arguments.TRANSACTION_TYPE" default="">
<cfparam name="arguments.TRANSFER_TAX_PAID_BY" default="">
<cfparam name="arguments.UNDERWRITER_CHOICE" default="">

<cfset temp = #getAgencySplits(arguments.ADD_OR_REMOVE,arguments.ADD_OR_REMOVE_NUM,arguments.APPRAISED_VALUE,arguments.ASSESSED_VALUE,arguments.ASSET_MANAGER,arguments.BORROWER_OWNS,arguments.BUYER_PAID_LENDER_POLICY,arguments.BUYER_PAID_OWNER_POLICY,arguments.CEMA,arguments.CLOSING_TYPE,arguments.COMPANY_ID,arguments.CONSTRUCTION_DRAWS,arguments.CURRENT_DEED_NUM,arguments.DELINQUENCY,arguments.ENCOMPASS,arguments.ENHANCED_COVERAGE,arguments.FIRST_TIME_BUYER,arguments.INSURED,arguments.JLP_POLICY,arguments.LOAN_AMOUNT,arguments.NEW_DEED,arguments.NON_SPOUSES_ADDED,arguments.NON_SPOUSES_REMOVED,arguments.OPT_ALTA_4,arguments.OPT_ALTA_4_1,arguments.OPT_ALTA_5,arguments.OPT_ALTA_5_1,arguments.OPT_ALTA_6,arguments.OPT_ALTA_6_1,arguments.OPT_ALTA_6_2,arguments.OPT_ALTA_7,arguments.OPT_ALTA_8_1,arguments.OPT_ALTA_9,arguments.OPT_SD_4,arguments.OPT_SD_5,arguments.OPT_SD_6,arguments.OPT_SD_7,arguments.OPT_SD_8,arguments.OPT_SD_9,arguments.OPT_SD_BALLOON,arguments.OPT_SD_COMP,arguments.OPT_SD_CREDIT,arguments.OPT_TX_1,arguments.OPT_TX_10,arguments.OPT_TX_11,arguments.OPT_TX_12,arguments.OPT_TX_13,arguments.OPT_TX_14,arguments.OPT_TX_2,arguments.OPT_TX_3,arguments.OPT_TX_4,arguments.OPT_TX_5,arguments.OPT_TX_6,arguments.OPT_TX_7,arguments.OPT_TX_8,arguments.OPT_TX_9,arguments.OPT_UT_4,arguments.OPT_UT_41,arguments.OPT_UT_5,arguments.OPT_UT_51,arguments.OPT_UT_6,arguments.OPT_UT_61,arguments.OPT_UT_62,arguments.OPT_UT_81,arguments.OPT_UT_9,arguments.PREVIOUS_LOAN_AMOUNT,arguments.PREVIOUS_LOAN_MONTH,arguments.PREVIOUS_LOAN_YEAR,arguments.PREVIOUS_PURCH_AMOUNT,arguments.PREVIOUS_PURCH_MONTH,arguments.PREVIOUS_PURCH_YEAR,arguments.end_loan_original_loan_amount,arguments.PROPERTY_CITY,arguments.PROPERTY_COUNTY,arguments.PROPERTY_REPORT,arguments.PROPERTY_STATE,arguments.PROPERTY_USE_TYPE,arguments.PURCHASE_PRICE,arguments.REISSUE_RATES,arguments.RETURN_DATA,arguments.SAME_LENDER,arguments.SELLER_PAID_LENDER_POLICY,arguments.SELLER_PAID_OWNER_POLICY,arguments.SPOUSES_ADDED,arguments.SPOUSES_REMOVED,arguments.TITLE_ID,arguments.TRANSACTION_TYPE,arguments.TRANSFER_TAX_PAID_BY,arguments.UNDERWRITER_CHOICE)#>


<!--- if this is (xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) then set all fees to the buyer side --->
<cfset fees_query2 = fees_query>
<!---  arguments.company_id eq 8712 or arguments.company_id eq 8618   --->
<cfif check_company.company contains 'Mason-McDuffie'>
<!-- loop through and find any seller fees --->
<cfloop query="fees_query">
<cfif fees_query.payer eq 'Seller' and fees_query.line_number gt 1201 and fees_query.line_number lt 1300>
<cfset temp_line_number = fees_query.line_number>
<cfset temp_amount = fees_query.amount>
<cfset temp_description = fees_query.description>

         <!--- These next parts total up, 1101, 1201, 1203, and 1301, because if a fee moves from seller to buyer, these would increase --->
		 <!--- 1100 series --->
         <cfif fees_query.line_number gt 1101 and fees_query.line_number lt 1200>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1101'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>


		 <!--- 1200 series --->
         <cfif fees_query.line_number gt 1201 and fees_query.line_number lt 1203>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1201'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>

		 <!--- 1203 series --->
         <cfif fees_query.line_number gt 1203 and fees_query.line_number lt 1300>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1203'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>

		 <!--- 1300 series --->
         <cfif fees_query.line_number gt 1301 and fees_query.line_number lt 1400>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1301'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>



         <!-- now loop through and see if there is a buyer-side of this fee already in place, and if there is, add the seller's fee to it -->		 
		 <cfset found_one = 0>
         <cfloop query="fees_query2">
		 <cfif fees_query2.line_number eq temp_line_number and fees_query2.description eq temp_description and fees_query2.payer eq 'Buyer' and found_one eq 0>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
		 <cfset found_one = 1>
         </cfif>
		 </cfloop>
	
	    <!--- if a buyer-side version of the fee was not found, then just change this seller fee to a buyer fee --->
		<cfif found_one eq 0>
         <cfloop query="fees_query2">
		 <cfif fees_query2.line_number eq temp_line_number and fees_query2.description eq temp_description and fees_query2.payer eq 'Seller'>
			<cfset temp = QuerySetCell(fees_query, "Payer", 'Buyer', fees_query.currentrow)>
			<cfset temp = QuerySetCell(fees_query, "Outside", '1', fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>
</cfif>
</cfloop>

<!--- lastly, recall the query getting rid of anything left over on the seller side in the 1200 series --->
<cfquery dbtype="query" name="new_query">
select *
from fees_query
where (payer = 'Buyer') or (payer = 'Seller' and line_number < 1200) or (payer = 'Seller' and line_number > 1299) 
</cfquery>
<cfset fees_query = new_query>

</cfif> 
<!--- END if this is (xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) then set all fees to the buyer side --->






<!--- if this is a George Mason acct then set all fees to the buyer side --->
<cfset fees_query2 = fees_query>
<!---  arguments.company_id eq 8712 or arguments.company_id eq 8618   --->

<cfif check_company.company contains 'George Mason' and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1)>
<!-- loop through and find any seller fees --->
<cfloop query="fees_query">
<cfif fees_query.payer eq 'Seller' and fees_query.line_number gt 1201 and fees_query.line_number lt 1300>
<cfset temp_line_number = fees_query.line_number>
<cfset temp_amount = fees_query.amount>
<cfset temp_description = fees_query.description>

         <!--- These next parts total up, 1101, 1201, 1203, and 1301, because if a fee moves from seller to buyer, these would increase --->

		 <!--- 1200 series --->
         <cfif fees_query.line_number gt 1201 and fees_query.line_number lt 1203>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1201'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>

		 <!--- 1203 series --->
         <cfif fees_query.line_number gt 1203 and fees_query.line_number lt 1300>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1203'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>




         <!-- now loop through and see if there is a buyer-side of this fee already in place, and if there is, add the seller's fee to it -->		 
		 <cfset found_one = 0>
         <cfloop query="fees_query2">
		 <cfif fees_query2.line_number eq temp_line_number and fees_query2.description eq temp_description and fees_query2.payer eq 'Buyer' and found_one eq 0>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
		 <cfset found_one = 1>
         </cfif>
		 </cfloop>
	
	    <!--- if a buyer-side version of the fee was not found, then just change this seller fee to a buyer fee --->
		<cfif found_one eq 0>
         <cfloop query="fees_query2">
		 <cfif fees_query2.line_number eq temp_line_number and fees_query2.description eq temp_description and fees_query2.payer eq 'Seller'>
			<cfset temp = QuerySetCell(fees_query, "Payer", 'Buyer', fees_query.currentrow)>
			<cfset temp = QuerySetCell(fees_query, "Outside", '1', fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>
</cfif>
</cfloop>

<!--- lastly, recall the query getting rid of anything left over on the seller side in the 1200 series --->
<cfquery dbtype="query" name="new_query">
select *
from fees_query
where (payer = 'Buyer') or (payer = 'Seller' and line_number < 1200) or (payer = 'Seller' and line_number > 1299) 
</cfquery>
<cfset fees_query = new_query>

</cfif> 
<!--- END if this is a George Mason acct then set all fees to the buyer side --->







<!--- if this is a refi with a new deed, recalulate the transfer taxes  --->
<!---
Add the following boxes on calculator and order form:
1. How many parties on title ?
2. Do you wan tto add or remove parties from title 
3. How many (that are non-exempt) ?

Calculate the amount due using the percentage portion of total transfer taxes for that juridiction.  Ex : 2 parties on title, and addeng 1, they would be 1/3 of transfer taxes - 1 party on title and adding one, they would be 50%.  2 on, and removing 1, they would be 50%
--->
<cfif (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.new_deed eq 1>
<!--- figure out the percentage --->
<cfif arguments.add_or_remove eq 'add'>
<cfset deed_percentage = arguments.add_or_remove_num / (arguments.current_deed_num + arguments.add_or_remove_num)>
<cfelseif arguments.add_or_remove eq 'remove'>
<cfset deed_percentage = arguments.add_or_remove_num / (arguments.current_deed_num)>
</cfif>

<!-- loop through and find any seller fees --->
<cfloop query="fees_query">
<cfif fees_query.line_number gt 1202 and fees_query.line_number lt 1300>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount * deed_percentage, fees_query.currentrow)>
         <cfset temp = QuerySetCell(fees_query, "Payer", "Buyer", fees_query.currentrow)>
</cfif>
</cfloop>



</cfif> 
<!--- END if this is a refi with a new deed, recalulate the transfer taxes  --->




<!--- if this is shore processing, take out all but 1100 and 1200 series --->
<cfif arguments.company_id eq 6780>
<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
where (line_number < 1300 and line_number > 1099) or (line_number = 0)
order by line_number
</cfquery>

<cfset fees_query = fee_detail>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_company_info">
SELECT     *
FROM         Companies
where id = #arguments.company_id#
</CFQUERY>



<cfif arguments.transaction_type eq 'Construction'>
<cfset temp = #getConstructionLoans(arguments.ADD_OR_REMOVE,arguments.ADD_OR_REMOVE_NUM,arguments.APPRAISED_VALUE,arguments.ASSESSED_VALUE,arguments.ASSET_MANAGER,arguments.BORROWER_OWNS,arguments.BUYER_PAID_LENDER_POLICY,arguments.BUYER_PAID_OWNER_POLICY,arguments.CEMA,arguments.CLOSING_TYPE,arguments.COMPANY_ID,arguments.CONSTRUCTION_DRAWS,arguments.CURRENT_DEED_NUM,arguments.DELINQUENCY,arguments.ENCOMPASS,arguments.ENHANCED_COVERAGE,arguments.FIRST_TIME_BUYER,arguments.INSURED,arguments.JLP_POLICY,arguments.LOAN_AMOUNT,arguments.NEW_DEED,arguments.NON_SPOUSES_ADDED,arguments.NON_SPOUSES_REMOVED,arguments.OPT_ALTA_4,arguments.OPT_ALTA_4_1,arguments.OPT_ALTA_5,arguments.OPT_ALTA_5_1,arguments.OPT_ALTA_6,arguments.OPT_ALTA_6_1,arguments.OPT_ALTA_6_2,arguments.OPT_ALTA_7,arguments.OPT_ALTA_8_1,arguments.OPT_ALTA_9,arguments.OPT_SD_4,arguments.OPT_SD_5,arguments.OPT_SD_6,arguments.OPT_SD_7,arguments.OPT_SD_8,arguments.OPT_SD_9,arguments.OPT_SD_BALLOON,arguments.OPT_SD_COMP,arguments.OPT_SD_CREDIT,arguments.OPT_TX_1,arguments.OPT_TX_10,arguments.OPT_TX_11,arguments.OPT_TX_12,arguments.OPT_TX_13,arguments.OPT_TX_14,arguments.OPT_TX_2,arguments.OPT_TX_3,arguments.OPT_TX_4,arguments.OPT_TX_5,arguments.OPT_TX_6,arguments.OPT_TX_7,arguments.OPT_TX_8,arguments.OPT_TX_9,arguments.OPT_UT_4,arguments.OPT_UT_41,arguments.OPT_UT_5,arguments.OPT_UT_51,arguments.OPT_UT_6,arguments.OPT_UT_61,arguments.OPT_UT_62,arguments.OPT_UT_81,arguments.OPT_UT_9,arguments.PREVIOUS_LOAN_AMOUNT,arguments.PREVIOUS_LOAN_MONTH,arguments.PREVIOUS_LOAN_YEAR,arguments.PREVIOUS_PURCH_AMOUNT,arguments.PREVIOUS_PURCH_MONTH,arguments.PREVIOUS_PURCH_YEAR,arguments.end_loan_original_loan_amount,arguments.PROPERTY_CITY,arguments.PROPERTY_COUNTY,arguments.PROPERTY_REPORT,arguments.PROPERTY_STATE,arguments.PROPERTY_USE_TYPE,arguments.PURCHASE_PRICE,arguments.REISSUE_RATES,arguments.RETURN_DATA,arguments.SAME_LENDER,arguments.SELLER_PAID_LENDER_POLICY,arguments.SELLER_PAID_OWNER_POLICY,arguments.SPOUSES_ADDED,arguments.SPOUSES_REMOVED,arguments.TITLE_ID,arguments.TRANSACTION_TYPE,arguments.TRANSFER_TAX_PAID_BY,arguments.UNDERWRITER_CHOICE)#>
</cfif>



<cfif arguments.encompass eq 1>
<cfinclude template="../encompass/encompass_xml_transform.cfm" >
<cfelse>
<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>
</cfif>

<cfif arguments.property_state eq 'TX'>
<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>
</cfif>



<cfif mid(get_company_info.company,1,3) eq 'GMM'>

<cfif arguments.property_state eq 'MD'>

<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
where line_number > 1200
</cfquery>

<cfloop query="fee_detail">
<cfif fee_detail.payer eq 'Seller'>

<cfloop query="fees_query">
    <cfif fees_query.line_number eq fee_detail.line_number and fees_query.description eq fee_detail.description and fees_query.payer eq 'Buyer'>
    <cftry>
    <cfset new_amount = fees_query.amount + fee_detail.amount>
    <cfcatch type="any">
    <cfset new_amount = fee_detail.amount>
    </cfcatch>
    </cftry>
        <cfset fees_query[ "amount" ][ fees_query.currentRow ] = javaCast("int",#new_amount#) />
    </cfif>
</cfloop>
</cfif>
</cfloop>
</cfif>

<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
where payer = 'Buyer'
order by line_number
</cfquery>

<cfset fees_query = fee_detail>

<cfloop query="fees_query">
<!---<cfif fees_query.outside eq 0 and fees_query.line_number neq 1101 and fees_query.line_number neq 1201 and fees_query.line_number neq 1203 and fees_query.line_number neq 1301 and fees_query.line_number neq 1103>
<cfset fees_query[ "outside" ][ fees_query.currentrow ] = 1>
</cfif>--->


<cfif fees_query.description contains 'Attorney Disbursement'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Attorney's Fees">
</cfif>


<cfif fees_query.description contains 'Attorney Review'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Attorney's Fees">
</cfif>

<cfif fees_query.description contains 'Overnight Fee'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Courier Fee">
</cfif>

<cfif fees_query.description contains 'Tax Search'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Tax Status Research Fee">
</cfif>

<cfif fees_query.description contains 'Title Insurance Binder Fee'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Title Insurance Binder">
</cfif>


<cfif fees_query.description contains 'CPL'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Closing Protection Letter">
</cfif>



<cfif arguments.property_state eq 'PA'>
<cfif fees_query.description contains 'Short Form Policy'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Short Form Policy">
</cfif>
</cfif>

<cfif arguments.property_state eq 'GA'>
<cfif fees_query.description contains 'Title Examination'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Title Examination">
</cfif>
<cfif fees_query.description contains 'GRMA'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "GA Residential Mortgage Act Per Loan Fee">
</cfif>
</cfif>

<cfif arguments.property_state eq 'NC'>
<cfif Find('Recording Service Fee to', fees_query.description)>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Recording Services Fee">
<cfset fees_query[ "payto" ][ fees_query.currentrow ] = ReplaceNoCase(fees_query.description, 'Recording Service Fee to ', '', "ALL")>
</cfif>
</cfif>


<cfif Find('Recording Service Fee', fees_query.description)>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Recording Services Fee">
<cfset fees_query[ "payto" ][ fees_query.currentrow ] = ReplaceNoCase(fees_query.description, 'Recording Service Fee to ', '', "ALL")>
</cfif>

</cfloop>


<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>
</cfif>


<!---<cfmail to="rick@jermain.com" from="rjermain@firsttitleservices.com" subject="test" type="html">
<cfoutput>#mid(get_company_info.company,1,3)#</cfoutput>
<cfdump var="#fee_detail#">
</cfmail>
--->
<cfloop query="fee_detail">
<!---<cfif mid(get_company_info.company,1,3) eq 'GMM'>--->

<cfif Mid(fee_detail.line_number,1,4) eq 1109 or Mid(fee_detail.line_number,1,4) eq 1102 or Mid(fee_detail.line_number,1,4) eq 1104 or Mid(fee_detail.line_number,1,4) eq 1202 or Mid(fee_detail.line_number,1,4) eq 1204 or Mid(fee_detail.line_number,1,4) eq 1205 or Mid(fee_detail.line_number,1,4) eq 1206 or Mid(fee_detail.line_number,1,4) gte 1302>
<cfset fee_detail[ "outside" ][ fee_detail.currentrow ] = 0>
</cfif>

<cfif fee_detail.line_number gt 1109 and fee_detail.line_number lt 1200 and fee_detail.payer eq 'Buyer'>
<cfset fee_detail[ "outside" ][ fee_detail.currentrow ] = 0>
</cfif>





<!---</cfif>--->


<cfif fee_detail.line_number neq 1203>
<cfif IsNumeric(fee_detail.amount)>
<cfset temp = AddXMLItem(fee_detail.line_number, fee_detail.description, NumberFormat(fee_detail.amount, '_____.__'), fee_detail.payer, arguments.company_id, fee_detail.outside, fee_detail.payto)>
<cfelse>
<cfset temp = AddXMLItem(fee_detail.line_number, fee_detail.description, fee_detail.amount, fee_detail.payer, arguments.company_id, fee_detail.outside, fee_detail.payto)>
</cfif>
</cfif>
</cfloop>



<!---<cfloop query="fees_query">
<cfif arguments.property_state eq 'TX'>
<cfif fees_query.description contains 'Tax Cert Fee'>
<cfset fees_query[ "outside" ][ fees_query.currentrow ] = 1>
</cfif>
</cfif>
</cfloop>--->

<!---<cfmail to="rick@jermain.com" from="rjermain@firsttitleservices.com" subject="test" type="html">
<cfoutput>#mid(get_company_info.company,1,3)#</cfoutput>
<cfdump var="#fee_detail#">
<cfdump var="#ReturnXML#">
</cfmail>--->



<cffile action="write" addnewline="no" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\temp_xml.xml" output="#ReturnXML#" nameconflict="overwrite">
<cfif arguments.return_data eq 2 or arguments.encompass eq 1>
<cfset session.XMLOUT = ReturnXML>
</cfif>
<cfif isDefined("url.rec_id") and url.rec_id neq ''>



<cfif request.which_bulk_rate_used eq 'Natic'>
<cfset insurance_co = 30>
<cfelseif request.which_bulk_rate_used eq 'Stewart' or request.which_bulk_rate_used eq 'Chicago Local Rates' or request.which_bulk_rate_used eq 'Chicago Rates'>
<cfset insurance_co = 16>
</cfif>
<!--- update the file that it got the bulk rate --->
			<CFQUERY datasource="#request.dsn#" NAME="update_bulk_rate">		
			update title
			set which_bulk_rate_used = '#request.which_bulk_rate_used#'
			where title_id = '#url.rec_id#'
			</CFQUERY>
<cfif request.which_bulk_rate_used neq 'none'>
			<CFQUERY datasource="#request.dsn#" NAME="update_ti_co">		
			update doc_title_insurance_title
			set insurance_co = '#insurance_co#'
			where title_id = '#url.rec_id#'
			</CFQUERY>
</cfif>
</cfif>


<cfreturn fees_query>			
</cffunction>



</cfcomponent>
