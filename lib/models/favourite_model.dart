class FavoriteModels{
  String? image;
  String? name;
  int? price;
  String?id;
  FavoriteModels({
    this.image,
    this.name,
    this.price,
    this.id
  });
  Map<String,dynamic>toMap(){
    return{
      "image":this.image,
      "name":this.name,
      "price":this.price,
      "id":this.id
    };
  }
  factory FavoriteModels.fromMap(Map<String,dynamic>map){
    return FavoriteModels(
        image: map["image"]??"",
        name: map["name"]??"",
        price: map["price"]??0,
        id :map["id"]??""
    );
  }
  FavoriteModels copyWith({
    String?image,
    String?name,
    int?price,
    String? id
  }){
    return FavoriteModels(
        image: image??this.image,
        name: name?? this.name,
        price: price?? this.price,
        id: id??this.id
    );
  }
}