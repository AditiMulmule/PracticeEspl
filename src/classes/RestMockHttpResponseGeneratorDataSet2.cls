/* 
Description : Creating three mock response for payments received data  
 @Created by: Shruti Nikam
 @Created Date: 18/05/2015
 
 --------------------------------------------------------------------------------
 | Modified By      | Modified Date       | Version        | Description         |
 --------------------------------------------------------------------------------
 |
 --------------------------------------------------------------------------------
 |
 --------------------------------------------------------------------------------

*/
@isTest
                        
global class RestMockHttpResponseGeneratorDataSet2 implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        String endpoint_URL = System.Label.Url_for_customerinfo_web_services;
        Integer qIndex1=endpoint_URL.indexOf('?');
        
        Integer qIndex2 = req.getEndpoint().indexOf('?');
        
        System.assertEquals(endpoint_URL.substring(0, qIndex1), req.getEndpoint().substring(0, qIndex2));
        
        
        
        System.assertEquals('GET', req.getMethod());
                
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
          
        String addtobody='"Office_Address": "Lodha Excelus,N MJoshi Marg,Mumbai",';
        addtobody=addtobody+'"Age": "29",';
        addtobody=addtobody+'"MY_GAIN_CUSTOMER": "NO",';
        addtobody=addtobody+'"REGISTRATION_STATUS": "Registered",';
        addtobody=addtobody+'"Residential_Status": "Indian",';
        addtobody=addtobody+'"TIMEBOUND_DEMAND_42DAYS": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"Legal_Notice_Sent_Received": "Yes",';
        addtobody=addtobody+'"TIMEBOUND_PAYMENT_RECEIPT_42DAYS": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"LOAN_SANCTIONED_LETTER_DATE": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"REGISTRATION_CHARGES": "500",';
        addtobody=addtobody+'"TIMEBOUND_PAYMENT_RECEIPT_21DAYS": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"Management_Booking": "NO",';
        addtobody=addtobody+'"DISBURSAL_AMOUNT": "200000",';
        addtobody=addtobody+'"STAMP_DUTY": "12345",';
        addtobody=addtobody+'"crn": "1210055",';
        addtobody=addtobody+'"Time_of_Communication": "Evening",';
        addtobody=addtobody+'"Loan_Against_Property": "YES",';
        addtobody=addtobody+'"REGISTRATION_DATE": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"NOC_ROC_DATE": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"KEY_HANDOVER_DATE": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"ALLOTMENT_LETTER_DATE": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"WELCOME_ONBOARD": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"TIMEBOUND_DEMAND_21DAYS": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"AMOUNT_SANCTIONED": "20000",';
        addtobody=addtobody+'"REGISTRATION_CHALLAN_DATE": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"CV_SANCTIONED": "4.5",';
        addtobody=addtobody+'"BANK_NAME": "HFDC",';
        addtobody=addtobody+'"Legal_Case_On-going": "No",';
        addtobody=addtobody+'"Co_applicant_2": "Robin Jain",';
        addtobody=addtobody+'"Co_applicant_3": "Shivam Kunwar",';
        addtobody=addtobody+'"POSSESSION_DATE": "2013-03-04 11:03:34",';
        addtobody=addtobody+'"SANCTIONED_DATE": "2013-12-04 09:08:07",';
        addtobody=addtobody+'"FUNDING_STATUS": "Bank Funded",';
        addtobody=addtobody+'"OFFER_FOR_FITOUT_POSSESSION": "2013-03-04 11:03:34"';
        res.setBody('{'+addtobody+'}');
        res.setStatusCode(200);
        return res;
    }
}