# Dynamic Mapping Sample



## Introduction

In this sample code, I have created a dyanmic mapping that is going to help to have one single place to 
define a field mapping we will use between two systems (For example CSV to Salesforce or others.). 

The main strategy is to have a mapping file (JSON format) containing all fields we want to map and use a 
source and target attributes. Our field mapping will look like this:

```
{
  "entity": "Campaign",
  "externalId": "externalCampaignId__c",
  "fieldMapping": [
    {
      "sourceField": "campaignNumber",
      "targetField": "externalCampaignId__c"
    },
    {
      "sourceField": "code",
      "targetField": "Code__c"
    },
    {
      "sourceField": "name",
      "targetField": "Name"
    },
    {
      "sourceField": "custom_c",
      "targetField": "Description"
    }
  ]
}
```

As we can see, we are definin an entity, which is the Object or table, an external Id field, which will allows
to make an Upsert in Salesforce or use it in a Merge operation on a database, finally a list of fields
with a source and target field, this will help us to make the mapping happen.

Finally for this sample, I decided to use a pretty basic CSV file with ten records and looks like this:

```
campaignNumber,code,name,custom_c
887766,ABDF,CAMPAIGN1,This is campaign 1
887767,ABDG,CAMPAIGN2,This is campaign 2
887768,ABDH,CAMPAIGN3,This is campaign 3
887769,ABDF,CAMPAIGN4,This is campaign 4
887770,ABDG,CAMPAIGN5,This is campaign 5
887771,ABDH,CAMPAIGN6,This is campaign 6
887772,ABDF,CAMPAIGN7,This is campaign 7
887773,ABDG,CAMPAIGN8,This is campaign 8
887774,ABDH,CAMPAIGN9,This is campaign 9
887775,ABDF,CAMPAIGN10,This is campaign 10
```

The trick is to load the JSON mapping file from the resource folder and keep it as variable:

```
%dw 2.0
output application/java  
---
readUrl('classpath://dynamicMapping/dynamicMappingSample.json', 'application/json')
```

Then we will map the data against the current mapping and dynamically assign the keys and values corresponding
to the data we are reading from:

```
%dw 2.0
output application/java  
---
//Loop over the CSV records
(payload  map (course, indexOfRecords) -> {
	
	//Here we loop over the mapping we retrieveds from src/main/resources/dynamicMapping folder
	(vars.campaignMapping.fieldMapping map (campaign, indexOfRecords) -> {
		//Here we create the field mapping as (System FIeld: Source Field | Name[TO_SALESFORCE]:name[FROM_CSV]))
		(campaign.targetField): course[campaign.sourceField]
  	})
})
```
In the end your flow will look like this:

And after the mapping the records are matched and ready to be send to the taraget system:
