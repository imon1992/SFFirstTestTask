({
	setNewParams : function(component,dayPart) {
        var daySeparatedByPart = component.get('v.daySeparatedByPart');
		component.set('v.currentPart',daySeparatedByPart[dayPart]);
            component.set('v.hours',daySeparatedByPart[dayPart].hours);
            component.set('v.separatedHours',daySeparatedByPart[dayPart].separatedHours);
	}
})