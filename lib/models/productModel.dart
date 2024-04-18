class ProductModels{
  String? image;
  String? name;
  String? review;
  int? price;
  int?quantity;
  String?id;
  ProductModels({
    this.image,
    this.name,
    this.review,
    this.price,
    this.quantity,
    this.id
  });
  Map<String,dynamic>toMap(){
    return{
      "image":this.image,
      "name":this.name,
      "review":this.review,
      "price":this.price,
      "quantity":this.quantity,
      "id":this.id
    };
  }
  factory ProductModels.fromMap(Map<String,dynamic>map){
    return ProductModels(
        image: map["image"]??"",
        name: map["name"]??"",
        review: map["review"]??"",
        price: map["price"]??0,
        quantity: map["quantity"]??0,
        id :map["id"]??""
    );
  }
  ProductModels copyWith({
    String?image,
    String?name,
    String?review,
    int?price,
    int?quantity,
    String? id
  }){
    return ProductModels(
        image: image??this.image,
        name: name?? this.name,
        review: review?? this.review,
        price: price?? this.price,
        quantity: quantity?? this.quantity,
        id: id??this.id
    );
  }
}