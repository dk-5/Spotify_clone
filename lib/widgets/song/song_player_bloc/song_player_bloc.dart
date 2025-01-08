

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:x_store/widgets/song/song_player_bloc/song_player_event.dart';
import 'package:x_store/widgets/song/song_player_bloc/song_player_state.dart';

class SongPlayerBloc extends Bloc<SongEvent,SongPlayerState>{

    AudioPlayer audioPlayer=AudioPlayer();
    
  SongPlayerBloc(this.audioPlayer):super(SongIntial()){
    on<LoadSongEvent>(_onLoadSong);
    on<PlayPauseSongEvent>(_onPlayPauseSong);
    on<UpdatePositionEvent>(_onUpdatePosition);
  }

  Future<void> _onLoadSong(LoadSongEvent event,Emitter<SongPlayerState> emit)async{
    emit(SongLoadingState());
    try {
      // Load the song from the provided URL
      await audioPlayer.setUrl(event.songUrl);

      // Get the duration of the song
      Duration? duration = audioPlayer.duration;

      emit(SongPlayingState(audioPlayer.position,duration??Duration.zero));
    } catch (e) {
      emit(SongIntial()); // Handle errors more gracefully if needed
    }
  }
//SongLoadedState(event.songUrl, duration ?? Duration.zero)
   void _onPlayPauseSong(PlayPauseSongEvent event, Emitter<SongPlayerState> emit) {
    if (audioPlayer.playing) {
      audioPlayer.pause();
      emit(SongPaused());
    } else {
      audioPlayer.play();
      emit(SongPlayingState(audioPlayer.position, audioPlayer.duration ?? Duration.zero));
      audioPlayer.positionStream.listen((position) {
        add(UpdatePositionEvent(position));
      });
    }
  }

  void _onUpdatePosition(UpdatePositionEvent event, Emitter<SongPlayerState> emit) {
    emit(SongPlayingState(event.position, audioPlayer.duration ?? Duration.zero));
  }
   @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}