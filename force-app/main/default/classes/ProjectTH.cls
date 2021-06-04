public with sharing class ProjectTH extends TriggerHandler {
    List<Project__c> newProjects;
    Map<Id, Project__c> oldProject;
    ProjectFilter filter;

    public ProjectTH() {
        this( (List<Project__c>) Trigger.new, (Map<Id, Project__c>) Trigger.oldMap );
    }

    public ProjectTH(List<Project__c> newProjects, Map<Id, Project__c> oldProject){
        this.newProjects = newProjects;
        this.oldProject = oldProject;
        this.filter = new ProjectFilter();
    }

    override
    public void afterUpdate(){
        sendProjectsToLegacySystem();
    }

    public void sendProjectsToLegacySystem(){
        List<Project__c> startedProjects = this.filter.filterByEnterpriseProjectStarted(newProjects
                                                                                        , oldProject);
        
        if(startedProjects.isEmpty()) return;

        SendTopiProjectAsync.sendProject( this.filter.convertSObjectList(startedProjects, 'Id') );                                                                                
    }
}
