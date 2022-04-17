import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:users_app/widgets/service_manager.dart';


import 'package:users_app/widgets/services.dart';

class ServicesCard extends StatefulWidget {
  @override
  _ServicesCardState createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {
  late Future<ServiceWidget> _serviceWidget;


  @override
  void initState() {
    _serviceWidget = ServiceManager().getService();
    super.initState();
  }
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8946A6),
        title: Text("Hizmetler"),

      ),
      body: Container(
        child: FutureBuilder<ServiceWidget>(
        future: _serviceWidget,
          builder: (context,snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.search.length,
                itemBuilder: (context, index) {
                  var searchh =snapshot.data?.search[index];
             return Container(
              width: MediaQuery.of(context).size.width,
               padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
               child: Card(
                 elevation: 5.0,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(2.0),
                 ),
                 child: Container(width: MediaQuery.of(context).size.width,
                 padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 30.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                               borderRadius: BorderRadius.all(Radius.circular(10)),
                               child: Container(
                                 width: 200,
                                 height: 100,
                                 child:Image.network(searchh!.image),

                               )
                             ),
                          ),
                         SizedBox(width: 20.0,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[
                             Text(searchh.title,
                               style: TextStyle(
                           color: Colors.black54,
                           fontSize: 14.0,fontWeight: FontWeight.bold
                         ),),
                           ],
                         )

                       ],
                     )
                   ],
                 ),),
               )
             );

            });
          }else
            return Center(child: CircularProgressIndicator());
          },
          ),
        ),

      );

  }


  }
class MyCard{
  final image;
  final title;
  bool isActive=false;
MyCard(this.image,this.title,this.isActive);
}

/* return Container(
                height: 100,
               child: Row(
                 children: <Widget>[
                   Image.network(searchh!.image),
                 ],
               ),
              );*/
/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:users_app/widgets/card_services.dart';
import 'dart:convert';

import 'package:users_app/widgets/services.dart';

class ServicesCard extends StatefulWidget {
  @override
  _ServicesCardState createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {

  List<Search> _services = <Search>[]; // new List<Service>();
  @override
  void initState() {
    super.initState();
    _populateAllServices();
  }
  void _populateAllServices() async {
    final services = await _fetchAllService();
    setState(() {
      _services = services;
    });
  }

 Future<List<Search>> _fetchAllService() async{
    final response = await http.get(Uri.parse("https://run.mocky.io/v3/ba60d910-1e51-4790-8bf2-da718cb00180"));
    if(response.statusCode ==200){
       final result = jsonDecode(response.body);
       Iterable list = result["Search"];
     return  list.map((service) =>Search.fromJson(service) ).toList();
    }else{
      throw Exception("Failed to load services");
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hizmetler",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hizmetler"),
        ),
        body: ServicesWidget(services: _services,),
      ),
    );
  }


}
*/