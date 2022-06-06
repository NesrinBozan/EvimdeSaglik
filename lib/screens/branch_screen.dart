import 'package:flutter/material.dart';
import 'package:users_app/widgets/utils.dart';

class BranchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image:  DecorationImage(
                image: AssetImage('images/branch2.jpg'),
                alignment: Alignment.topCenter,
                fit:BoxFit.fitWidth,

              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,

                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 30,
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios),

                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                ),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(80),

                ),
              ),


    child: Padding(padding: EdgeInsets.all(25),

    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 50,),
      Card(
        color: Colors.blue[200],
        child: ListTile(
          title: Text("Evimde Sağlık İstanbul",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("Adres: Ataköy 9. Kısım, Dünya Ticaret Merkezi Arkası, Bakırköy, İstanbul Telefon: 0(212)414 97 97"),
          trailing: Icon(Icons.add_call, color: Colors.green,),
        ),
      ),
      Card(
        color: Colors.blue[200],
        child: ListTile(
          title: Text("Evimde Sağlık Ankara",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("Adres: Anıt Caddesi No: 12, Tandoğan, Ankara  Telefon: 0(212)414 00 01"),
          trailing: Icon(Icons.add_call, color: Colors.green,),
        ),
      ),
      Card(
        color: Colors.blue[200],
        child: ListTile(
          title: Text("Evimde Sağlık Bursa",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("Adres: Elmasbahçeler, Ankara Yolu Caddesi No:44, Osmangazi, Bursa Telefon: 0(212)414 00 01"),
          trailing: Icon(Icons.add_call, color: Colors.green,),
        ),
      ),

      ]
    ),
    ),
            ),


              ],
            ),
          ),

        )

    );
  }
}
