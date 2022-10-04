
# content-document-attachment


This sample demonstrates how we can upload a Content Document file and link the file to a Salesforce record (any).
Imagine you need to use an endpoint (just like this sample) where you use multipart-form/data content type and you grab 
the file and get it uploaded and linked. you can do it with this steps:





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



## Documentation

[Sample from dejim.com ](https://dejim.com/upload-and-link-files-using-the-salesforce-connector-in-mule-4/)



