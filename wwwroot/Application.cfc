component displayname="Application" output="false" hint="Handle the application" {

      this.name = "myApplication";

      this.locale = "en_US"; 

      this.charset.web="UTF-8";

      // set app timeout to 1 day - if too short, then onApplicationStart could run every request
      this.applicationTimeout = createTimeSpan( 1, 0, 0, 0 );
      this.sessionTimeout = createTimeSpan( 0, 0, 30, 0 );

      this.dsn = "appdb";

      this.datasources[this.dsn] = {
         class: "com.mysql.cj.jdbc.Driver", 
         bundleName: "com.mysql.cj", 
         bundleVersion: "8.0.33",
         connectionString: "jdbc:mysql://db:3306/appdb?characterEncoding=UTF-8&serverTimezone=Etc/UTC&maxReconnects=3",
         username: "appuser",
         password: "encrypted:6fb14807007a792d72403ace8da5f8f437a2a1caff074031", // this has to be the encrypted value of the password (not the pw chars directly...)
      };

      this.datasource = this.dsn;

      this.directory = Left(expandPath("."), findNoCase("wwwroot", expandPath(".")) - 1);
 
      this.mappings["/apps"] = this.directory;

      public boolean function OnApplicationStart(){
         // set up global settings/variables
         application.dsn = this.dsn;
         application.rootDirectory = expandPath("../");

         application.addressComponent = createObject("component", "../model/AddressComponent").init();

         application.userComponent = createObject("component", "apps.model.UserComponent").init(
            dsn=application.dsn,
            addressComponent=application.addressComponent
         );

         application.userHandler = createObject("component", "apps.handlers.UserHandler");

         application.userService = createObject("component", "apps.service.UserService").init(dsn=application.dsn);
         return true;
      }

     // Not sure why this is needed, otherwise variables do not persist across requests, something could be wrong. Does OnApplicationStart persist variables across request?
     public boolean function onRequestStart() {
        return onApplicationStart(); //reload variables into scope
     }
 }