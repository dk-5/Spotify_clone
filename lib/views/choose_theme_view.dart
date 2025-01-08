import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_store/bloc/theme_cubit.dart';
import 'package:x_store/utils/button/basic_button.dart';
import 'package:x_store/views/home_view.dart';
import 'package:x_store/views/register_view.dart';
import 'package:x_store/widgets/auth/auth_service.dart';
import 'package:x_store/widgets/auth/auth_user.dart';

class ChooseThemeView extends StatelessWidget {
  const ChooseThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthUser? user;
    user=AuthService.firebase().currentUser;
    return Scaffold(
      body:Stack(
        children: [
          Container(
            padding:const EdgeInsets.symmetric(
              vertical:40,
            horizontal:40),
            decoration:const BoxDecoration(
              image:DecorationImage(image:AssetImage('assets/images/choose_mode_bg.png'),
              fit:BoxFit.fill)
            ),
          ),
          Container(
            color:Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:40,
            vertical:40),
            child: Column(
                children: [
                Align(alignment:Alignment.topCenter,
                child:SvgPicture.asset('assets/logos/spotify_logo.svg'),
                ),
                const Spacer(),
                const Text('Choose Mode',style:TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize:22,
                      color:Colors.white),),
                const  SizedBox(height:40,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap:(){

                            context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter:ImageFilter.blur(sigmaX:10,sigmaY:10),
                              child: Container(
                                height:80,
                                width:80,
                                decoration:const BoxDecoration(
                                  color:Color(0xff30393c),
                                  shape:BoxShape.circle,
                                ),
                                child:SvgPicture.asset('assets/icons/moon.svg',
                                fit:BoxFit.none)
                              ),
                            ),
                          ),
                        ),
                    const SizedBox(height:15,),
                    const Text('Dark Mode',style:TextStyle(
                    fontWeight:FontWeight.w500,
                    color:Colors.grey,
                    fontSize:17
                    ),),
                      ],
                    ),
                    
                    const SizedBox(width:40,),
                    Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                            context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter:ImageFilter.blur(sigmaX:10,sigmaY:10),
                              child: Container(
                                height:80,
                                width:80,
                                decoration:const BoxDecoration(
                                  color:Color(0xff30393c),
                                  shape:BoxShape.circle,
                                ),
                                
                                child:SvgPicture.asset('assets/icons/sun.svg',
                                fit:BoxFit.none,),
                                
                              ),
                            ),
                          ),
                        ),
                    const SizedBox(height:15,),
                    const Text('Light Mode',style:TextStyle(
                    fontWeight:FontWeight.w500,
                    color:Colors.grey,
                    fontSize:17
                    ),),
                      ],
                    ),
            
                  ],
                ),
                const SizedBox(height:50),
                BasicButton(onPressed:(){
                  if(user==null)
                  {
                        Navigator.push(context,MaterialPageRoute(builder:(BuildContext context)=>const RegisterView()));
                  }
                  else 
                  {
                    Navigator.pushAndRemoveUntil(context,
                   MaterialPageRoute(builder:(BuildContext context)=> const HomeView()),(_)=>false);
  
                  }
                 
                }, title:'Continue')
                ],
              ),
          ),
        ],
      ),
      
    );
  }
}