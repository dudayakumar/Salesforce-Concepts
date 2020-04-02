@isTest
public class SampleClassTest {
    
    @testSetup static void testDataSetUp(){

		//invoke profile
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];

		//Create uniques user like so...
        String orgId = UserInfo.getOrganizationId();
        String dateString = String.valueof(Datetime.now()).replace(' ','').replace(':','').replace('-','');
        Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));
        String uniqueName = orgId + dateString + randomInt;
        User u = new User(Alias = 'tUser', Email=uniqueName + '@test' + orgId + '.org', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName=uniqueName + '@test' + orgId + '.org');
        
        /*
			Create all other test data here
		*/
    }

    @isTest static void test_method_output(){
        
        //Query for the records created in testDataSetUp, whichc will be visible here
		
		
		Test.startTest();
		//Perform action
		Test.stopTest();
		
		System.assertEquals(exp, act, errorMsg);
    }
}