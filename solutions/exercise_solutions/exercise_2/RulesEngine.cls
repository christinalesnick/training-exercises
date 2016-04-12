global without sharing class RulesEngine implements zqu.ZQuoteRulesEngine.QuoteRulesEnginePlugin {

  public Boolean runValidationRules(
    zqu__Quote__c quote,
    zqu.ZChargeGroup[] chargeGroups,
    zqu.ZQuoteRulesEngine.ChangeLog[] logs) {

    String funcStr = 'RulesEngine: runValidationRules: ';
    System.debug(funcStr + 'Enter method');

    /*** Start Exercise 2.1 -- Validate no duplicate rate plans added to the Quote ***/

    // Step 1 -- Iterate over the charge groups and retrieve list of product rate plan zuora ids
    System.debug(funcStr + 'Enter Exercise 2.1 Step 1');
    List<String> prodRatePlanIds = new List<String>();
    for(zqu.ZChargeGroup cg : chargeGroups){
      prodRatePlanIds.add(cg.productRateplanZuoraID);
    }
    System.debug(funcStr + 'Exit Exercise 2.1 Step 1');

    // Step 2 -- Detect if duplicate product rate plan zuora ids
    System.debug(funcStr + 'Enter Exercise 2.1 Step 2');
    prodRatePlanIds.sort();
    String prevProdRatePlanId = '';
    Boolean duplicateFound = false;
    for(String prodRatePlanId : prodRatePlanIds){
      if(prevProdRatePlanId == prodRatePlanId){
        duplicateFound = true;
        break;
      }
      prevProdRatePlanId = prodRatePlanId;
    }
    System.debug(funcStr + 'Exit Exercise 2.1 Step 2');

    // Step 3 -- If duplicate rate plans detected add a log to display on the selector and return false
    System.debug(funcStr + 'Enter Exercise 2.1 Step 3');
    if(duplicateFound){
      zqu.ZQuoteRulesEngine.ChangeLog log = new zqu.ZQuoteRulesEngine.ChangeLog();
      log.description = 'Duplicate rate plan detected.  Please remove.';
      logs.add(log);
      return false;
    }
    System.debug(funcStr + 'Exit Exercise 2.1 Step 3');

    /*** End Exercise 2.1 ***/

    System.debug(funcStr + 'Exit method');

    return true;
  }

  public Map<String, String[]> runProductRules(
        zqu__Quote__c quote, String[] ratePlanIds, zqu.ZQuoteRulesEngine.ChangeLog[] logs) {

    Map < String, List < String > > rateplanIdsByAction = new Map < String, List < String > >();

    // Map that stores List of product rate plan ids to automatically add that cannot be removed
    ratePlanIdsByAction.put(zqu.ZQuoteRulesEngine.PRODUCT_RULE_TYPE_ADDED_DISABLED, new List < String > () );

    // Map that stores List of product rate plan ids to automatically add that can be removed
    ratePlanIdsByAction.put(zqu.ZQuoteRulesEngine.PRODUCT_RULE_TYPE_ADDED_ENABLED, new List < String > ());

    // Map that stores List of product rate plan ids to automatically remove
    ratePlanIdsByAction.put(zqu.ZQuoteRulesEngine.PRODUCT_RULE_TYPE_REMOVED_ENABLED, new List < String > () );

    return ratePlanIdsByAction;
  }

  public void runPriceRules(
    zqu.ZChargeGroup[] chargeGroups,
    zqu.ZQuoteRulesEngine.ChangeLog[] logs) {
  }
}
