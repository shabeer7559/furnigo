class RatingModel{
  String name;
  String image;
  String review;
  String date;
  String rating;

 RatingModel({
    required this.name,
   required this.image,
   required this.review,
   required this.date,
   required this.rating
});
 Map<String,dynamic>toMap(){
   return {
     "name":this.name,
     "image":this.image,
     "review":this.review,
     "date":this.date,
     "rating":this.rating
   };
 }
  factory RatingModel.fromMap(Map<String,dynamic>map){
    return RatingModel(
        name: map["name"]??"",
        image: map["image"]??"",
        review: map["review"]??"",
        date: map["date"]??"",
        rating: map["rating"]??"",
    );
 }
  RatingModel copyWith({
    String? name,
    String? image,
    String? review,
    String? date,
    String? rating,
  }){
    return RatingModel(
        name: name??this.name,
        image: image??this.image,
        review: review??this.review,
        date: date??this.date,
        rating: rating??this.rating,
    );
  }
}