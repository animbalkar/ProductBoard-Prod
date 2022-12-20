({
    handleClick : function(component, event, helper) {
        var action = component.get("c.makePostCallout");
        var recordId = component.get("v.recordId");
        var comments = component.get("v.comments");
        action.setParams({
            "recordId": recordId,
            "comments" : comments
        });

        
        var toastEventSuccess = $A.get("e.force:showToast");
        toastEventSuccess.setParams({
            "title": "Thank you!",
            "message": "A team of highly trained product managers has been dispatched to process your feedback!",
            "type": "success"
        });

        var toastEventError = $A.get("e.force:showToast");
        toastEventError.setParams({
            "title": "Blimey!",
            "message": "There's been an issue with your request! Please, try again!",
            "type": "error"
        });


        action.setCallback(this, function(response){
            let state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                toastEventSuccess.fire();
            }else{
                toastEventError.fire();
            }
        });
        $A.enqueueAction(action);
    }
})