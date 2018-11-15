global class acceptCaseController {
    
    webService static Id changeCaseOwner(String caseInfo) {
        Case caseDetail = [select id, OwnerId from Case where Id = :caseInfo];
        caseDetail.OwnerId = UserInfo.getUserId();
        update caseDetail;
        return caseDetail.id;
    }
    
    webService static void changeListCaseOwner(list<Case> caseInfo) {
        list<Case> caseDetail = [select id, OwnerId from Case where Id IN :caseInfo];
        for(Case itrCase : caseDetail){
            itrCase.OwnerId = UserInfo.getUserId();
        }
        update caseDetail;
    }  
    
    webservice static void reAssignCase( String caseId ){
        Case caseObj = new Case( id=caseid );
        Database.DMLOptions dmo = new Database.DMLOptions();
        dmo.assignmentRuleHeader.useDefaultRule= true;
        caseObj.setOptions(dmo);
        update caseObj;
    }  
}