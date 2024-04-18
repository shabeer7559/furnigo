class UserModel {
  String? name;
  String? email;
  String? password;
  String? image;

  UserModel({
     this.name,
    this.email,
    this.password,
     this.image
  });

  Map<String,dynamic> toMap(){
    return{
      "name":this.name,
      "email":this.email,
      "password":this.password,
      "image":this.image
    };
  }
  factory UserModel.fromMap(Map<String, dynamic>map){
    return UserModel(
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      password: map["password"] ?? "",
      image: map ["image"]??"",
    );
  }
  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? image
  }) {
    return UserModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        image: image ?? this.image
    );
  }
}