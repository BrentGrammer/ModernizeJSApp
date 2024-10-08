<!DOCTYPE html>
<html>
    <head>
        <title>test app</title>
    </head>
    <body>
        <cfscript>
            param name="url.page" default="home";
            param name="url.action" default="";

            if (!isEmpty(url.action)) {
                request.isajaxcall = true;
            }

            switch(url.action) {
                case "createUser":
                    if (NOT structKeyExists(form, "username") || NOT structKeyExists(form, "email") || NOT structKeyExists(form, "password")) {
                        cfcontent(type="application/json", variable=charsetDecode(serializeJSON({ success=false, message="Missing Form Data."}), 'utf-8'));
                    } 
                    
                    result = application.userHandler.createUser(
                        username = form.username,
                        email = form.email,
                        password = form.password
                    );
                    
                    request.response = result;
                    cfcontent(type="application/json", variable=charsetDecode(serializeJSON(request.response), 'utf-8'));
                    break;
                default:
                    break;
            }
            
            switch(url.page) {
                case "home":
                    include "../views/mainTemplate.cfm";
                    break;
                case "page2":
                    include "../views/page2Template.cfm";
                    break;
                default:
                    include "../views/404.cfm";
            }

            // if (request.isajaxcall) AND structKeyExists(request, "response") {
            // }
        </cfscript>
    </body>
</html>