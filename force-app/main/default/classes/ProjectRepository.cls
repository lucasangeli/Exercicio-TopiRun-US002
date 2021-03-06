public with sharing class ProjectRepository {
    public ProjectRepository() {
    }

    virtual
    public Project__c create(Project__c project){
        insert project;
        return project;
    }

    virtual
    public List<Project__c> create(List<Project__c> projects){
        insert projects;
        return projects;
    }

    virtual
    public Project__c save(Project__c project){
        if(project.Id == null){
            return create(project);
        }
        return store(project);
    }

    virtual
    public Project__c store(Project__c project){
        update project;
        return project;
    }

    virtual
    public List<Project__c> store(List<Project__c> projects){
        update projects;
        return projects;
    }

    virtual
    public Project__c findById(String Id){
        List<Project__c> projects = findByIds(new List<String> {id});
        return !projects.isEmpty() ? projects.get(0) : null;
    }

    public List<Project__c> findByIds(List<String> Ids){
        return [ SELECT Id, StartDate__c, EndDate__c, Budget__c, ProjectName__c, ErrorMessage__c
                , ExternalId__c, Name, Status__c, LastSyncDate__c, SynchronizationStatus__c
                 FROM Project__c 
                 WHERE Id in :ids];
    }
}
