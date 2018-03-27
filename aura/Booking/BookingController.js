({
	doInit : function(component, event, helper) {
        var action = component.get("c.getDayInfo");
        action.setCallback(this, function(response) {
            var daySeparatedByPart = response.getReturnValue();   
            var dayParts = Object.keys(daySeparatedByPart)
            component.set('v.daySeparatedByPart',daySeparatedByPart);
            component.set('v.options',dayParts);
            helper.setNewParams(component,dayParts[0]);
        })
        $A.enqueueAction(action);
    },
        handleSelect : function(component, event, helper) {
        var dayPart = event.getSource().get("v.value");
            
            helper.setNewParams(component,dayPart);
    }
})