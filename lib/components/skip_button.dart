import 'package:flutter/material.dart';
import 'package:users_app/config/size_config.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: (){},
            child: Text(
                'Atla',
                style:TextStyle(
                    fontSize: SizeConfig.defaultSize! * 1.4,
                    color: Colors.deepPurpleAccent,fontWeight: FontWeight.w600
                )
            ),
          )
        ],
      ),
    );
  }
}
