component {

	this.name="LegacyApp";
	// this.applicationTimeout = CreateTimeSpan(0,0,60,0);
	// this.sessionTimeout = CreateTimeSpan(0,0,60,0);
	// this.sessionManagement=true;
	// this.clientManagement = false;
	
	this.datasources["appDB"] = {
		  class: 'com.mysql.jdbc.Driver'
		, bundleName: 'com.mysql.jdbc'
		, bundleVersion: '8.4.0'
		, connectionString: 'jdbc:mysql://db:3306/appdb?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=true&useSSL=false&allowPublicKeyRetrieval=true'
		, username: 'appuser'
		, password: "encrypted:12345"
		
		// optional settings
		// , blob:true // default: false
		// , clob:true // default: false
		// , connectionLimit:100 // default:-1
	};

	this.datasource = "appDB";
}