class ShippingAddress{
  String name;
  String address;
  String zipcode;
  String country;
  String state;
  String city;
  String type;
  ShippingAddress({
    required this.name,
    required this.address,
    required this.zipcode,
    required this.country,
    required this.state,
    required this.city,
    required this .type,
});
  Map<String,dynamic>toMap(){
return{
  "name":this.name,
  "address":this.address,
  "zipcode":this.zipcode,
  "country": this.country,
  "state":this.state,
  "city":this.city,
  "type":this.type
};
  }
  factory ShippingAddress.fromMap(Map<String,dynamic>map){
    return ShippingAddress(
        name: map["name"]??"",
        address: map["address"]??"",
        zipcode: map["zipcode"]??"",
        country: map['country']??'',
        state: map["state"]??"",
        city: map['city']??"",
        type: map["type"]??"");
  }
  ShippingAddress copyWith({
    String? name,
    String? address,
    String? zipcode,
    String? country,
    String? state,
    String? city,
    String? type,
}){
    return ShippingAddress(
        name: name??this.name,
        address: address??this.address,
        zipcode: zipcode??this.address,
        country: country??this.country,
        state: state??this.state,
        city: city??this.city,
        type: type??this.type);
  }
}