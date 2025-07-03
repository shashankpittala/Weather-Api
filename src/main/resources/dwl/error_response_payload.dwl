%dw 2.0
output application/json
---
{
	" Error_Message" : error.description ,
	"errorType" : error.errorType.identifier ,
	"latitute and longitude": payload
}