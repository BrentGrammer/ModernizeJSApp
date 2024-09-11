component {

    public function init(
        addressComponent
    ) {
        this.addressComponent = arguments.addressComponent;

        return this;
    }

    public user function userWithAddress() {
        var userAddr = this.addressComponent.getUserAddress();
        var user = new apps.model.user();
        user.setAddress(userAddr);

        return user;
    }
}