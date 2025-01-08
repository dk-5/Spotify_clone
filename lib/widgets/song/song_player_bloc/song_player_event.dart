abstract class SongEvent {}

class LoadSongEvent extends SongEvent {
  final String songUrl;

  LoadSongEvent(this.songUrl);
}

class UpdatePositionEvent extends SongEvent {
  final Duration position;

  UpdatePositionEvent(this.position);
}

class PlayPauseSongEvent extends SongEvent {}