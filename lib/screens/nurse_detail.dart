import 'package:flutter/material.dart';
import 'package:users_app/widgets/utils.dart';


class NurseDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image:  DecorationImage(
              image: AssetImage('images/hemsire.jpeg'),
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
    height: MediaQuery.of(context).size.height * 0.24,
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
            Text(
              "Hangi Hizmetler Yapılmakta ?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color:Color(0xFF332d2b),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Evde Hemşire Desteği, Kan Numunesi Alma, İdrar Numunesi Alma, Gaite Numunesi Alma, Serum Takma ve Takibi, Yatak Yarası Bakımı, Yara Pansumanı, Enjeksiyon Uygulamaları, Aşı Uygulamaları, Tansiyon ve Şeker Ölçümü, EKG Çekimi, Radyoloji İşlemleri. ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Neden Evde Hemşire Hizmeti Almalıyım ?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color:Color(0xFF332d2b),
              ),
            ),
            SizedBox(height: 10,),
            Text(
                "Hastaya kendini özel hissettirir. Enfeksiyon riskini en aza indirir. Pandemi sürecindeveya evden çıkmanın riskli olduğu durumlarda kolaylık sağlar. Zamandan kazanç sağlar. Özel bakım ve detaylı bilgi alma imkanı sağlar. Psikolojik olarak rahat hissettirir.  Yaşam kalitenizi en üst seviyeye taşır. Sağlık hizmetine ulaşmamnın en kolay yoludur.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
        ),
    ),
            ],

    ),
      ),
      ),


    );
  }
}
