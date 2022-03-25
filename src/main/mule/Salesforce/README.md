
# Salesforce SOSL Search Sample

Salesforce SOSL search is similar to a search bar where you are able to retrieve information of any entity 
based on a text match. For this sample I'm preparing a list of hardcoded email addresses, and then running the search 
based on those values, Salesforce will return the values for both Lead and Contact, this means we are able to 
get information from any Searchable object from Salesforce based on a value provided. 


- Able to search on more than one single object.
- Unlike SOQL, which can only query one object at a time, SOSL enables you to search text, email, and phone fields for multiple objects simultaneously.


## Limits SOQL query vs SOSL

```

Total number of SOQL queries issued                                    100
Total number of SOQL queries issued for Batch Apex and future methods  200
Total number of records retrieved by SOQL queries                      50,000
Total number of records retrieved by Database.getQueryLocator          10,000
Total number of SOSL queries issued                                    20
Total number of records retrieved by a single SOSL query               200
```




<img width="2046" alt="image1" src="https://user-images.githubusercontent.com/1028534/160132588-947b9bd7-879a-421c-84c7-0ace1aed04f5.png">
<img width="1455" alt="image2" src="https://user-images.githubusercontent.com/1028534/160132613-8d5afc81-2ac1-4a60-8c82-a84e649be86c.png">




## Documentation

[SOQL and SOSL Limits for Search Queries](https://developer.salesforce.com/docs/atlas.en-us.236.0.salesforce_app_limits_cheatsheet.meta/salesforce_app_limits_cheatsheet/salesforce_app_limits_platform_soslsoql.htm)

[Seach Operation Mule 4 connector](https://docs.mulesoft.com/salesforce-connector/10.14/salesforce-connector-reference#search)
