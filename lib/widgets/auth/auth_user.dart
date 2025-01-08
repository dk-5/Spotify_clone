

import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
final String? name;
final String id;
final String email;

  const AuthUser({required this.id, required this.email,required this.name});

  factory AuthUser.fromFirebase(User user)=>AuthUser(id: user.uid, email: user.email!,name:user.displayName);

}