
# Consume Salesforce REST service GET / POST

This sample code shows how to consume a REST service exposed in Apex in the Salesforce platform.
We are using the Mule 4 Salesforce connector and the "Invoke apex rest method". We are going to use two silly sample services
but you'll see there's potential to use this approach.

Here the sample code from Apex to expose the GET service:




## customAccountContact for GET

```
@RestResource(urlMapping='/customAccountContact/*')
global with sharing class customAccountContactREST {

    @HttpGet
    global static List<AccountContact> getAccountContacts(){
        List<AccountContact> response = new List<AccountContact>();
        Map<Id,Account> mapAccountContact = new Map<Id,Account>([Select Id, (Select Id,FirstName from Contacts) from Account limit 10]); 
        
        System.debug('mapAccountContact: '+mapAccountContact);

        for(Account acc:mapAccountContact.values()){
            response.add(new AccountContact(acc.Id,acc.contacts));
        }

        return response;
    }

    global class AccountContact{
        Id accountId;
        List<Contact> contactList;

        public AccountContact(Id accountId,List<Contact> contactList){
            this.accountId = accountId;
            this.contactList = contactList;
        }

      
    }
}
```

## ExternalRequestREST POST

```
@RestResource(urlMapping='/externalRequest/*')

global with sharing class ExternalRequestREST {
    @HttpPost
    global static String createExternalRequest(List<External_Request__c> restRequestList){
        List<Database.SaveResult> saveResults = new List<Database.SaveResult>();
        saveResults = Database.insert(restRequestList, false);               
        return JSON.serialize(saveResults); 
    }
}

```
![apexRest](https://user-images.githubusercontent.com/1028534/160414374-a1f05775-d742-4cce-97c1-a093f8d4c9ad.png)

## Documentation

[Consuming Salesforce REST service using Mule 4 Salesforce Connector (My blog)](https://yucelmoran.com/consuming-salesforce-rest-service-using-mule-4-salesforce-connector/)

[How to invoke APEX REST and SOAP method using Salesforce Connector - Mulesoft Help Center](https://help.mulesoft.com/s/article/How-to-invoke-APEX-REST-and-SOAP-method-using-Salesforce-Connector)

[Salesforce documentation](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_integration_intro.htm)








