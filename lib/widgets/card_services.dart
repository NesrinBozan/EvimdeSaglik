import 'package:flutter/material.dart';
import 'package:users_app/widgets/services.dart';

class ServicesWidget extends StatelessWidget {

  final List<Search> services;
  ServicesWidget({required this.services}); //? konuldu


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: services.length,
    itemBuilder: (context,index){
      final service =services[index];
      return ListTile(
        leading: Image.network(service.image),
        title: Text(service.title),
      );
    },);
  }
}
