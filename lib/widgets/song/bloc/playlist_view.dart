import 'package:flutter/material.dart';
import 'package:x_store/helpers/is_dark_mode.dart';
import 'package:x_store/utils/theme/app_color.dart';
import 'package:x_store/views/song_player_view.dart';
import 'package:x_store/widgets/song/song.dart';
import 'package:x_store/widgets/song/song_firebase.dart';

class PlaylistView extends StatefulWidget {
  const PlaylistView({super.key});

  @override
  State<PlaylistView> createState() => _PlaylistListViewState();
}

class _PlaylistListViewState extends State<PlaylistView>{

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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal:16,
                vertical:40),
                child: Column(
                 children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Playlist',
                      style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16)
                  ),
                  Text(
                            'See More',
                             style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xffC6C6C6)
                            ),
                          ),
                  ],),
                  const SizedBox(height: 20,),
                 _playlist(allSongs)
                 ],
                ),
              );
      
              
              
            
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

Widget _playlist(Iterable<SongModel> song)
{
List<SongModel> songs=song.toList();
  return ListView.separated(
    shrinkWrap:true,
    itemBuilder:(context,index){
    final songsArtist=songs[index].artist??'';
    final songsTitle=songs[index].title??'Sajni';
    return GestureDetector(onTap:(){
      Navigator.push(context,
      MaterialPageRoute(builder:(BuildContext context)=>SongPlayerView(songModel:songs[index])));
      
    },
    child:Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
         Container(
          height:45,
          width:45,
          decoration:BoxDecoration(
            shape:BoxShape.circle,
            color:context.isDarkMode ? AppColor.darkgrey : const Color(0xffE6E6E6)
          ),
          child:Icon(
            Icons.play_arrow_rounded,
            color: context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555) ,
          ),
         ),
         const SizedBox(width:15,),
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
           children: [
            Text(
              songsTitle,
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                          fontSize: 16
              ),
            ),
            const SizedBox(height:5,),
            Text(songsArtist,
            style:const TextStyle(
              fontWeight:FontWeight.w400,
              fontSize:11, 
            ),)


           ],
         )

        ],),
        Row(
          children: [
            Text(songs[index].duration??'',
            ),
            const SizedBox(width:20,),
            IconButton(onPressed:(){}, icon:const Icon(Icons.favorite_outline_outlined,
         size:20,
         color:AppColor.darkgrey,))
          ],
        )
      ],
      
      ) ,
    
      );

    
  },
  separatorBuilder: (context,index) => const SizedBox(height: 20,),
  itemCount:songs.length,
  );
}