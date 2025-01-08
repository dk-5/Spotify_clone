import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:x_store/utils/theme/app_color.dart';
import 'package:x_store/widgets/app_bar.dart';
import 'package:x_store/widgets/song/song.dart';
import 'package:x_store/widgets/song/song_player_bloc/song_player_bloc.dart';
import 'package:x_store/widgets/song/song_player_bloc/song_player_event.dart';
import 'package:x_store/widgets/song/song_player_bloc/song_player_state.dart';
import 'package:x_store/widgets/song/url/app_urls.dart';

class SongPlayerView extends StatelessWidget {
  final SongModel songModel;
  const SongPlayerView({super.key, required this.songModel});
  

  @override
  Widget build(BuildContext context) {
    final songsArtist=songModel.artist??'';
    final songsTitle=songModel.title??'Sajni';
   final String songUrl;
   songUrl=AppUrls.songfirebaseUrl +songsArtist+'-'+songsTitle+'.mp3?'+ AppUrls.mediaAlt;
   print(songUrl);
    return  Scaffold(
      appBar:BasicAppBar(
        title:const Text('Now Playing'),
        action:IconButton(onPressed:(){},
        icon:const Icon(Icons.more_vert_rounded),
        ),
      ),
      body:BlocProvider(
        create: (context) => SongPlayerBloc(AudioPlayer())..add(LoadSongEvent(songUrl)),
        child: SingleChildScrollView(
      
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical:16,
                  horizontal:16
                ),
                child: Column(
                  children: [
                    _song(context),
                    const SizedBox(height:20,),
                    _songDetail(),
                    const SizedBox(height:30,),
                    _songPlayer(context),
                  ],
                ),
              ),
            ),
      ),
    );
  }


  Widget _song(BuildContext context)
  {
    final songsArtist=songModel.artist??'';
    final songsTitle=songModel.title??'Sajni';
    return  Container(
        height:MediaQuery.of(context).size.height/2,
        decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(30),
          image:DecorationImage(image:
          NetworkImage(
            AppUrls.firebaseUrl +songsArtist+'-'+songsTitle+'.jpg?'+ AppUrls.mediaAlt
          ),
          fit:BoxFit.cover 
          )
        ),
    );
  }

  Widget _songDetail()
  {
    final songsArtist=songModel.artist??'';
    final songsTitle=songModel.title??'Sajni';
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
           children: [
            Text(
              songsTitle,
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                          fontSize: 22
              ),
            ),
            const SizedBox(height:5,),
            Text(songsArtist,
            style:const TextStyle(
              fontWeight:FontWeight.w400,
              fontSize:16, 
            ),)


           ],
         ),
         IconButton(onPressed:(){}, icon:const Icon(Icons.favorite_outline_outlined,
         size:30,
         color:AppColor.darkgrey,
         ))
      ],
    );
  }

  Widget _songPlayer(BuildContext context)
  {
    return BlocBuilder<SongPlayerBloc,SongPlayerState>(builder:(context,state)
    {
      if(state is SongLoadingState)
      {
        return const Center(child: CircularProgressIndicator());
      }
      else if(state is SongPlayingState)
      {
         return Column(
         children: [
          Slider(
            value:state.currentPosition.inSeconds.toDouble(),
            max: state.duration.inSeconds.toDouble(),
            min:0,
            onChanged: (value) {},

            
          ),
          const SizedBox(height:20,),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatDuration(state.currentPosition)
              ),
              Text(
                formatDuration(state.duration)
              )
            ],
          ),
          const SizedBox(height:20,),
          GestureDetector(
            onTap:()
            {
              context.read<SongPlayerBloc>().add(PlayPauseSongEvent());
            },
            child: Container(
              height:60,
              width:60,
              decoration:const BoxDecoration(
                color:AppColor.primary,
                shape:BoxShape.circle,
                ),
                child:Icon(
                  context.read<SongPlayerBloc>().audioPlayer.playing?Icons.pause:Icons.play_arrow
                ),
            ),
      
          ),
         ],
         
         );
      }
        else 
        {
          return Container();
          }
      

    });
  }
String formatDuration(Duration duration)
{
final minutes=duration.inMinutes.remainder(60);
final seconds=duration.inSeconds.remainder(60);
return '${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
}
}