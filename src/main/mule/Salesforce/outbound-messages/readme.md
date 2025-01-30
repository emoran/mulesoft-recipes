# Salesforce Outbound Messages
 
When certain events occur in Salesforce (e.g., Opportunity updated, Account created), Salesforce can send an Outbound Message to an external endpoint. This Mule application exposes an endpoint that:

- Receives the SOAP message.
- Validates and logs the message content.
- (Optionally) transforms and sends data to another system or service.

### High-Level Flow
- A record is changed in Salesforce, triggering the Outbound Message.
- Salesforce sends a SOAP-based message to the Mule endpoint.
- Mule processes and acknowledges the message.
- (Optional) Mule routes or processes the message further (e.g., storing in a database, calling another API).

### Salesforce Setup

In Salesforce, go to Setup > Outbound Messages 

- Create a new Outbound Message

<img width="1805" alt="image" src="https://github.com/user-attachments/assets/b06e542c-c73b-47a4-8e24-363dd0f44687" />

The Endpoint URL needs to point to your deployed Mulesoft application

Click on Endpoint WSDL and download the WSLD from Salesforce as we will use it in our Mulesoft application

### Create a Record Triggered flow
In salesforce you need to create a record Triggered flow that will push the outbound event (consider the object and the filters)

<img width="2007" alt="image" src="https://github.com/user-attachments/assets/bacefdb6-83c0-4386-a9ba-738ac8fdd2d1" />


### The Mulesoft application

Once we created our app, we need to use the SOAP Router, for that we will copy the WSDL under src/main/resources/api folder, right click > Mule > Generate WSDL flows. This will create the router and the flow

The trick to read the outbound message is to use this dataweave to read the notification from Salesforce:

```
%dw 2.0
output application/java
---
payload.body[0].Notification

```

And lastly the acknowlegement to Salesforce to tell mule received the message:

```
%dw 2.0
ns soapenv http://schemas.xmlsoap.org/soap/envelope/
ns out http://soap.sforce.com/2005/09/outbound
output application/xml  writeDeclaredNamespaces="All", writeDeclaration=false
---
element : [
    {
    	Ack: 1,
    }
]
```

The ACK will look like this:

```
<element xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:out="http://soap.sforce.com/2005/09/outbound">
  <Ack>1</Ack>
</element>
```

Once this changes are deployed you should be able to monitor the messages under the Outbound Messages Monitoring, any failure will show there, otherwise it means the message was received

<img width="1910" alt="image" src="https://github.com/user-attachments/assets/a56e0d9e-ca36-4264-89aa-ce9954054b53" />

