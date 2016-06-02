<%
	Set Mail=CreatedObject("CDO.Message")
	Mail.Subject="Email subject"
	Mail.From="from@domain.com"
	Mail.To="troy.kayne@colorado.edu"
	Mail.TextBody="This is an email Message"
	Mail.Send
	set Mail=nothing
%>