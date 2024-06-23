<cfcomponent displayname="User" output="false">
    <cfproperty name="id" type="numeric">
    <cfproperty name="username" type="string">
    <cfproperty name="email" type="string">
    <cfproperty name="password" type="string">
    <cfproperty name="createdDate" type="date">

    <cffunction name="init" access="public" returntype="User" output="false">
        <cfscript>
        variables.id = 0;
        variables.username = "";
        variables.email = "";
        variables.password = "";
        variables.createdDate = now();
        </cfscript>
        <cfreturn this>
    </cffunction>
</cfcomponent>