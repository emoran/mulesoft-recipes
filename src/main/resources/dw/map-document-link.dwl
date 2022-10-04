%dw 2.0
output application/java
---
vars.queryResponse map ( payload01 , indexOfPayload01 ) -> {
	LinkedEntityId: vars.sfdcRecordId,
	ContentDocumentId: payload01.ContentDocumentId
}