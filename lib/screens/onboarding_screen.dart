import 'package:flutter/material.dart';
import 'package:users_app/assistants/assistant_methods.dart';
import 'package:users_app/authentication/login_screen.dart';
import 'package:users_app/components/animated_container.dart';
import 'package:users_app/components/screen_content.dart';
import 'package:users_app/components/skip_button.dart';
import 'package:users_app/components/steps_container.dart';
import 'package:users_app/config/size_config.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/mainScreens/main_screen.dart';
import 'package:users_app/models/onboarding_model.dart';



class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  List<OnboardingModel> _list = OnboardingModel.list;
  int page=0;
  var _controller=PageController();
  var showAnimatedContainer =false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _controller.addListener(() {
      setState(() {
        page=_controller.page!.round();
      });

    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children:[  showAnimatedContainer ? Center(child: MyAnimatedContainer(),) :
        SafeArea(
          child: Column(
            children: [
              SkipButton(),
              Expanded(
               child: PageView.builder(
                  controller: _controller,
                  itemCount: _list.length,
                  itemBuilder: (context, index) => ScreenContent(
                list: _list,
                index: index,)),
              ),
             StepsContainer(page: page, list: _list, controller: _controller,
             showAnimatedContainerCallBack: (value)
             {
               setState(() async {
                 showAnimatedContainer =value;
                 fAuth.currentUser != null ? AssistantMethods.readCurrentOnlineUserInfo() : null;
               if(await fAuth.currentUser !=null)
              {
                currentFirebaseUser = fAuth.currentUser;
                if(value) {
                  Future.delayed(Duration(seconds:1),(){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context)=> MainScreen()));
                  });
                }
              }else
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
    }
               });
             }, ),
              SizedBox(
                height: SizeConfig.defaultSize! * 4,
              )
            ],
          ),
        ),
    ],
      ),
    );
  }
}

