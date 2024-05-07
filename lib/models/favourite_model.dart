class FavoriteModels{
  String image;
  String name;
  int price;

  FavoriteModels({
   required this.image,
    required this.name,
    required this.price,

  });
  Map<String,dynamic>toMap(){
    return{
      "image":this.image,
      "name":this.name,
      "price":this.price,

    };
  }
  factory FavoriteModels.fromMap(Map<String,dynamic>map){
    return FavoriteModels(
        image: map["image"]??"",
        name: map["name"]??"",
        price: map["price"]??0,

    );
  }
  FavoriteModels copyWith({
    String?image,
    String?name,
    int?price,

  }){
    return FavoriteModels(
        image: image??this.image,
        name: name?? this.name,
        price: price?? this.price,

    );
  }
}