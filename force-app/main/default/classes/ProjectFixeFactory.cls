public with sharing class ProjectFixeFactory {
    
    public static Project__c newProject(){
        return newRegularProject();
    }

    public static Project__c newProject(String projectName, String projectStatus){
        return new Project__c (
            ProjectName__c = projectName
            , Status__c = projectStatus
            , StartDate__c = Date.today()
            , EndDate__c = Date.today().addDays(30)
            , Budget__c = 140000.00
            , ErrorMessage__c = ''
            , Type__c = 'Enterprise'
            , ExternalId__c	 = '999999999999'
        );
    }

    public static Project__c createProject(){
        return createProject(newProject());
    }

    public static Project__c createProject(String projectName, String projectStatus){
        return createProject(newProject(projectName, projectStatus));
    }

    public static Project__c createProject(Project__c project) {
        insert project;
        return project;
    }

    public static Project__c newRegularProject(){
        String payload = '{ "ProjectName__c" : "TopiRun2020", "code" : "9999999", "Status__c" : "Iniciado", "StartDate__c" : "2020-06-09", "EndDate__c" : "2021-06-10", "Budget__c" : 140000.00, "ErrorMessage__c" : "", "ExternalId__c" : "6666666", "LastSyncDate__c" : "",  "SynchronizationStatus__c" : "", "Type__c" : "Enterprise"}';
        return fromJson(payload);
    }

    public static Project__c fromJson(String payload){
        return (Project__c) JSON.deserialize(payload, Project__c.class);
    }
}