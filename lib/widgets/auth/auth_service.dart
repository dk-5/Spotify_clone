import 'package:x_store/widgets/auth/auth_provider.dart';
import 'package:x_store/widgets/auth/auth_user.dart';
import 'package:x_store/widgets/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider
{
final AuthProvider provider;
const AuthService( this.provider);
  factory AuthService.firebase()=>AuthService(FirebaseAuthProvider());
  @override
  Future<AuthUser> createUser({required String email, required String password,required String name})=>provider.createUser(email: email, password: password,name:name);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({required String email, required String password})=>provider.logIn(email: email, password: password);
  
}