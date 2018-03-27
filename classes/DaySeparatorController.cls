public with sharing class DaySeparatorController {
    
    private static final Integer MIN_IN_HOUR = 60; 
    
    @AuraEnabled
    public static Map<String,Map<String,List<String>>> getDayInfo(){
        
        Map<String,Map<String,List<String>>> SeparatedTime;
        Boolean checkSettingAccess = ObjectAndFieldsAccessCheck.checkAccessToObject('Part_of_day__c','isAccessible');
        
        if(checkSettingAccess){
            SeparatedTime = SeparatedDaysActions.getSeparatedDayForPart();
        }else{
            throw new AuraHandledException('Access Error');
        }
        
        return SeparatedTime;
    }
}