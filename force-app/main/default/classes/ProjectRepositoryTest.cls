@isTest
public with sharing class ProjectRepositoryTest {
    @isTest
    static void createOneSingleProject(){
        ProjectFixeFactory.createProject('Pojeto aponta pu céu', 'Backlog');
        System.assertEquals(1, createProject.size());
    }
}
