<!DOCTYPE html>
<html>
    <head>
        <title>test app</title>
    </head>
    <body>
        <cfscript>
            param name="url.page" default="home";
            
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
        </cfscript>
    </body>
</html>