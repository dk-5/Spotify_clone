import 'package:cloud_firestore/cloud_firestore.dart';

class SongModel 
{
  String? title;
  String? artist;
  String? duration;
  Timestamp? publisher;

  SongModel({required this.title,
  required this.artist,
  required this.duration,
  required this.publisher,
  });

  SongModel.fromSnapshot(QueryDocumentSnapshot<Map<String,dynamic>> snapshot):
    title=snapshot.data()['title'],
    artist=snapshot.data()['artist'],
    duration=snapshot.data()['Duration'],
    publisher=snapshot.data()['Publish'];
  
}