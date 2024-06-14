<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Index</title>
</head>
<body>
  <cfif StructKeyExists(url, "act")>
    <cfswitch expression="#url.act#"> 
      <cfcase value="main"><cfinclude template="views/mainTemplate.cfm"></cfcase>
      <cfdefaultcase><p>default content</p></cfdefaultcase> 
    </cfswitch>
  <cfelse>
    <p>Hello From Lucee</p>
  </cfif>
  <script type="module" src="/main.js"></script>
</body>
</html>
