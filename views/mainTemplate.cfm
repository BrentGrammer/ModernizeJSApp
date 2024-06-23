<main>
    <h1>Main Template</h1>
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
    </main>

    <script src="/js/firstscript.js"></script>
    <script src="/js/secondscript.js"></script>
    <script src="/js/thirdscript.js"></script>
</main>