<!doctype html>
<html>
    <head>
        <title>test</title>
    </head>
    <body>
        <cfscript>
            // Simple routing
            param name="url.page" default="home";
            
            // Define the path to the views folder
            viewsPath = expandPath("../views");
            
            // Determine which view to render
            switch(url.page) {
                case "home":
                    viewToRender = "mainTemplate.cfm";
                    break;
                default:
                    viewToRender = "404.cfm";
            }
            
            // Check if the view exists
            if (fileExists(viewsPath & "/" & viewToRender)) {
                include "../views/#viewToRender#";
            } else {
                include "../views/404.cfm";
            }
        </cfscript>

        <script type="module" src="/js/main.js"></script>
    </body>
</html>