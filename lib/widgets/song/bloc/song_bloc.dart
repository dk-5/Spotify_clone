import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_store/widgets/song/bloc/song_event.dart';
import 'package:x_store/widgets/song/bloc/song_state.dart';
import 'package:x_store/widgets/song/song_firebase.dart';


class SongBloc extends Bloc<SongEvent,SongBloc>{
  final SongFirebaseCloudStorage firebaseCloudStorage;

  SongBloc(this.firebaseCloudStorage):super(SongStateInitial() as SongBloc){
    on<SongEventLoad>((event,emit) async {
     emit(SongStateLoading() as SongBloc);
     try {
      final songs= firebaseCloudStorage.allSongs();
      emit(SongStateLoaded(songs: await songs.expand((iterable)=> iterable).toList()) as SongBloc);
     }catch(e)
     {
      emit(SongStateLoadFailure() as SongBloc);
     }
    });
  }


}
  


