<cfcomponent>
    <cffunction name="createUser" returntype="struct">
        <cfargument name="username" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        
        <cfset var response = {}>
        
        <cftry>
            <cfset application.userService.createUser(arguments.username, arguments.email, arguments.password)>
            
            <cfset response = {
                "success": true,
                "message": "User created successfully"
            }>
            
            <cfcatch type="any">
                <cfset response = {
                    "success": false,
                    "message": "Error creating user: #cfcatch.message#"
                }>
            </cfcatch>
        </cftry>
        
        <cfreturn response>
    </cffunction>
</cfcomponent>
