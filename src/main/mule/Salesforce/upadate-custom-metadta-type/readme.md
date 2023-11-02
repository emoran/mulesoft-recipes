
# Project Title


I created a Salesforce Developer Account and I’m using Basic Authentication (Username, Password, Token), consider for real life projects using JWT connection.

In the Read Metadata connector:

```
Type : CustomMetadata (CustomMetadata) (CustomMetadata)
FullNames: it should be [“Inventory__mdt.JAPAN”] or [YOUR_CMT_API_NAME.RECORD_NAME]
```

The result of this opertation will return the full CMT informtion from the Custom Metadata Type


For this example, I want to update the date field I created, for that we ned to define the DataWeave Transformation like this:

```
%dw 2.0
output application/java
---
[{
  "fullName":"Inventory__mdt.JAPAN", //required
   "label":"JAPAN", //required
   "values": [{
      "field":"Sync_Date__c",
      "value": now() 
   }]
}]
```


Next we need to call the Update Metadata Connector, the connector configuration should be like this:


And the response should be a success unless errors happens


In Salesforce we can see our CMT record updated.

<img width="874" alt="Screenshot 2023-11-02 at 4 25 50 PM" src="https://github.com/emoran/mulesoft-recipes/assets/1028534/d05c2e4e-f3ce-4c18-a7af-52502252c334">



# Important Considerations
In order to let Mulesoft update Metadata you need the next profile permissions:

- API Enabled
- Modify Metadata Through Metadata API Functions
- Customize Application
