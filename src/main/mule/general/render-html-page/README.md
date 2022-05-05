
# render-html-page

This sample code demonstrates how to render an HTML page using Load Static Resource component. For this sample also 
I'm exposing a simple HTTP endpoint to get data from an external system and show the records in a table. The HTML page
is using SLDS (lightning design system) to show a better UI and JQuery to be able to make the HTTP request and draw
the table.

All resources like CSS, Javascript files and images are under /src/main/resources/web folder. I have created one simple
index.html file in the same directory.

Important points:

* For the **HTTP Listener** we use to render the page we need to specify the path as ```/* ``` so that way the request will look on the nested foders.
* **Index.html** has an script that makes the ajax HTTP request to the GET endpoint in Mule, the information is returned in JSON format and then we pass the result to the datatable to be render in the screen.


So this is usefull if you want to have a way to show some data result on the UI for a customer, or maybe to track a process and put a chart, you name it.

Here how the data looks from the Mule endpoint:
![data](https://user-images.githubusercontent.com/1028534/166938211-be0e6e58-7dcc-4c70-9f5a-d24cb88c42c9.png)

And this is the final result:
![finalResult](https://user-images.githubusercontent.com/1028534/166938247-0f125244-eda7-4dee-9172-92c1ba0f1191.png)






## Documentation

[Load Static Resource Mule 4 Docs](https://docs.mulesoft.com/http-connector/1.6/http-load-static-res-task)

[Salesforce Lightning Design System](https://www.lightningdesignsystem.com/)











