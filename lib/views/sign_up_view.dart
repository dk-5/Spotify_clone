import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_store/utils/button/basic_button.dart';
import 'package:x_store/views/sign_in_view.dart';
import 'package:x_store/widgets/app_bar.dart';
import 'package:x_store/widgets/auth/auth_service.dart';

class SignUpView extends StatefulWidget{
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _name;
  
  @override
   void initState()
  {
    _email=TextEditingController();
    _password=TextEditingController();
    _name=TextEditingController();
    super.initState();
  }
  @override
  void dispose()
  {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            
              const Text('Register',
              style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize:40,
                
              ),),
               const SizedBox(height:50,),
                TextField(
                  controller:_name,
                  decoration:const InputDecoration(
                hintText:'Full Name'
              ),),
               const SizedBox(height:15,),
               TextField(
                controller:_email,
                decoration:const InputDecoration(
                hintText:'Email'
              ),),
               const SizedBox(height:15,),
               TextField(
                controller:_password,
                decoration:const InputDecoration(
                hintText:'Password'
              ),),
              const SizedBox(height:15,),
              BasicButton(onPressed:(){
               AuthService.firebase().createUser(email: _email.text, password: _password.text,name:_name.text);
              }, title:'Create Account'),
               
            ],
          ),
      ),
      bottomNavigationBar:Row(
        mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text('Do you have an account?',
                   style:TextStyle(
                    fontWeight:FontWeight.w500
                   ),),
                   TextButton(onPressed:(){
                     Navigator.push(context,
                   MaterialPageRoute(builder:(BuildContext context)=> const SignInView()));
                   }, child:const Text('Sign In',
                   style:TextStyle(
                    color:Colors.blue,
                  
                   )
                   ))
                ],
              ),
      );
  }
}