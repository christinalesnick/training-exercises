global class DefaultValues extends zqu.CreateQuoteController.PopulateDefaultFieldValuePlugin{

  // Override the populateDefaultFieldValuePlugin method to default Quote values on the CreateQuote page
  global override void populateDefaultFieldValue (SObject record, zqu.PropertyComponentController.ParentController pcc){
    String funcStr = 'DefaultValues: populateDefaultFieldValue: ';
    System.debug(funcStr + 'Enter method');

    super.populateDefaultFieldValue(record, pcc);

    /*** Start Exercise 1.1 -- Default Values Based on Subscription Type  ***/

    // Step 1 -- Retrieve URL parameters from CreateQuote Page
    System.debug(funcStr + 'Enter Exercise 1.1 Step 1');
    String quoteType = '';
    String oppId = '';
    String billingAccountId = '';
    System.debug(funcStr + 'Exit Exercise 1.1 Step 1');

    // Step 2 -- Default Quote Values
    System.debug(funcStr + 'Enter Exercise 1.1 Step 2');
    zqu__Quote__c quote = (zqu__Quote__c) record;

    if(quote.zqu__SubscriptionType__c == ''){

    }
    System.debug(funcStr + 'Exit Exercise 1.1 Step 2');

    // Setp 3 -- Query Opportunity + Set Quote Name
    System.debug(funcStr + 'Enter Exercise 1.1 Step 3');
    Opportunity opp = [SELECT Id FROM Opportunity WHERE Id = ''];
    quote.Name = '';
    System.debug(funcStr + 'Exit Exercise 1.1 Step 3');

    /*** End Exercise 1.1 ***/

    /*** Start Exercise 1.2 -- Default Invoice Owner Lookup ***/

    // Step 1 -- If Amendment Quote Query Quote Templates with Quote Type equal to Amend Subscription
    System.debug(funcStr + 'Enter Exercise 1.2 Step 1');
    List<zqu__Quote_Template__c> quoteTemplateList = [Select Id FROM zqu__Quote_Template__c WHERE zqu__Quote_Type__c = ''];
    System.debug(funcStr + 'Exit Exercise 1.2 Step 1');

    // Step 2 -- Set Lookup Options
    System.debug(funcStr + 'Enter Exercise 1.2 Step 2');
    if(!quoteTemplateList.isEmpty() && quote.zqu__SubscriptionType__c == ''){
      super.setLookupOptions(pcc);
      zqu.LookupComponentOptions quoteTemplateOptions = super.getLookupOption('zqu__QuoteTemplate__c');
    }
    System.debug(funcStr + 'Exit Exercise 1.2 Step 2');

    /*** End Exercise 1.2 ***/

    System.debug(funcStr + 'Exit method');
  }
}
