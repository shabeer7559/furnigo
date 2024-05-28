class FavoriteModels{
  String image;
  String name;
  int price;
  String catId;
  String proId;

  FavoriteModels({
   required this.image,
    required this.name,
    required this.price,
    required this.catId,
    required this.proId

  });
  Map<String,dynamic>toMap(){
    return{
      "image":this.image,
      "name":this.name,
      "price":this.price,
      'catId':this.catId,
      "proId":this.proId

    };
  }
  factory FavoriteModels.fromMap(Map<String,dynamic>map){
    return FavoriteModels(
        image: map["image"]??"",
        name: map["name"]??"",
        price: map["price"]??0,
      catId: map['catId']??"",
      proId: map["proId"]??""

    );
  }
  FavoriteModels copyWith({
    String?image,
    String?name,
    int?price,
    String?catId,
    String? proId,

  }){
    return FavoriteModels(
        image: image??this.image,
        name: name?? this.name,
        price: price?? this.price,
      catId: catId??this.catId,
      proId: proId?? this.proId,

    );
  }
}