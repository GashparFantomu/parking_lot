<%@tag description="base page template" pageEncoding="UTF-8"%>
<%@ attribute name="pageTitle" required="true" %>

<!DOCTYPE html>
<html>
<head>
    <title>${pageTitle}</title>
</head>
<body>
<jsp:doBody/>
</body>
</html>