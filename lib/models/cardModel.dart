class CardModels{
String cdName;
String cdNumber;
String cdCvv;
String cdDate;
CardModels({
required this.cdName,
required this.cdNumber,
  required this.cdCvv,
  required this.cdDate
});
Map<String,dynamic>toMap(){
return{
"cdName":this.cdName,
"cdNumber":this.cdNumber,
"cdCvv":this.cdCvv,
"cdDate":this.cdDate,
};
}
factory CardModels.fromMap(Map<String,dynamic>map){
return CardModels(
    cdName: map["cdName"]??"",
    cdNumber: map["cdNumber"]??"",
    cdCvv: map["cdCvv"]??"",
    cdDate: map["cdDate"]??""
);
}
CardModels copyWith({
String?cdName,
String?cdNumber,
String?cdCvv,
String?cdDate,
}){
  return CardModels(
      cdName: cdName?? this.cdName,
      cdNumber: cdNumber?? this.cdNumber,
      cdCvv: cdCvv?? this.cdCvv,
      cdDate: cdDate?? this.cdDate);

}
}
