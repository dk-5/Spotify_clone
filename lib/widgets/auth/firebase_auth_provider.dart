import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth,FirebaseAuthException;
import 'package:x_store/widgets/auth/auth_execeptions.dart';
import 'package:x_store/widgets/auth/auth_provider.dart';
import 'package:x_store/widgets/auth/auth_user.dart';
import 'package:x_store/widgets/cloud/firebase_cloud.dart';

class FirebaseAuthProvider implements AuthProvider{
@override
  Future<AuthUser> createUser({required String name,required String email, required String password})async{
    try 
  {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email, 
    password: password);
    final user=currentUser;
    FirebaseCloudStorage().userDetails(name:name, email: email);
    if(user!=null)
    {
      return user;
    }
    else 
    {
      throw UserNotLoggedInAuthException();
    }
  }on FirebaseAuthException catch(e)
  {
    if(e.code=='weak-password')
                {
                 throw WeakPasswordAuthException();
                }
                else if(e.code == 'email-already-in-use')
                {
                  throw EmailAlreadyInUserAuthException();
                }
                else if(e.code=='invalid-email')
                {
                  throw InvalidEmailAuthException();
                }
                else 
                {
                  throw GenericAuthException();
                }
   } catch(_)
   {
    throw GenericAuthException();
   }
  }

  @override
  AuthUser? get currentUser {
    final user=FirebaseAuth.instance.currentUser;
    if(user!=null)
    {
      return AuthUser.fromFirebase(user);
    }
    else 
    {
      return null;
    }

  }

  @override
  Future<AuthUser> logIn({required String email, required String password})async {
    try 
   {
   await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
   final user=currentUser;
   if(user!=null)
   {
    return user;
   }
   else 
   {
    throw UserNotLoggedInAuthException();
   }
   }on FirebaseAuthException catch(e)
   {
    if(e.code=='user-not-found')
                  {
                    throw UserNotFoundAuthException();
                  }
                  else if(e.code=='invalid-credential')
                  {
                    throw WrongPasswordAuthException();
                  }
                  else 
                  {
                    throw GenericAuthException();
                  }
    
    }
    catch(_){
     throw GenericAuthException();
    }
  }
}
