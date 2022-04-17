import 'package:flutter/material.dart';
import 'package:users_app/widgets/utils.dart';
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget> [
        Container(
          width: MediaQuery.of(context).size.width*0.7,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: searchBackroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const TextField(
            decoration: InputDecoration.collapsed(
                hintText: "Arama yapın",

            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: MaterialButton(
            onPressed: (){},
            color: Color(0xffB762C1),
            padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(Icons.search,
            color: Colors.white,),
          ),
          ),

      ],
    );
  }
}
