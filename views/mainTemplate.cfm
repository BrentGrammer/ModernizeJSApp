<main>
    <h1>Main Template</h1>

    <cfset users = application.userService.getAllUsers()>

    <nav>
        <a href="?page=page2">Go to page 2</a>
    </nav>

    <form id="createUserForm">
        <h2>Create a New User:</h2>
        <input type="text" name="username" required placeholder="Enter username" />
        <input type="text" name="email" required placeholder="Enter email" />
        <input type="text" name="password" required placeholder="Enter password" />
        <button type="submit">Create User</button>
    </form>

    <h2>Users List</h2>
    <ul>
        <cfloop array="#users#" index="user">
            <li><cfoutput>#user.username#</cfoutput></li>
        </cfloop>
    </ul>

    <cfscript>
        userWithAddr = application.userComponent.userWithAddress();
    </cfscript> 

    <h2>A User Address</h2>
    <p><cfoutput>#userWithAddr.getAddress()#</cfoutput></p>
    
    <script src="/js/libs/jQuery.min.js"></script>
    <script>
        var appManager = {};
    </script>
    <script src="/js/firstscript.js"></script>
    <script src="/js/secondscript.js"></script>
    <script src="/js/thirdscript.js"></script>
</main>