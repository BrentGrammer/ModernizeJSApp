component accessors="true" {

    property name="id" type="numeric";
    property name="username" type="string";
    property name="email" type="string";
    property name="password" type="string";
    property name="createdDate" type="date";
    property name="address" type="string";

    public function init() {
        return this;
    }

    this.setid(0);
    this.setusername("");
    this.setemail("");
    this.setpassword("");
    this.setcreatedDate(now());
    this.setAddress("");

}