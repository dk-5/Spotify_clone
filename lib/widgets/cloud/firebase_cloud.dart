
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudStorage 
{
  final user=FirebaseFirestore.instance.collection('Users');
  
  Future<void> userDetails({required String name,required String email})async{
    await user.add({
      'name':name,
      'email':email,
    }
      
    );
  }
}