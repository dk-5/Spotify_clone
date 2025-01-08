import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_store/helpers/is_dark_mode.dart';
import 'package:x_store/utils/theme/app_color.dart';
import 'package:x_store/widgets/app_bar.dart';
import 'package:x_store/widgets/song/bloc/playlist_view.dart';
import 'package:x_store/widgets/song/songs_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin{

  late final TabController _tabController;
  late final TabController _controller;

  @override
  void initState()
  {
    _controller=TabController(length:4, vsync:this);
    _tabController=TabController(length: 4, vsync:this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:BasicAppBar(
          title:SvgPicture.asset('assets/logos/spotify_logo.svg',
          height:40,
          width:40,),
          hideBack:true,
        ),
        body:SingleChildScrollView(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
           children: [
            _homeCard(),
            _tabs(),
             SizedBox(
              height:260,
               child: TabBarView(
                controller:_controller,
                children:[
               const  SongsListView(),
                Container(),
                Container(),
                Container(),
                           ]),
             ),
             
             const PlaylistView(),
           ] 
          ),
        ),
          
             
               
      );
  }

  Widget _homeCard()
  {
   return Center(
     child: SizedBox(
      height:140,
      child:Stack(children: [
      Align(
        alignment:Alignment.bottomCenter,
        child:SvgPicture.asset('assets/icons/home_card_2.svg'),
      ),
      Align(
        alignment:Alignment.bottomRight,
        child:Image.asset('assets/images/card.png'),
      )
      ],),
      
     ),
   );
  }

  Widget _tabs()
  {
    return TabBar(
      controller:_tabController,
      labelColor:context.isDarkMode?Colors.white:Colors.black,
      indicatorColor:AppColor.primary,
      padding:const EdgeInsets.symmetric(
      vertical:40),
      tabs:const [
      Text('News',
      style:TextStyle(
        fontWeight:FontWeight.w500,
        fontSize:16,
      ),),
      Text('Videos',
      style:TextStyle(
        fontWeight:FontWeight.w500,
        fontSize:16,
      ),),
      Text('Artists',
      style:TextStyle(
        fontWeight:FontWeight.w500,
        fontSize:16,
      ),),
      Text('Podcasts',
      style:TextStyle(
        fontWeight:FontWeight.w500,
        fontSize:16,
      ),)
    ]);
  }
}