<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>File Uploading Form</title>
</head>
<body>
	<h3>File Upload:</h3>
	Select a file to upload: <br />
	<form action="./upload_estado" method="post" enctype="multipart/form-data">
		<input type="file" name="file" />
		<br />
		<input type="submit" value="Upload" />
	</form>
</body>
</html>