component displayname="Application" output="false" hint="Handle the application" {

      this.name = "myApplication";

      this.locale = "en_US"; 

      this.charset.web="UTF-8";

      // set app timeout to 1 day - if too short, then onApplicationStart could run every request
      this.applicationTimeout = createTimeSpan( 1, 0, 0, 0 );
      this.sessionTimeout = createTimeSpan( 0, 0, 30, 0 );

      //  MAIL SERVERS 
      //  defines one or more mail server connections. 
      //  When sending an email, Lucee tries to send the mail with the first 
      //  defined mail server. If the send operation fails, Lucee will 
      //  continue using the next mail server in the list.
      ////////////////////////////////////////////////////////////////
      // this.mailservers =[
      //     {
      //         host: "smtp.somesmtp.org"
      //        ,port: 587
      //        ,username: "email@somedomain.org"
      //        ,password: "mypassword"
      //        ,ssl: false
      //        ,tls: true
      //        ,lifeTimespan: CreateTimeSpan( 0, 0, 1, 0 )
      //        ,idleTimespan: CreateTimeSpan( 0, 0, 0, 10 )
      //    } 
      // ];

      this.datasourceName = "appdb"

      this.datasources[this.datasourceName] = {
         class: "com.mysql.cj.jdbc.Driver", 
         bundleName: "com.mysql.cj", 
         bundleVersion: "8.0.33",
         connectionString: "jdbc:mysql://db:3306/appdb?characterEncoding=UTF-8&serverTimezone=Etc/UTC&maxReconnects=3",
         username: "appuser",
         password: "encrypted:6fb14807007a792d72403ace8da5f8f437a2a1caff074031", // this has to be the encrypted value of the password (not the pw chars directly...)
      };

      this.datasource = this.datasourceName;

      this.mappings["/model"] = getDirectoryFromPath(getCurrentTemplatePath()) & "../model";
      this.mappings["/service"] = getDirectoryFromPath(getCurrentTemplatePath()) & "../service";
      this.mappings["/handlers"] = getDirectoryFromPath(getCurrentTemplatePath()) & "../handlers";

      public boolean function OnApplicationStart(){
         dump('onapplication start fired');
         // set up global settings/variables
         application.dsn = this.datasourceName;
         application.rootDirectory = expandPath("../");
         return true;
      }

     // Not sure why this is needed, otherwise variables do not persist across requests, something could be wrong. Does OnApplicationStart persist variables across request?
     public boolean function onRequestStart() {
        return onApplicationStart(); //reload variables into scope
     }
 }