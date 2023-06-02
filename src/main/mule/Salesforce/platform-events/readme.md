# Salesforce Platform Events
 
Platform Events are used to deliver secure, scalable,
and customizable notification within Salesforce or external app.
Platform Event is based on Event-Driven Architecture.
This is built in real time integration patterns in the Salesforce Platform 
which helps to reduce point-to-point integration.

In order to make this POC to work we need to setup some things on the salesforce side.

* From Setup > Platform Events, we need to create a new Platform Event definition, which would be pretty similar to create a SObject, you basically define the fields you need seting the data type.
<img width="1534" alt="Screenshot 2022-12-13 at 2 16 07 PM" src="https://user-images.githubusercontent.com/1028534/207424695-8c3b736d-0ca2-4266-9978-8a7913ba1615.png">

* On the platform event Trigger section you need to write a new trigger that will "Subscribe" to this event, so you can use the data as you want. The trigger looks pretty straight forward
```
trigger handlePlatformEvent on New_Accounts__e (after insert) {
    List<Account> accountList = new List<Account>();
    for(New_Accounts__e newAccounts : Trigger.new){
        
        Account acc = new Account();
        acc.Name = newAccounts.Name__c;
        acc.Description = newAccounts.AcctId__c;
        
        accountList.add(acc);
    }
    
    insert accountList;
}
```

# The Mule Application
The mule application is super simple, we just need a http listener thet receives the data so we can map the information. 
Then we have the "Publish Platform Event" connector which is only going to ask for one thing, the name of the platofrm event, 
in this case we can use New_Accounts__e, finally we just catch the response that looks like this one:

```
[
    {
        "success": true,
        "id": "e00xx0000000001AAA",
        "errors": [
            {
                "duplicateResult": null,
                "message": "fea7636d-9967-4875-b601-86be075e50b7",
                "fields": [],
                "statusCode": "OPERATION_ENQUEUED"
            }
        ]
    }
]
```
The Mule flow looks like this:

<img width="667" alt="Screenshot 2022-12-13 at 2 16 33 PM" src="https://user-images.githubusercontent.com/1028534/207424781-2094d671-c141-4441-8704-e2fbd6822cb0.png">



Finally we check our record is been pushed correctly confirming a new Account record got created.

<img width="514" alt="Screenshot 2022-12-13 at 2 17 21 PM" src="https://user-images.githubusercontent.com/1028534/207424959-c09ac233-d601-49e4-bcef-6935b2284493.png">


