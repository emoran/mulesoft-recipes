
# bulk-v1-query

This sample code demonstrates how to you can use Salesforce Bulk API v1 to export data from any instance. Basically the process has a few steps:

* Create a Job.  You need to specify some values at the beginning 
```
%dw 2.0
output application/java
---
{
    "contentType" : "CSV",
    "concurrencyMode": "Parallel"  //Serial or Parallel
}
```
* Create a batch for query. Here you need to pass the Job Info from the previous step and the query.
* Batch Info List. Returns an array of batches generated, usually you'll get more than one depending of
the volume of data is getting exported and the value set for the ``` Sforce-Enable-PKChunking ``` and ```chunkSize```
so you might need to tweak this process to read from each batch
* Batch Info. Gets the information from a Batch (Here I use this to check the state value and see if it is completed or now).
* Query result Stream. Gets the file from the batch, this is nice bcause for low volume data performs pretty quick
* Close Job. Closes the main job in Salesforce.

<img width="1238" alt="batch" src="https://user-images.githubusercontent.com/1028534/160941520-dd833b3f-0f60-443f-a79a-8bfbf2d5a434.png">

## Documentation

[PK Chunking Header](https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/async_api_headers_enable_pk_chunking.htm)

[Introduction to Salesforce Bulk API](https://developer.salesforce.com/docs/atlas.en-us.220.0.api_asynch.meta/api_asynch/asynch_api_intro.htm)

[Salesforce documentation](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_integration_intro.html)

[Salesforce Connector Reference](https://docs.mulesoft.com/salesforce-connector/10.14/salesforce-connector-reference)








