<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<cfsavecontent variable="soapBody" >
    <cfoutput>
    	<?xml version="1.0" encoding="utf-8"?>
        <soap:Envelope 
        	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            
          <soap:Body>
          <!--- Ernst XML Request Body --->
          <Request>
  <Version></Version>
  <Authentication>
    <UserID>stijmajor</UserID>
    <Password>major</Password>
  </Authentication>
  <TransactionDate></TransactionDate>
  <ClientTransactionID></ClientTransactionID>
  <Guarantee>1</Guarantee>
  <Purpose>Pricing</Purpose>
  <ErnstRequest>
    <Version>2</Version>
    <Options>
      <Option>
        <Name></Name>
        <Value></Value>
      </Option>
    </Options>
    <TransactionCode>100</TransactionCode>
    <DataSource></DataSource>
    <EstimatedClosingDate></EstimatedClosingDate>
    <Property>
      <Page></Page>
      <City></City>
      <County></County>
      <State></State>
      <FullAddress></FullAddress>
      <EstimatedValue></EstimatedValue>
      <MortgageAmount></MortgageAmount>
      <OriginalDebtAmount></OriginalDebtAmount>
      <UnpaidPrincipalBalance></UnpaidPrincipalBalance>
      <Title></Title>
      <TitleAmount></TitleAmount>
      <OwnersTitleAmount></OwnersTitleAmount>
      <OriginalTitleAmount></OriginalTitleAmount>
      <OriginalMortgageDate></OriginalMortgageDate>
      <StateQuestions>
        <Q1></Q1>
        <Q2></Q2>
        <Q3></Q3>
        <Q4></Q4>
        <Q5></Q5>
        <Q6></Q6>
        <Q7></Q7>
        <Q8></Q8>
        <Q9></Q9>
        <Q10></Q10>
        <Q11></Q11>
        <Q12></Q12>
        <Q13></Q13>
        <Q14></Q14>
        <Q15></Q15>
        <Q16></Q16>
        <Q17></Q17>
        <Q18></Q18>
        <Q19></Q19>
        <Q20></Q20>
        <Q21></Q21>
        <Q22></Q22>
        <Q23></Q23>
        <Q24></Q24>
        <Q25></Q25>
        <Q26></Q26>
        <Q27></Q27>
        <Q28></Q28>
        <Q29></Q29>
        <Q30></Q30>
        <Q31></Q31>
        <Q32></Q32>
        <Q33></Q33>
        <Q34></Q34>
        <Q35></Q35>
        <Q36></Q36>
        <Q37></Q37>
        <Q38></Q38>
        <Q39></Q39>
        <Q40></Q40>
        <Q41></Q41>
        <Q42></Q42>
        <Q43></Q43>
        <Q44></Q44>
        <Q45></Q45>
        <Q46></Q46>
        <Q47></Q47>
        <Q48></Q48>
        <Q49></Q49>
        <Q50></Q50>
        <V1></V1>
        <V2></V2>
        <V3></V3>
        <V4></V4>
        <V5></V5>
        <V6></V6>
        <V7></V7>
        <V8></V8>
        <V9></V9>
        <V10></V10>
        <V11></V11>
        <V12></V12>
        <V13></V13>
        <V14></V14>
        <V15></V15>
        <V16></V16>
        <V17></V17>
        <V18></V18>
        <V19></V19>
        <V20></V20>
        <V21></V21>
        <V22></V22>
        <V23></V23>
        <V24></V24>
        <V25></V25>
        <V26></V26>
        <V27></V27>
        <V28></V28>
        <V29></V29>
        <V30></V30>
        <V31></V31>
        <V32></V32>
        <V33></V33>
        <V34></V34>
        <V35></V35>
        <V36></V36>
        <V37></V37>
        <V38></V38>
        <V39></V39>
        <V40></V40>
        <V41></V41>
        <V42></V42>
        <V43></V43>
        <V44></V44>
        <V45></V45>
        <V46></V46>
        <V47></V47>
        <V48></V48>
        <V49></V49>
        <V50></V50>
      </StateQuestions>
    </Property>
    <NumberOfPages>
      <Mortgage></Mortgage>
      <Deed></Deed>
    </NumberOfPages>
    <Mortgage>
      <AmendmentModificationPages></AmendmentModificationPages>
      <Index>
        <NumberOfGrantors></NumberOfGrantors>
        <NumberOfGrantees></NumberOfGrantees>
        <NumberOfSurnames></NumberOfSurnames>
        <NumberOfSignatures></NumberOfSignatures>
      </Index>
    </Mortgage>
    <Deed>
      <AmendmentModificationPages></AmendmentModificationPages>
      <Index>
        <NumberOfGrantors></NumberOfGrantors>
        <NumberOfGrantees></NumberOfGrantees>
        <NumberOfSurnames></NumberOfSurnames>
        <NumberOfSignatures></NumberOfSignatures>
      </Index>
    </Deed>
    <Assignment>
      <Pages>2</Pages>
      <NumberOfAssignments>2</NumberOfAssignments>
      <Index>
        <NumberOfGrantors></NumberOfGrantors>
        <NumberOfGrantees></NumberOfGrantees>
        <NumberOfSurnames></NumberOfSurnames>
        <NumberOfSignatures></NumberOfSignatures>
      </Index>
    </Assignment>
    <Release>
      <Pages></Pages>
      <NumberOfReleases></NumberOfReleases>
      <Index>
        <NumberOfGrantors></NumberOfGrantors>
        <NumberOfGrantees></NumberOfGrantees>
        <NumberOfSurnames></NumberOfSurnames>
        <NumberOfSignatures></NumberOfSignatures>
      </Index>
    </Release>
    <Subordination>
      <Pages></Pages>
      <NumberOfSubordinations></NumberOfSubordinations>
      <Index>
        <NumberOfGrantors></NumberOfGrantors>
        <NumberOfGrantees></NumberOfGrantees>
        <NumberOfSurnames></NumberOfSurnames>
        <NumberOfSignatures></NumberOfSignatures>
      </Index>
    </Subordination>
    <POA>
      <Pages></Pages>
    </POA>
  </ErnstRequest>
  <TitleRequest>
    <Version>1</Version>
    <Options>
      <Option>
        <Name></Name>
        <Value></Value>
      </Option>
    </Options>
    <ProviderID></ProviderID>
    <UnderwriterID></UnderwriterID>
    <BusinessChannel></BusinessChannel>
    <Property>
      <City></City>
      <County></County>
      <State></State>
      <Zip></Zip>
      <LoanType>sale</LoanType>
      <ClosingDate></ClosingDate>
    </Property>
    <PolicyType></PolicyType>
    <UseCommonEndorsements></UseCommonEndorsements>
    <UseSimultaneousRates></UseSimultaneousRates>
    <ItemizedSettlementFees>
      <Requested></Requested>
    </ItemizedSettlementFees>
    <LendersPolicy>
      <Requested></Requested>
      <PolicyCode></PolicyCode>
      <PolicyAmount></PolicyAmount>
      <YearsSinceLastPolicy></YearsSinceLastPolicy>
      <PriorPolicyCode></PriorPolicyCode>
      <PriorPolicyAmount></PriorPolicyAmount>
    </LendersPolicy>
    <OwnersPolicy>
      <Requested></Requested>
      <PolicyCode></PolicyCode>
      <PolicyAmount></PolicyAmount>
      <YearsSinceLastPolicy></YearsSinceLastPolicy>
      <PriorPolicyCode></PriorPolicyCode>
      <PriorPolicyAmount></PriorPolicyAmount>
    </OwnersPolicy>
    <Endorsements>
      <Endorsement>
        <Code></Code>
      </Endorsement>
    </Endorsements>
  </TitleRequest>
  <Block6Request>
    <Version>1</Version>
    <Options>
      <Option>
        <Name></Name>
        <Value></Value>
      </Option>
    </Options>
    <Property>
      <Address1></Address1>
      <Address2></Address2>
      <City></City>
      <County></County>
      <State></State>
      <Zip></Zip>
      <LotSize></LotSize>
      <SqFootage></SqFootage>
      <YearBuilt></YearBuilt>
    </Property>
    <Standard>
      <Requested></Requested>
    </Standard>
    <Pest>
      <Requested></Requested>
    </Pest>
    <Water>
      <Requested></Requested>
    </Water>
    <Septic>
      <Requested></Requested>
    </Septic>
    <Well>
      <Requested></Requested>
    </Well>
    <Smoke>
      <Requested></Requested>
    </Smoke>
    <Radon>
      <Requested></Requested>
    </Radon>
    <Roof>
      <Requested></Requested>
    </Roof>
    <Structural>
      <Requested></Requested>
    </Structural>
    <Survey>
      <Requested></Requested>
    </Survey>
    <Mold>
      <Requested></Requested>
      <AirSamples></AirSamples>
      <SurfaceSamples></SurfaceSamples>
    </Mold>
    <ManufacturedHousing>
      <Requested></Requested>
    </ManufacturedHousing>
    <Asbestos>
      <Requested></Requested>
      <Samples></Samples>
    </Asbestos>
    <Lead>
      <Requested></Requested>
      <Samples></Samples>
    </Lead>
    <Drywall>
      <Requested></Requested>
      <Samples></Samples>
      <Expedite></Expedite>
    </Drywall>
    <NaturalHazardDisclosure>
      <Requested></Requested>
    </NaturalHazardDisclosure>
    <GeoTechnicalEngineering>
      <Requested></Requested>
    </GeoTechnicalEngineering>
  </Block6Request>
  <DocumentRequest>
    <Version>1</Version>
    <Providers>
      <Requested></Requested>
      <BusinessChannel></BusinessChannel>
      <LoanPurpose></LoanPurpose>
      <MaxNumberOfProviders></MaxNumberOfProviders>
      <Originator></Originator>
      <Borrower></Borrower>
      <LoanNumber></LoanNumber>
      <Address1></Address1>
      <Address2></Address2>
      <City></City>
      <County></County>
      <State></State>
      <Zip></Zip>
    </Providers>
  </DocumentRequest>
  <PropertyTaxRequest>
    <Version>1</Version>
    <Property>
      <StreetAddress></StreetAddress>
      <City></City>
      <State></State>
      <PostalCode></PostalCode>
    </Property>
  </PropertyTaxRequest>
</Request>
<!--- End of Ernst XML Request Body --->
       </soap:Body>
       </soap:Envelope>
    </cfoutput>
 </cfsavecontent>
 <!--- Post the Ernst Request to Ernst Web Service --->
 <cfhttp
 url="https://ErnstPublishing.com/XML_WebService/ProcessXML.asmx"
 method="post"
 result="httpResponse" >
 <!--- End of Web Service Request Service to Ernst --->
 
 <!--- Define SOAP Header --->
 <cfhttpparam type="header" 
 name="SOAPAction" 
 value="http://ErnstPublishing.com/XML_WebService/ProcessXML.asmx" />
 
 <!--- Define No-Compression Header --->
 <cfhttpparam type="header"
 name="accept-encoding"
 value="no-compression" />
 
 <!--- Trim XML --->
 <cfhttpparam type="xml"
 value="#trim( soapbody )#" />
 
 </cfhttp>
 
 <!--- Handle XML Response --->
 
 <cfif find( "200", httpResponse.statusCode )>
    
    <!--- Parse the XML Soap Response --->
    <cfset soapResponse = xmlParse(httpResponse.fileContent) />
</cfif>
 <cfdump var="#httpResponse.fileContent#" >
</body>
</html>