
# recursive-flow-pagination

This sample code shows how to make a recursive call to the same flow for a pagination API. Note that depending of the API responses
we have multiple ways to do it. 

On this sample I'm calling a public API (No authentication needed) and it needs couple parameters, page and size, where page is the page we want
to retrieve while the size allows to especify the number of records per call.

I'm using a VM listener and VM publish connector to pass the information into the same flow, basically increasing the page size and aggregating the records at the end (When the current page is equal 
to the total_pages attribute).

* API response sample
```
{
    "totalPassengers": 75424,
    "totalPages": 76,
    "data":
    []
}   
```
![recursive-flow](https://user-images.githubusercontent.com/1028534/161580078-57d8095c-5e9c-437f-8565-4c1e17ecd910.png)

## Documentation

[VM connector video - Integration World](https://www.youtube.com/watch?v=X3DrXfoyag0)

[What to know about pagination. - AVIO](https://www.avioconsulting.com/blog/what-to-know-about-pagination-and-mulesoft)








