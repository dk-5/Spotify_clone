
import 'package:x_store/widgets/song/song.dart';

abstract class SongState{}

class SongStateInitial extends SongState{}
class SongStateLoading extends SongState{}

class SongStateLoaded extends SongState{
  final Iterable<SongModel> songs;
  SongStateLoaded({required this.songs});
}

class SongStateLoadFailure extends SongState{}

