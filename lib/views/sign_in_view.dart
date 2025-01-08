import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_store/utils/button/basic_button.dart';
import 'package:x_store/views/home_view.dart';
import 'package:x_store/views/sign_up_view.dart';
import 'package:x_store/widgets/app_bar.dart';
import 'package:x_store/widgets/auth/auth_service.dart';

class SignInView extends StatefulWidget {

  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  
  @override
   void initState()
  {
    _email=TextEditingController();
    _password=TextEditingController();
    super.initState();
  }
  @override
  void dispose()
  {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset : false,
      appBar:BasicAppBar(
        title:SvgPicture.asset('assets/logos/spotify_logo.svg',
        height:40,
        width:40,),
        ),
      body:Padding(
        padding:const EdgeInsets.symmetric(horizontal:30,
        vertical:40),
        child:  Column(
            children: [
            
              const Text('Sign In',
              style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize:40,
                
              ),),
               const SizedBox(height:70,),
                 TextField(
                  controller:_email,
                  decoration:const InputDecoration(
                hintText:'Enter Username or Email'
              ),),
               const SizedBox(height:15,),
                TextField(
                controller:_password,
                decoration:const InputDecoration(
                hintText:'Password'
              ),),
              const SizedBox(height:15,),
              BasicButton(onPressed:(){
              AuthService.firebase().logIn(email: _email.text, password: _password.text);
              Navigator.pushAndRemoveUntil(context,
                   MaterialPageRoute(builder:(BuildContext context)=> const HomeView()),(_)=>false);
              }, title:'Sign In'),
               
            ],
          ),
      ),
      bottomNavigationBar:Row(
        mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text('Not a Member?',
                   style:TextStyle(
                    fontWeight:FontWeight.w500
                   ),),
                   TextButton(onPressed:(){
                    Navigator.pushReplacement(context,
                   MaterialPageRoute(builder:(BuildContext context)=> const SignUpView()));
                   }, child:const Text('Register Now',
                   style:TextStyle(
                    color:Colors.blue,
                  
                   )
                   ))
                ],
              ),
      );
  }
}