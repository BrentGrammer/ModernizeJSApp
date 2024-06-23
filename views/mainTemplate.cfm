<!--- <cfset userService = CreateObject("component", "MODERNIZELEGACYAPP.service.userService").init(#application.datasource#)> --->
<cfdump var="#serialize(application)#">
<cfset userService = CreateObject("component", "../service/userService").init("appDB")>
<cfset users = userService.getAllUsers()>


<main>
    <h1>Main Template</h1>
    <a href="?page=page2">Go to page 2</a>
    <h1>Users List</h1>
    <ul>
        <cfloop array="#users#" index="user">
            <li><cfoutput>#user.username#</cfoutput></li>
        </cfloop>
    </ul>
    <script type="module" src="/js/mainTemplate.js"></script>
</main>