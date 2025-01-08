abstract class SongPlayerState{}
class SongIntial extends SongPlayerState{}
class SongLoadingState extends SongPlayerState{}

class SongLoadedState extends SongPlayerState{
  final String songUrl;
  final Duration duration;

  SongLoadedState(this.songUrl, this.duration);
}
class SongPlayingState extends SongPlayerState {
  final Duration currentPosition;
  final Duration duration;


  SongPlayingState(this.currentPosition, this.duration);
} 

class SongPaused extends SongPlayerState {}
