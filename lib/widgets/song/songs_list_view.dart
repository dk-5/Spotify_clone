import 'package:flutter/material.dart';
import 'package:x_store/helpers/is_dark_mode.dart';
import 'package:x_store/utils/theme/app_color.dart';
import 'package:x_store/views/song_player_view.dart';
import 'package:x_store/widgets/song/song.dart';
import 'package:x_store/widgets/song/song_firebase.dart';
import 'package:x_store/widgets/song/url/app_urls.dart';

class SongsListView extends StatefulWidget {
 
  const SongsListView({super.key});

  @override
  State<SongsListView> createState() => _SongsListViewState();
}

class _SongsListViewState extends State<SongsListView>{

  late final SongFirebaseCloudStorage firebaseCloudStorage;
  

  @override
  void initState()
  {
    
    firebaseCloudStorage=SongFirebaseCloudStorage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:firebaseCloudStorage.allSongs(), 
      builder:(context,snapshot){
        switch(snapshot.connectionState)
        {
          case ConnectionState.waiting:
          case ConnectionState.active:
          if(snapshot.hasData)
          {
            final allSongs=snapshot.data as Iterable<SongModel>; 
            return _songs(allSongs);
          
          }
          else 
          {
            return  const Center(child:CircularProgressIndicator());
          }
          default:
           return const Center(child:CircularProgressIndicator());
        }
      }
    
    );
  }
}


Widget _songs(Iterable<SongModel> song)
{  
  List<SongModel> songs=song.toList();
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    shrinkWrap:true,
  itemBuilder:(context,index){
    final songsArtist=songs[index].artist??'';
    final songsTitle=songs[index].title??'Sajni';
    return GestureDetector(
      onTap:()
      {
        Navigator.push(context,
      MaterialPageRoute(builder:(BuildContext context)=>SongPlayerView(songModel:songs[index])));
      },
      child: SizedBox(
          width:160,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(30),
                  image:DecorationImage(
                    fit:BoxFit.cover,
                    image:NetworkImage(
                      AppUrls.firebaseUrl +songsArtist+'-'+songsTitle+'.jpg?'+ AppUrls.mediaAlt
                    ) 
                  )
                  ),
                  child:Align(
                    alignment:Alignment.bottomRight,
                    child:Container(
                      height:40,
                      width:40,
                      transform:Matrix4.translationValues(10, 10, 0),
                      child:Icon(Icons.play_arrow_rounded,
                      color:context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555),
                      ),
                      decoration:BoxDecoration(
                        shape:BoxShape.circle,
                        color:context.isDarkMode?AppColor.darkgrey:const Color(0xffE6E6E6)
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height:10,),
              Text(
                songsTitle,
                style:const TextStyle(
                  fontWeight:FontWeight.w600,
                  fontSize:16
                ),
              ),
              const SizedBox(height:5,),
              Text(
                songsArtist,
                style:const TextStyle(
                  fontWeight:FontWeight.w500,
                  fontSize:12
                ),)
          
            ],
          ),
      ),
    );
  }, 
  itemCount:song.length,
  separatorBuilder: (context,index) => const SizedBox(width: 14,),);
}