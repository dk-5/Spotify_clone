
import 'package:flutter/material.dart';
import 'package:x_store/utils/theme/app_color.dart';


class AppTheme 
{
static final lightTheme=ThemeData(
primaryColor:AppColor.primary,
scaffoldBackgroundColor:AppColor.lightBackground,
fontFamily:'Satoshi',
brightness:Brightness.light,
inputDecorationTheme:InputDecorationTheme(
                filled:true,
                fillColor:Colors.transparent,
                contentPadding:const EdgeInsets.all(30),
                border:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(30),
                   borderSide:const BorderSide(
                    color:Colors.black,
                    width:0.4
                  )
                ),
                ),
elevatedButtonTheme:ElevatedButtonThemeData(
  style:ElevatedButton.styleFrom(
    backgroundColor:AppColor.primary,
    textStyle:const TextStyle(fontSize:20,fontWeight:FontWeight.bold,),
    shape:RoundedRectangleBorder(
      borderRadius:BorderRadius.circular(30),
      
    ),
    elevation:0,
  )
)
);

static final darkTheme=ThemeData(
primaryColor:AppColor.primary,
scaffoldBackgroundColor:AppColor.darkBackground,
brightness:Brightness.dark,
fontFamily:'Satoshi',
inputDecorationTheme:InputDecorationTheme(
                filled:true,
                fillColor:Colors.transparent,
                contentPadding:const EdgeInsets.all(30),
                border:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(30),
                   borderSide:const BorderSide(
                    color:Colors.white,
                    width:0.4
                  )
                ),
                ),
elevatedButtonTheme: ElevatedButtonThemeData(
  style:ElevatedButton.styleFrom(
    backgroundColor:AppColor.primary,
    textStyle:const TextStyle(fontSize:20,fontWeight:FontWeight.bold,),
    shape:RoundedRectangleBorder(
      borderRadius:BorderRadius.circular(30),
    ),
    elevation:0,

  )
)
);
}