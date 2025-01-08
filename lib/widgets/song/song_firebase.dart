
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:x_store/widgets/song/song.dart';

class SongFirebaseCloudStorage 
{
  final songs=FirebaseFirestore.instance.collection('Songs');

  Stream<Iterable<SongModel>> allSongs()=>songs.snapshots().map((event)=>event.docs
  .map((docs)=>SongModel.fromSnapshot(docs)));
}
