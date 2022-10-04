%dw 2.0
import * from dw::core::Binaries
output application/java
---
[{
	PathOnClient: payload.parts.file1.headers["Content-Disposition"].filename,
	VersionData: payload.parts.file1.content as Binary {
		class: "byte[]"
	}
}]