import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:users_app/widgets/doctor_card.dart';


class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    CarouselSlider(
                        options: CarouselOptions(
                          height:180.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio:16/9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                        items: [
                    Container(
                    margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                    image: AssetImage('images/bilgiler1.jpeg'),
                    fit: BoxFit.cover,
              )
          ),
        ),
        Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                    image: AssetImage('images/bilgiler2.jpeg'),
                    fit: BoxFit.cover,
              )
            ),
        ),
                          Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage('images/bilgiler3.jpeg'),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),

                        ],




                    ),
                    SizedBox(height: 25,),
                    Text("Evimde Sa??l??k",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontStyle: FontStyle.italic,
                        fontSize: 28,
                        //  fontWeight: FontWeight.bold,
                        color: Color(0xFF332d2b),
                      ),),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildSocialIcons(FontAwesomeIcons.whatsapp),
                        const SizedBox(width: 12,),
                        buildSocialIcons(FontAwesomeIcons.instagram),
                        const SizedBox(width: 12,),
                        buildSocialIcons(FontAwesomeIcons.phone),
                        const SizedBox(width: 12,),



                      ],

                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 240.0),
                            child: Text(
                              "HAKKIMIZDA",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF332d2b),
                                  fontWeight: FontWeight.w500

                              ),
                            ),
                          ),

                          SizedBox(height: 20,),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Evimde Sa??l??k, uzun y??llard??r T.C. Sa??l??k Bakanl??????'n??n yetki verdi??i, her biri alan??nda deneyimli sa??l??k personellerimiz ve kordinasyon ekibimiz ile profesyonel bir ??irket olarak ??al????malar??n?? s??rd??rmekte v bir??ok ba??ar??ya imza atm???? olman??n gururunu ta????maktad??r.??irketimiz;e??itim, denetim, m??hendislik ve sa??l??k alan??nda faaliyet g??steren bir markafd??r.",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black54,


                                        ),
                                      ),


                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.only(right: 108.0),
                            child: Text(
                              "SA??LIK ??ALI??ANLARIMIZ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color:Color(0xFF332d2b),
                                  fontWeight: FontWeight.w500

                              ),
                            ),
                          ),
                          SizedBox(height: 30,),


                          Container(
                            height: 250,
                            width: 500,

                            child: Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  DoctorCard(
                                    doctorImagePath: 'images/doctor4.jpeg',
                                    rating: '4.9',
                                    doctorName: 'Mehmet Y??lmaz',
                                    doctorProfession: '???? Hastal??klar??',
                                  ),
                                  DoctorCard(
                                    doctorImagePath: 'images/doctor1.jpeg',
                                    rating: '4.5',
                                    doctorName: 'K??bra G????l??',
                                    doctorProfession: 'Hem??ire',
                                  ),
                                  DoctorCard(
                                    doctorImagePath: 'images/doctor6.jpeg',
                                    rating: '3.8',
                                    doctorName: 'Mert Demir',
                                    doctorProfession: 'Acil T??p',
                                  ),
                                  DoctorCard(
                                    doctorImagePath: 'images/doctor2.jpeg',
                                    rating: '4.9',
                                    doctorName: 'Zeli?? Kara',
                                    doctorProfession: 'Terapist',
                                  ),
                                  DoctorCard(
                                    doctorImagePath: 'images/doctor5.jpeg',
                                    rating: '4.8',
                                    doctorName: 'Aysel Tilki',
                                    doctorProfession: 'Genel Cerrahi',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],

                      ),
                    ),
                    SizedBox(height: 25,),


                  ],




                ),


                ),


              ],
            )),
      ),

    );
  }
  void _openWhatsAppChat()async{
    String phoneNumber ='5462093402';
    var url ='https://wa.me/5462093402?text=Merhabalar detayl?? bilgi alabilir miyim';
    await launch(url);
  }

  Widget buildSocialIcons(IconData icon) => CircleAvatar(
      radius: 25,
    backgroundColor: Color(0xffc5b9cd),
    child: Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          _openWhatsAppChat();
        },
        onDoubleTap: () async{
          final phoneNumber = '5462093402';
          final url = 'tel:$phoneNumber';
          await launch(url);
        },
        child: Center(child:  Icon(icon, size: 32,)),
      ),
      ),
    );




}
