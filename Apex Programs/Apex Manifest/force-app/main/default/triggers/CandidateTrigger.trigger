trigger CandidateTrigger on Candidate__c (before insert, before update) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            CandidateTriggerHandler.checkCandidateExpectedSal(Trigger.new);   //Question 1
            CandidateTriggerHandler.checkJobIsActive(Trigger.new);    //Question 2
            CandidateTriggerHandler.ApplicationDate(Trigger.new);    //Question 3
        }
    }
}