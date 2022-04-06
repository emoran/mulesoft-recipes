
# get-updates-retrieve

This is a simple code that allows to get only updated objects from Salesforce without have an SOQL query in place.
So if you are thinking in a way to get only updates this is a great way to do it.

There are some considerations in order to use this approach:

* Get Updates only allows to retrieve 600K id's per call (If from the period specified the number of records is bigger than the limit, an exception happens)
* Get Updates allows to get records on a time period of 30 days (If yoo open the timeframe an exception happens)
* Retrieve operation allows to get 2K records per call.
* Certain objects cannot be deleted, such as Group, User, Contract, or Product2 objects. However, if instances of these objects are no longer visible in the Salesforce user interface, they may have been rendered inactive so that only users with administrative access can see them. To determine whether a missing object instance has been made inactive, your client application can call getUpdated() and check the object’s active flag
* Records for certain objects cannot be retrieved via the API. To retrieve a record via the retrieve() call, its object must be configured as retrieveable (retrieveable is true). To determine whether an object can be retrieved, your client application can invoke the describeSObjects() call on the object and inspect its retrievable property.
* API response sample

![getUpdates](https://user-images.githubusercontent.com/1028534/161977089-a0cf3edf-9bc2-47c6-8239-6acd711438e9.png)


## Documentation

[Get Updated Objects - Mule salesforce connector reference](https://docs.mulesoft.com/salesforce-connector/10.14/salesforce-connector-reference#getUpdated)

[Get Updated - Salesforce Documentation](https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/sforce_api_calls_getupdated.htm)

[Retrieve - Salesforce documentation](https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/sforce_api_calls_retrieve.htm)








