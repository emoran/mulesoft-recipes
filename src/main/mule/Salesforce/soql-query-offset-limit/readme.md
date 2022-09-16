

# soql-query-offset-limit (Pagination)

While we had mule 3 and the Salesforce connector, was easy to the property to allow pagination for an operation, 
this was available for many connectors. In this sample, I will demonstrate how to implement pagination out of a 
SOQL query in Salesforce using offset and limit.

From the offical documentation:

"When expecting many records in a query’s results, you can display the results in multiple pages by using the OFFSET clause on a SOQL query. For example, you can use OFFSET to display records 51–75 and then jump to displaying records 301–350. Using OFFSET is an efficient way to handle large results sets.
Use OFFSET to specify the starting row offset into the result set returned by your query. Because the offset calculation is done on the server and only the result subset is returned, using OFFSET is more efficient than retrieving the full result set and then filtering the results locally. OFFSET is available in API version 24.0 and later."

In other words, if you are going to query a large number of records, and you want to get performance in your query
you need to consider to set a limit on the query and a offset value, meaning the offset will be the number of records 
that would be skiped.

Example: (From https://www.jobssie.com/guides/soql-guide/soql-offset/ ) Let’s say we want to show the list of clinics on a page. And we want to apply pagination, so each page contains a maximum of 25 clinics.

The SOQL query for Page 1:

```SELECT Id, Name FROM Clinic__c LIMIT 25```

The SOQL query for Page 2:

```SELECT Id, Name FROM Clinic__c OFFSET 25 LIMIT 25```

The SOQL query for Page 3:

```SELECT Id, Name FROM Clinic__c OFFSET 50 LIMIT 25 ```

The SOQL query for Page n:

```SELECT Id, Name FROM Clinic__c OFFSET 25*(n-1) LIMIT 25```


If you want to implement from RAML this is the trait can be used.

```
#%RAML 1.0 Trait
description: Trait to do offset pagination. If one of the query parameters is present then all the parameters must be present
usage: Apply this trait to a GET method that supports pagination.
queryParameters:
  sortby:
    description: Sorting field and direction to use to retrieve the results.
    required: false
    type: string
  sortOrder:
    description: Sorting the results on ASC or DESC
    required: false
    type: 
      enum:
        - ASC
        - DESC
  offset: 
    required: false 
    description: Offset used to retrieve the results.
    type: integer
    default: 0
  limit: 
    required: false
    description: Maximum records to retrieve.
    type: integer
    default: 20
```

Here the endpoint definition. 

```
/accounts:
  get:
    is:
      - pagination
    responses:
      200:
        body:
          application/json:
```

<img width="967" alt="Screen Shot 2022-09-16 at 6 45 05 PM" src="https://user-images.githubusercontent.com/1028534/190827301-d8a398ba-8d59-4381-9c97-80e292991e3b.png">

## Documentation

[Offical Salesforce Documentation ](https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_soql_select_offset.htm)

[Offset and Limit explanation (easy) ](https://www.jobssie.com/guides/soql-guide/soql-offset/)





