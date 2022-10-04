
# content-document-attachment


This sample demonstrates how we can upload a Content Document file and link the file to a Salesforce record (any).
Imagine you need to use an endpoint (just like this sample) where you use multipart-form/data content type and you grab 
the file and get it uploaded and linked. you can do it with this steps:

![Screen Shot 2022-10-04 at 3 46 10 PM](https://user-images.githubusercontent.com/1028534/193911689-35a4a024-7133-42b7-8fb4-74c318a216ed.png)




A different way to do it would be using a file read operation, which in any case the request payload to create the content document 
remains the same using this script:

```
%dw 2.0
import * from dw::core::Binaries
output application/java
---
[{
	PathOnClient: payload.parts.file1.headers["Content-Disposition"].filename, //name of the file
	VersionData: payload.parts.file1.content as Binary { //binary version of the file content
		class: "byte[]"
	}
}]
```
<img width="1343" alt="Screen Shot 2022-10-04 at 5 00 33 PM" src="https://user-images.githubusercontent.com/1028534/193927601-ef6f149f-5d34-47f9-9152-c2b1fdd570b0.png">



## Documentation

[Sample from dejim.com ](https://dejim.com/upload-and-link-files-using-the-salesforce-connector-in-mule-4/)



