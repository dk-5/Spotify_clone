import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_store/helpers/is_dark_mode.dart';
import 'package:x_store/utils/button/basic_button.dart';
import 'package:x_store/views/sign_in_view.dart';
import 'package:x_store/views/sign_up_view.dart';
import 'package:x_store/widgets/app_bar.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: 
        Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment:Alignment.topRight,
            child:SvgPicture.asset('assets/icons/top_pattern.svg'),
          ),
          Align(
            alignment:Alignment.bottomRight,
            child:SvgPicture.asset('assets/icons/bottom_pattern.svg'),
          ),
          Align(
            alignment:Alignment.bottomLeft,
            child:Image.asset('assets/images/auth_bg.png')
          ),
          Align(
            alignment:Alignment.center,
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal:40),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/logos/spotify_logo.svg'),
                  const SizedBox(height:55,),
                  const Text('Enjoy Listening To Music',
                    style:TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize:26,
                    ),),
                 const SizedBox(height:21,),
                 const Text(
                      'Spotify is a proprietary Swedish audio streaming and media services provider ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color:Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height:30,),
                    Row(
                      children: [
                        Expanded(
                          flex:1,
                          child:BasicButton(onPressed:(){
                           Navigator.push(context,
                   MaterialPageRoute(builder:(BuildContext context)=> const SignUpView()));
                          }, title:'Register') 
                        ),
                        const SizedBox(width:20,),
                       Expanded(
                        flex:1,
                        child:TextButton(onPressed: (){
                           Navigator.push(context,
                   MaterialPageRoute(builder:(BuildContext context)=> const SignInView()));
                        },child:Text('Sign In',
                        style:TextStyle(
                         fontWeight:FontWeight.bold,
                         fontSize:15,
                         color:context.isDarkMode? Colors.white: Colors.black,
                        ),
                        ),)),
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