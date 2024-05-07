class UserModel {
  String name;
  String email;
  String password;
  String image;
  List favourite;
  List cartItems;
  List reviews;
  String id;

  UserModel({
    required  this.name,
    required this.email,
    required this.password,
    required this.image,
    required this.favourite,
    required this.cartItems,
    required this.reviews,
    required this.id
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
      "id":this.id
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
      id: map["id"]??"",
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
    String?id
  }) {
    return UserModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        image: image ?? this.image,
        favourite: favourite?? this.favourite,
        cartItems: cartItems?? this.cartItems,
        reviews: reviews??this.reviews,
      id: id??this.id
    );
  }
}