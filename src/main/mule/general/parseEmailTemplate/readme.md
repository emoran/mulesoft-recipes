
# Parse Email Template

A very common scenario is reporting results of an operation or simply to notify someone with a summary detail
of an integration. Parse Email Template component allows along to the SMTP (Emil) connector to enriche the format
of those emails we want to send. One big advantage is that we can use external styles or libraries to render
our template. Now the template supports to use dataweave or expressions inside same HTML, this will help us to 
control what we want to show.

The HTML template can be located under src/main/resources/<YourFolder>/your_template.html. 

<img width="232" alt="tree" src="https://user-images.githubusercontent.com/1028534/188485012-e6bd6cff-b6f6-4271-82cc-03e3aef0dc60.png">


Inside the html code, after we setup the design we should be able to implement DataWeave scripting to allow run 
specific loop or logic for example:

```
#[%dw 2.0
output application/java
---
payload.records map ((item) ->
"<tr><td><span>" ++ (item.country default "") ++ "</span></td><td><span></span></td></tr>")
joinBy ""]
```

Once the result is parsed is matter of the SMTP connector to send the email with the template as body

```
<mule xmlns:email="http://www.mulesoft.org/schema/mule/email" xmlns:ee="http://www.mulesoft.org/schema/mule/ee/core"
	xmlns="http://www.mulesoft.org/schema/mule/core"
	xmlns:doc="http://www.mulesoft.org/schema/mule/documentation" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
http://www.mulesoft.org/schema/mule/ee/core http://www.mulesoft.org/schema/mule/ee/core/current/mule-ee.xsd
http://www.mulesoft.org/schema/mule/email http://www.mulesoft.org/schema/mule/email/current/mule-email.xsd">
	<email:smtp-config name="Gmail_SMTP" doc:name="Email SMTP" doc:id="cec0de8d-190d-460d-872f-156ebc8c12e3" >
		<email:smtp-connection host="smtp.gmail.com" port="587" user="${gmail.username}" password="${gmail.password}" >
			<email:properties >
				<email:property key="mail.smtp.starttls.enable" value="true" />
			</email:properties>
		</email:smtp-connection>
	</email:smtp-config>
	<flow name="parseEmailTemplateFlow" doc:id="019ffb0e-40d0-4087-9917-96e9f30b635b" >
		<scheduler doc:name="Scheduler" doc:id="6a71d67e-af40-49b7-b20f-8bb5b80994e4" >
			<scheduling-strategy >
				<fixed-frequency startDelay="100" timeUnit="DAYS"/>
			</scheduling-strategy>
		</scheduler>
		<ee:transform doc:name="Demo Payload" doc:id="68525533-5c53-4130-b4b1-43726af2b910" >
			<ee:message >
				<ee:set-payload ><![CDATA[%dw 2.0
output application/json
---
{
	title:"Parse Template using HTML",
	records:[{
		country:"Mexico"	
	},
	{
		country:"United States"	
	},
	{
		country:"Spain"	
	},
	{
		country:"Korea"	
	}]
}]]></ee:set-payload>
			</ee:message>
		</ee:transform>
		<parse-template doc:name="Parse Template" doc:id="6d71eff7-bd31-4e5d-854e-8200bd9fb2df" location="emailTemplate/parseEmailTemplate.html"/>
		<email:send doc:name="Send" doc:id="57b71b19-d1b6-4226-990b-0fba93252d1f" config-ref="Gmail_SMTP" toAddresses='#[["yucel.moran@gmail.com"]]' subject='#["sample email"]'>
		</email:send>
	</flow>
</mule>

```
<img width="482" alt="flow" src="https://user-images.githubusercontent.com/1028534/188485076-5d349763-9149-4ba6-993d-97babfe045a8.png">


	And finally the email will look like:
	
<img width="617" alt="email" src="https://user-images.githubusercontent.com/1028534/188485235-9b5b3a36-0670-443a-aabb-4348ff194e40.png">

	
## Documentation

[Parse Template Documentation](https://docs.mulesoft.com/mule-runtime/4.4/parse-template-reference)

[Generate HTML tables for Parse Template ](https://docs.mulesoft.com/mule-runtime/4.4/parse-template-reference#ex_2)
