class RatingModel{
  String name;
  String image;
  String review;
  String date;
  int rating;
  int price;

 RatingModel({
    required this.name,
   required this.image,
   required this.review,
   required this.date,
   required this.rating,
   required this.price
});
 Map<String,dynamic>toMap(){
   return {
     "name":this.name,
     "image":this.image,
     "review":this.review,
     "date":this.date,
     "rating":this.rating,
     "price":this.price
   };
 }
  factory RatingModel.fromMap(Map<String,dynamic>map){
    return RatingModel(
        name: map["name"]??"",
        image: map["image"]??"",
        review: map["review"]??"",
        date: map["date"]??"",
        rating: map["rating"]??0,
      price: map["price"]??0
    );
 }
  RatingModel copyWith({
    String? name,
    String? image,
    String? review,
    String? date,
    int? rating,
    int? price
  }){
    return RatingModel(
        name: name??this.name,
        image: image??this.image,
        review: review??this.review,
        date: date??this.date,
        rating: rating??this.rating,
      price: price??this.price
    );
  }
}