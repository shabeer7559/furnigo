class TotelReviews{
  String name;
  String image;
  String review;
  String date;
  int star;


  TotelReviews({
    required this.name,
    required this.image,
    required this.review,
    required this.date,
    required this.star,

  });
  Map<String,dynamic>toMap(){
    return {
      "name":this.name,
      "image":this.image,
      "review":this.review,
      "date":this.date,
      "star":this.star,

    };
  }
  factory TotelReviews.fromMap(Map<String,dynamic>map){
    return TotelReviews(
        name: map["name"]??"",
        image: map["image"]??"",
        review: map["review"]??"",
        date: map["date"]??"",
      star: map["star"]??0,

    );
  }
  TotelReviews copyWith({
    String? name,
    String? image,
    String? review,
    String? date,
    int? star,

  }){
    return TotelReviews(
        name: name??this.name,
        image: image??this.image,
        review: review??this.review,
        date: date??this.date,
      star: star??this.star,

    );
  }
}