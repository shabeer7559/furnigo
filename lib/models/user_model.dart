class UserModel {
  String name;
  String email;
  String password;
  String image;
  List favourite;
  List cartItems;
  List reviews;
  String id;
  List address;
  List payment;

  UserModel({
    required  this.name,
    required this.email,
    required this.password,
    required this.image,
    required this.favourite,
    required this.cartItems,
    required this.reviews,
    required this.id,
    required this.address,
    required this.payment,
  });

  Map<String,dynamic> toMap(){
    return{
      "name":this.name,
      "email":this.email,
      "password":this.password,
      "image":this.image,
      "favourite": this.favourite,
      "cartItems":this.cartItems,
      "reviews":this.reviews,
      "id":this.id,
      "address": this.address,
      "payment": this.payment,
    };
  }
  factory UserModel.fromMap(Map<String, dynamic>map){
    return UserModel(
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      password: map["password"] ?? "",
      image: map ["image"]??"",
      favourite: map["favourite"]??[],
      cartItems: map["cartItems"]??[],
      reviews: map["reviews"]??[],
      id: map["id"]??'',
      address: map["address"]??[],
      payment: map["payment"]??[],
    );
  }
  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? image,
    List? favourite,
    List? cartItems,
    List? reviews,
    String? id,
    List? address,
    List? payment,
  }) {
    return UserModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        image: image ?? this.image,
        favourite: favourite?? this.favourite,
        cartItems: cartItems?? this.cartItems,
        reviews: reviews??this.reviews,
        id: id??this.id,
      address:  address??this.address,
      payment:  payment??this.payment,
    );
  }
}