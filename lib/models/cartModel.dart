class CartModels{
  String image;
  String name;
  int price;
  int quantity;
  CartModels({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
  Map<String,dynamic>toMap(){
    return{
      "image":this.image,
      "name":this.name,
      "price":this.price,
      "quantity":this.quantity,

    };
  }
  factory CartModels.fromMap(Map<String,dynamic>map){
    return CartModels(
        image: map["image"]??"",
        name: map["name"]??"",
        price: map["price"]??0,
        quantity: map["quantity"]??0,

    );
  }
  CartModels copyWith({
    String?image,
    String?name,
    String?review,
    int?price,
    int?quantity,

  }){
    return CartModels(
        image: image??this.image,
        name: name?? this.name,
        price: price?? this.price,
        quantity: quantity?? this.quantity,

    );
  }
}