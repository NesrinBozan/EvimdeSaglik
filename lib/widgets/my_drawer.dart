import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {

  String? name;
  String? email;

  MyDrawer({this.name,this.email});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: ListView(
        children: [
          //drawer header
          Container(
            height: 165,
            color: Colors.deepPurpleAccent,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                 const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.deepPurpleAccent,
                  ),
                   const SizedBox(width: 16,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,

                      ),),
                      Text(
                       widget.email.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,

                        ),),

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
