
import 'dart:convert';
ServiceWidget serviceWidgetFromJson(String str) =>ServiceWidget.fromJson(json.decode(str));
String serviceWidgetsToJson(ServiceWidget data) =>json.encode(data.toJson());

class ServiceWidget{
  ServiceWidget({
    required this.search,
    required this.totalResults,
    required this.response,
});

  List<Search> search;
  String totalResults;
  String response;

  factory ServiceWidget.fromJson(Map<String,dynamic> json) => ServiceWidget(
    search: List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
    totalResults: json["totalResults"],
    response: json["Response"],
  );

  Map<String,dynamic> toJson() =>{
    "Search": List<dynamic>.from(search.map((x) =>x.toJson() )),
    "totalResults":totalResults,
    "response":response,
  };
}



class Search {
 String title;
 String id;
 String image;
 Search({required this.title,required this.id,required this.image});

 factory Search.fromJson(Map<String,dynamic> json) =>Search(
     title: json ["Title"],
     id: json["ID"],
     image: json["Image"],

     );
Map<String,dynamic> toJson()=>{
  "Title": title,
  "ID":id,
  "Image":image,
};
}


/*
* final String id;
  final String image;
  final String title;
  Service({  required this.id, required this.image,required this.title});

  factory Service.fromJson(Map<String, dynamic> json){
    return Service(
        id: json["Id"],
        image: json ["Image"],
        title: json ["Title"]);
  }
*
*
*
* */