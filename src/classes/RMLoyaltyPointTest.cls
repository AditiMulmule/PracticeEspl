/* 
Description:
test class for cover the RMLoyaltyPoint controller class which is used in RM landing page as show Loyalty informaion

 @Created by: Sudeep Dube
 @Created Date: 02/04/2015
 
 --------------------------------------------------------------------------------
 | Modified By      | Modified Date       | Version        | Description         |
 --------------------------------------------------------------------------------
 |
 --------------------------------------------------------------------------------
 |
 --------------------------------------------------------------------------------
*/


@isTest(SeeAllData = false)
public class RMLoyaltyPointTest {

    //main test method 
    public testmethod static void CoverRMLoyaltyPoint() {

        String PanNo = 'NNHSP6592M';
        //call data factory method which create account booking detail and demands in booking details 
        RMLoyaltyPointTest.createAccountForLoyaltyPoint(PanNo);

        // call for test 
        RMLoyaltyPoint rml1 = new RMLoyaltyPoint();
        RMLoyaltyPoint rml2 = new RMLoyaltyPoint(PanNo);
        System.assertNotEquals(rml2.Loyalty_Points_customer_specific, null);
        System.assertEquals(rml2.BookingSpecificLoyaties.size(), 3);
    }


    //method is create data for the test Rmloyalty point controller 
    //method create accounts,bookings and demands object records one by on
    public static void createAccountForLoyaltyPoint(String panno) {

        //create Account and add to list and Insert
        list < Account > acclist = new list < Account > ();

        String AccoutnbookingCRN1 = '1245845';
        Account a1 = new Account();
        a1.Primary_PAN_number__c = panno;
        a1.AccountSource = 'Business Development';
        a1.CRN__c = AccoutnbookingCRN1;
        a1.lastname = 'testAccount1';
        a1.recordtypeid = 
            Schema.SObjectType.Account.getRecordTypeInfosByName().get('Booked Account').getRecordTypeId();
        acclist.add(a1);

        String AccoutnbookingCRN2 = '1245846';
        Account a2 = new Account();
        a2.Primary_PAN_number__c = panno;
        a2.AccountSource = 'Email';
        a2.CRN__c = AccoutnbookingCRN2;
        a2.lastname = 'testAccount2';
        a2.recordtypeid = 
            Schema.SObjectType.Account.getRecordTypeInfosByName().get('Booked Account').getRecordTypeId();
        acclist.add(a2);

        String AccoutnbookingCRN3 = '1245847';
        Account a3 = new Account();
        a3.Primary_PAN_number__c = panno;
        a3.AccountSource = 'Email';
        a3.CRN__c = AccoutnbookingCRN3;
        a3.lastname = 'testAccount2';
        a3.recordtypeid = 
            Schema.SObjectType.Account.getRecordTypeInfosByName().get('Booked Account').getRecordTypeId();
        acclist.add(a3);

        insert acclist;
        //End create Account and add to list and Insert 

        //Create Booking details of Account which have created above.   
        //only one account contain only one booking details so only one record created of booking in account related 
        list < Booking_Details__c > bdList = new list < Booking_Details__c > ();

        //for first accout booking details 
        Booking_Details__c bd1 = new Booking_Details__c();
        bd1.Account__c = acclist[0].id;
        bd1.CRN__c = acclist[0].CRN__c;
        bd1.Allotment_Date__c = Date.Today();
        bd1.Consideration_Value__c = 123000000;
        //formula field bd1.CV_paid_New__c =
        bd1.Flat_ID__c = 'ABCD11000';

        bdlist.add(bd1);

        //for Second accout booking details 
        Booking_Details__c bd2 = new Booking_Details__c();
        bd2.Account__c = acclist[1].id;
        bd2.CRN__c = acclist[1].CRN__c;
        bd2.Allotment_Date__c = Date.Today();
        bd2.Consideration_Value__c = 123000000;
        //formula field bd1.CV_paid_New__c =
        bd2.Flat_ID__c = 'ABCD12000';

        bdlist.add(bd2);

        //for third accout booking details 
        Booking_Details__c bd3 = new Booking_Details__c();
        bd3.Account__c = acclist[2].id;
        bd3.CRN__c = acclist[2].CRN__c;
        bd3.Allotment_Date__c = Date.Today();
        bd3.Consideration_Value__c = 123000000;
        //formula field bd1.CV_paid_New__c =
        bd3.Flat_ID__c = 'ABCD13000';


        bdlist.add(bd3);


        insert bdlist;
        //End Of booking Details creattion


        //Start of Creating Demmands in booking Details Child ,Demand is child object of booking Details.
        List < Demands__c > demList = new List < Demands__c > ();

        //for first booking details  Demand
        Demands__c demand1 = new Demands__c();
        demand1.Flat_ID__c = bdlist[0].id;
        demand1.ExternalID__c = 'D1ABCD110001';
        demand1.Demand_amount__c = 50000;
        demList.add(demand1);

        //for first booking details  Demand   
        Demands__c demand2 = new Demands__c();
        demand2.Flat_ID__c = bdlist[0].id;
        demand2.ExternalID__c = 'D1ABCD110002';
        demand2.Demand_amount__c = 50000;
        demList.add(demand2);


        //for Second booking details  Demand   
        Demands__c demand3 = new Demands__c();
        demand3.Flat_ID__c = bdlist[1].id;
        demand3.ExternalID__c = 'D1ABCD120001';
        demand3.Demand_amount__c = 50000;
        demList.add(demand3);

        //for Second booking details  Demand      
        Demands__c demand4 = new Demands__c();
        demand4.Flat_ID__c = bdlist[1].id;
        demand4.ExternalID__c = 'D1ABCD120002';
        demand4.Demand_amount__c = 50000;
        demList.add(demand4);

        //for Third booking details  Demand   
        Demands__c demand5 = new Demands__c();
        demand5.Flat_ID__c = bdlist[2].id;
        demand5.ExternalID__c = 'D1ABCD130001';
        demand5.Demand_amount__c = 50000;
        demList.add(demand5);

        //for Third booking details  Demand        
        Demands__c demand6 = new Demands__c();
        demand6.Flat_ID__c = bdlist[2].id;
        demand6.ExternalID__c = 'D1ABCD130002';
        demand6.Demand_amount__c = 50000;
        demList.add(demand6);

        insert demList;

        list < Account > acctest = [select id from Account];
        list < Booking_Details__c > bdtest = [select id from Booking_Details__c];
        list < Demands__c > demtest = [select id from Demands__c];
        System.assertEquals(acctest.size(), 3);
        System.assertEquals(bdtest.size(), 3);
        System.assertEquals(demtest.size(), 6);
    }

}