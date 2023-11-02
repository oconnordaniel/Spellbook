> The syntax for email messages is known as the **[Internet Message Format](https://datatracker.ietf.org/doc/html/rfc5322)** (**IMF**).

> <https://mediatemple.zendesk.com/hc/en-us/articles/204644060-how-do-i-view-email-headers-for-a-message>

Headers are all key:value pairs at the the top of the document.

At the end of the headers, the message starts with an HTML 

``` HTML
<!DOCTYPE ... >
<html>
	<head>
		<meta content="...">
		<meta content="...">
	</head
...
...
```

## Interesting Headers

1. **From** - the sender's email address
2. **Subject** - the email's subject line
3. **Date** - the date when the email was sent
4. **To** - the recipient's email address
5. **X-Originating-IP** - The IP address of the email was sent from (this is known as an **[X-header](https://help.returnpath.com/hc/en-us/articles/220567127-What-are-X-headers-)**)
6. **Authenticaton-Results**: **Smtp.mailfrom**; and **header.from**; - The domain the email was sent from.
7. **Reply-To** - This is the email address a reply email will be sent to instead of the **From** email address
8. **Content-Type** - For attachments
