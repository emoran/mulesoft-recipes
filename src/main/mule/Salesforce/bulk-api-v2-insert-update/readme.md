
# bulk-api-v2-insert-update

In this sample I want to show a simple scenario to insert or update records into Salesforce using Bulk API v2. In this sample we;

* Create a v2 bulk Job (Important to set the payload as CSV before send the request and quoteValues=true)
* Check the job status in Salesforce (Really nice here a way to do Until-Success based on the state)
* Raise an exception if the job is not completed
* Retrieve failed records
* Retrieve successs records



![Screen Shot 2022-09-26 at 12 06 33 PM](https://user-images.githubusercontent.com/1028534/192326253-6f0f0d34-32e6-46df-be1d-1ea9505265d4.png)


## Documentation

[Offical Salesforce Documentation ](https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/asynch_api_intro.htm)

[Oficial Mulesoft Blog ](https://blogs.mulesoft.com/dev-guides/api-connectors-templates/bulk-api-v2-support-salesforce-connector/)





