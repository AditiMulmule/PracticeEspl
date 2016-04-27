/*-- ------------------------------------------------------------------------------
 | Modified By      | Modified Date       | Version        | Description         |
 --------------------------------------------------------------------------------
 |Deepak Pudi            5/04/2016           1.0           BackgroundImageHelperTest
 --------------------------------------------------------------------------------
 |
 ------------------------------------------------------------------------------ --*/
@isTest(seeAllData=False)
public class BackgroundImageHelperTest {
    private static testmethod void BackgroundImageHelperTest(){
        Account Acc = createAccount();
        insert Acc;
        User user = createUser(Acc);
        insert user;
        CSSBackgroundImageSetting__c CsImage = createCSSBackgroundImageSetting();
        insert CsImage;
        Project_Name__c  Projectname = createProjectName();
        insert Projectname;
        
        system.runAs(user){
             test.startTest();
             BackgroundImageHelper BgImage = new  BackgroundImageHelper(); 
             BackgroundImageHelper.populateBackgroundImgParam('154215');    
             test.stopTest();
             system.assertEquals('https://cs7.salesforce.com/servlet/servlet.FileDownload?file=00PM0000003SygS',BackgroundImageHelper.imageUrl);
             system.assertEquals('154215',Acc.CRN__c);
             system.assertNotEquals(null,Acc);
       }
        
    }
    
     private static testmethod void BackgroundImageHelperProjectWiseFalseTest(){
        Account Acc = createAccount();
        insert Acc;
        User user = createUser(Acc);
        insert user;
    
        Project_Name__c  Projectname = createProjectName();
        insert Projectname;
        
        system.runAs(user){
             test.startTest();
             BackgroundImageHelper BgImage = new  BackgroundImageHelper(); 
             BackgroundImageHelper.populateBackgroundImgParam('154215');       
             test.stopTest();
             system.assertEquals(null,BackgroundImageHelper.imageUrl);
        }
        
    }
      
    private static Account createAccount(){
        Account objAccount = new Account();
        objAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Booked Account').getRecordTypeId();
        objAccount.FirstName = 'Test30';
        objAccount.LastName = 'Account1';
        objAccount.CRN__c = '154215';
        objAccount.H_Mobile_No__c = '1234560789';
        objAccount.Mobile_Phone__c = '21241222';
        objAccount.Co_Applicant__c = 'test';
        objAccount.Project_Name__c = 'TestProjectHome';
        return objAccount;      
    }
    private static User createUser(Account a){
            User objUser = new User();
            contact c=[select id from contact where accountid=:a.id limit 1];
            objUser.ProfileID = [Select Id From Profile Where Name = 'Custom Overage High Volume Customer Portal'].id;
            objUser.EmailEncodingKey = 'ISO-8859-1';
            objUser.LanguageLocaleKey = 'en_US';
            objUser.TimeZoneSidKey = 'America/New_York';
            objUser.LocaleSidKey = 'en_US';
            objUser.FirstName = 'first';
            objUser.LastName = 'last';
            objUser.Username = 'test@appirio.com';
            objUser.CommunityNickname = 'testUser123';
            objUser.Alias = 't1';
            objUser.Email = 'no@email.com';
            objUser.IsActive = true;
            objUser.ContactId = c.id;
            return objUser;
      }  
   private static CSSBackgroundImageSetting__c createCSSBackgroundImageSetting(){ 
        CSSBackgroundImageSetting__c CsImage = new CSSBackgroundImageSetting__c();
        CsImage.name='Backgroundimage';
        CsImage.Project_Wise__c=true;
        return CsImage;
   }
  private static Project_Name__c createProjectName(){
    Project_Name__c ProjectName = new Project_Name__c();
    ProjectName.Name='TestProjectHome';
    ProjectName.OrderType__c='Default';
    ProjectName.CSS_Background_Image_URL__c='https://c.cs7.content.force.com/servlet/servlet.FileDownload?file=00PM0000003SygS';
    return ProjectName;
  }
}