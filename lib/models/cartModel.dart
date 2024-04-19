class CartModels{
  String? image;
  String? name;
  int? price;
  int?quantity;
  String?id;
  CartModels({
    this.image,
    this.name,
    this.price,
    this.quantity,
    this.id
  });
  Map<String,dynamic>toMap(){
    return{
      "image":this.image,
      "name":this.name,
      "price":this.price,
      "quantity":this.quantity,
      "id":this.id
    };
  }
  factory CartModels.fromMap(Map<String,dynamic>map){
    return CartModels(
        image: map["image"]??"",
        name: map["name"]??"",
        price: map["price"]??0,
        quantity: map["quantity"]??0,
        id :map["id"]??""
    );
  }
  CartModels copyWith({
    String?image,
    String?name,
    String?review,
    int?price,
    int?quantity,
    String? id
  }){
    return CartModels(
        image: image??this.image,
        name: name?? this.name,
        price: price?? this.price,
        quantity: quantity?? this.quantity,
        id: id??this.id
    );
  }
}