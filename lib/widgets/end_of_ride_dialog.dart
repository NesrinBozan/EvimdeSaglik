import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class EndOfRideDialog extends StatefulWidget
{

  @override
  State<EndOfRideDialog> createState() => _EndOfRideDialogState();
}




class _EndOfRideDialogState extends State<EndOfRideDialog>
{
  @override
  Widget build(BuildContext context)
  {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      backgroundColor: Colors.grey,
      child: Container(
        margin: const EdgeInsets.all(6),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const SizedBox(height: 20,),

            Text(
              "Geçmiş Olsun".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff8946A6),
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20,),

            const Divider(
              thickness: 4,
              color: Colors.grey,
            ),

            const SizedBox(height: 16,),
            Icon(Icons.medical_services_outlined,color: Colors.lightGreen,
            size: 75,
            ),


            /*Text(
             "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 50,
              ),
            ),*/

            const SizedBox(height: 10,),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Sağlığınızı ayağınıza getiriyoruz. Bizi tercih ettiğiniz için teşekkür ederiz.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8946A6),
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
              ),
            ),

            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                ),
                onPressed: ()
                {
                  Future.delayed(const Duration(milliseconds: 2000), ()
                  {
                    Navigator.pop(context, "Degerlendir");
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sağlıklı Günler",

                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
           /* Text(
                      "",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),*/
                  ],
                ),
              ),
            ),

            const SizedBox(height: 4,),

          ],
        ),
      ),
    );
  }
}
