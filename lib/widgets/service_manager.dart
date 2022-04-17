import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users_app/global/string.dart';
import 'package:users_app/widgets/services.dart';


class ServiceManager {

 Future<ServiceWidget> getService() async{
    var client= http.Client();
    var serviceWidget=null;

    try {
      var response = await client.get(Uri.parse(Strings.service_url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        serviceWidget = ServiceWidget.fromJson(jsonMap);
      }
    }catch(Exception)
  {
    return serviceWidget;
  }
    return serviceWidget;

 }
}