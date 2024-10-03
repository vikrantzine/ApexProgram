@IsTest
private class AccountWrapperTests {

    @TestSetup
    static void loadTestData() {
        // Create an Account
        Account acct = new Account(Name = 'ACME');
        insert acct;

        // Create Opportunities for that account
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer i = 0; i < 5; i++) {
            opps.add(new Opportunity(
                Name = 'Opportunity ' + i,
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(30),
                Amount = 1000.00,
                AccountId = acct.Id
            ));
        }
        insert opps;
    }

    @IsTest
    static void testPositiveRoundedAveragePrice() {
        // Test the rounded average opportunity price
        Account acct = [SELECT Id FROM Account LIMIT 1];
        AccountWrapper acctWrapper = new AccountWrapper(acct);

        Test.startTest();
        Assert.areEqual(
            acctWrapper.getRoundedAvgPriceOfOpps(),
            1000.00,
            'Expected to get 1000.00'
        );
        Test.stopTest();
    }

    @IsTest
    static void testIsHighPriority() {
        // Test isHighPriority method
        List<AccountWrapper> accounts = new List<AccountWrapper>();
        for (Account acc : [SELECT Id, Name FROM Account]) {
            accounts.add(new AccountWrapper(acc));  // Use Account object here
        }

        List<Opportunity> sanityCheckListOfOpps = [SELECT Id, Amount FROM Opportunity];
        System.assert(sanityCheckListOfOpps.size() > 0, 'You need an Opportunity to Continue');

        for (Opportunity opp : sanityCheckListOfOpps) {
            opp.Amount = 1000.00;  // Set to a lower amount
        }
        update sanityCheckListOfOpps;

        Test.startTest();
        for (AccountWrapper a : accounts) {
            System.assertEquals(a.isHighPriority(), false, 'Expected High priority to return false');
        }
        Test.stopTest();
    }
}
