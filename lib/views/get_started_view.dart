import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_store/utils/button/basic_button.dart';
import 'package:x_store/utils/theme/app_color.dart';
import 'package:x_store/views/choose_theme_view.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            padding:const EdgeInsets.symmetric(
              vertical:40,
            horizontal:40),
            decoration:const BoxDecoration(
              image:DecorationImage(image:AssetImage('assets/images/intro_bg.png'),
              fit:BoxFit.fill,
               
              )
            ),
            ),
          Container(
            color:Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical:40,
              horizontal:40
            ),
            child: Column(
                 children: [
                  Align(
                    alignment:Alignment.topCenter,
                    child:SvgPicture.asset('assets/logos/spotify_logo.svg'),
                  ),
                  const Spacer(),
                  const Text('Enjoy Listening To Music',
                  style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:18,
                    color:Colors.white,
                  ),),
                  const SizedBox(height:21),
                  const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style:TextStyle(
                    fontWeight:FontWeight.w500,
                    fontSize:13,
                    color:AppColor.grey,
                  ),
                  textAlign:TextAlign.center,),
                  const SizedBox(height:20,),
                  BasicButton(onPressed:(){
                   Navigator.push(context,
                   MaterialPageRoute(builder:(BuildContext context)=> const ChooseThemeView()));
                  }, title:'Get Started',)
            
                 ],
                ),
          ),
        ],
      ),
    );
  }
}