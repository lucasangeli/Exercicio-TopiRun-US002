public with sharing class SendTopiProjectAsync {

    @future (callout=true)
    public static void sendProject(List<String> projectIds){

        ProjectRepository repository = new ProjectRepository();
        List<Project__c> projects = repository.findByIds(projectIds);

        SyncTopiProjectOutbound service;

        for(Project__c project : projects){
            service = new SyncTopiProjectOutbound();
            service.sendProject(project);
        }

        repository.store(projects);

    }
}
