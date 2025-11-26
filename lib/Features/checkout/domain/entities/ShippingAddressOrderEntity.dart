class ShippingAddressOrderEntity {
  String? name;
  String? email;
  String? address;
  String? city;
  String? floorNumber;
  String? phoneNumber;

  ShippingAddressOrderEntity({
    this.name = "",
    this.email = "",
    this.address = "",
    this.city = "",
    this.floorNumber = "",
    this.phoneNumber="",
  });
  @override
  String toString() {
    // TODO: implement toString
    return "$city $address $floorNumber";
  }
}