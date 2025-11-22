class ShippingAddressOrderEntity {
  String? name;
  String? email;
  String? address;
  String? city;
  String? floorNumber;

  ShippingAddressOrderEntity({
    this.name = "",
    this.email = "",
    this.address = "",
    this.city = "",
    this.floorNumber = "",
  });
  @override
  String toString() {
    // TODO: implement toString
    return "$city $address $floorNumber";
  }
}