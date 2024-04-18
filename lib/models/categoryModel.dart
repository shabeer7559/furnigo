class CategoryModel{
  String category;
  String id;
  String image;
  CategoryModel({
    required this.category,
    required this.id,
    required this.image
  });
  Map<String,dynamic>toMap(){
    return {
      "category":this.category,
      "image":this.image,
      "id":this.id,
    };
  }
  factory CategoryModel.fromMap(Map<String,dynamic>map){
    return CategoryModel(
        category: map["category"]??"",
        id: map["id"]??"",
        image: map["image"]??"");
  }
  CategoryModel copyWith({
    String? category,
    String? id,
    String? image
  }){
    return CategoryModel(
        category: category??this.category,
        id: id??this.id,
        image: image??this.image);
  }
}