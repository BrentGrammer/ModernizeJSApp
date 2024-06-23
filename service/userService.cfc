<cfcomponent displayname="UserService" output="false">

    <cffunction name="init" access="public" returntype="UserService" output="false">
        <cfargument name="dsn" type="string" required="true">
        <cfset variables.dsn = arguments.dsn>
        <cfreturn this>
    </cffunction>

    <cffunction name="getAllUsers" access="public" returntype="array" output="false">
        <cfset var users = ArrayNew(1)>
        <cfset var qUsers = "">
        
        <cfquery name="qUsers" datasource="#variables.dsn#">
            SELECT id, username, email, createdDate
            FROM users
            ORDER BY username
        </cfquery>

        <cfloop query="qUsers">
            <cfset var user = StructNew()>
            <cfset user.id = qUsers.id>
            <cfset user.username = qUsers.username>
            <cfset user.email = qUsers.email>
            <cfset user.createdDate = qUsers.createdDate>
            <cfset ArrayAppend(users, user)>
        </cfloop>

        <cfreturn users>
    </cffunction>

    <cffunction name="getUserById" access="public" returntype="struct" output="false">
        <cfargument name="userId" type="numeric" required="true">
        
        <cfset var user = StructNew()>
        <cfset var qUser = "">
        
        <cfquery name="qUser" datasource="#variables.dsn#">
            SELECT id, username, email, createdDate
            FROM users
            WHERE id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfif qUser.recordCount>
            <cfset user.id = qUser.id>
            <cfset user.username = qUser.username>
            <cfset user.email = qUser.email>
            <cfset user.createdDate = qUser.createdDate>
        </cfif>

        <cfreturn user>
    </cffunction>

    <cffunction name="createUser" access="public" returntype="numeric" output="false">
        <cfargument name="username" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        
        <cfset var userId = 0>
        <cfset var qCreateUser = "">
        
        <cfquery name="qCreateUser" datasource="#variables.dsn#" result="qResult">
            INSERT INTO users (username, email, password, createdDate)
            VALUES (
                <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#hash(arguments.password, 'SHA-256')#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
            )
        </cfquery>
        
        <cfif structKeyExists(qResult, "generatedKey")>
            <cfset userId = qResult.generatedKey>
        </cfif>
        
        <cfreturn userId>
    </cffunction>

</cfcomponent>