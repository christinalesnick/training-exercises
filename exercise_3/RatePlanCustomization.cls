global class RatePlanCustomization implements zqu.SelectProductComponentOptions.IRatePlanCustomizationPlugin {
  public void updateZChargeGroups(zqu__Quote__c quote,
    List<zqu.ZChargeGroup> zcgs) {

    String funcStr = 'RatePlanCustomization: updateZChargeGroups: ';
    System.debug(funcStr + 'Enter method');

    /*** Start Exercise 3.1 -- Default Charge Discounts based on Quote attributes  ***/

    // Step 1 -- Retrieve the Quote Initial term and Subscription Type
    System.debug(funcStr + 'Enter Exercise 3.1 Step 1');
    List<zqu__Quote__c> quotes = [SELECT Id FROM zqu__Quote__c WHERE Id = ''];

    if(!quotes.isEmpty()){
      Decimal initialTerm = null;
      String subType = '';
    }
    System.debug(funcStr + 'Exit Exercise 3.1 Step 1');

    // Step 2 -- Iterate over the charge groups and determine groupType
    System.debug(funcStr + 'Enter Exercise 3.1 Step 2');
    for(zqu.zChargeGroup cg : zcgs){

    }
    System.debug(funcStr + 'Exit Exercise 3.1 Step 2');

    /*** End Exercise 3.1 ***/

    System.debug(funcStr + 'Exit method');
  }

  private void onAddChargeGroup(zqu.zChargeGroup cg){
    // Step 3 -- Iterate over zCharges and set the discount
    String funcStr = 'RatePlanCustomization: onAddChargeGroup: ';
    System.debug(funcStr + 'Enter Exercise 3.1 Step 3');
    for(zqu.zCharge charge : cg.zCharges){

    }
    System.debug(funcStr + 'Exit Exercise 3.1 Step 3');

    // Step 4 -- Apply discount to charges
    System.debug(funcStr + 'Enter Exercise 3.1 Step 4');

    System.debug(funcStr + 'Exit Exercise 3.1 Step 4');
  }
}
