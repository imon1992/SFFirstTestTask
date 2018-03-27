public class SeparatedDaysActions {
	private static final Integer MIN_IN_HOUR = 60; 
    
    public static Map<String,Map<String,List<String>>> getSeparatedDayForPart(){
        Map<String,Map<String,List<String>>> SeparatedTime = new Map<String,Map<String,List<String>>>(); 
        List<Part_of_day__c> dayParts = Part_of_day__c.getall().values();

        for(Part_of_day__c dayPart : dayParts){
            
            Map<String,List<String>> hoursWithSeparated = new Map<String,List<String>>();
            List<String> separatedList = new List<String>();
            List<String> timeList = new List<String>();
            Integer separator = (Integer)dayPart.separator__c;
            
            for(Integer i = 0; i <= MIN_IN_HOUR; i=i+separator){
                separatedList.add(String.valueOf(i));
            }
            
            String dayStart = dayPart.Start__c.substring(0,dayPart.Start__c.length()-2);
			String dayEnd = dayPart.End__c.substring(0,dayPart.End__c.length()-2);
            Integer hoursinterval = math.abs(Integer.valueof(dayStart) - Integer.valueof(dayEnd));
            
            for(integer j = 0;j<hoursinterval;j++){
                Integer dayPartTime = Integer.valueof(dayStart)+j;
                String timeWithModifer = dayPartTime + dayPart.Start__c.substring(dayPart.Start__c.length()-2,dayPart.Start__c.length());
                if(dayPartTime == 12){
                    timeWithModifer  = dayPartTime + 'PM';
                } else if(dayPartTime > 12){
                    timeWithModifer  = dayPartTime -12 + 'PM';
                }
                timeList.add(timeWithModifer);
            }
            
			
            hoursWithSeparated.put('separatedHours', separatedList);
            hoursWithSeparated.put('hours', timeList);
            SeparatedTime.put(dayPart.Name, hoursWithSeparated);
        }
        
        return SeparatedTime;
    }
}