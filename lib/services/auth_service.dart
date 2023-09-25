import 'package:firebase_auth/firebase_auth.dart';

import '../utils/utils.dart';
import 'fb_service.dart';

final _auth = FirebaseAuth.instance;
final auth = AuthService.instance;

class AuthService {
  AuthService._();

  static AuthService instance = AuthService._();

  Stream<User?> stream() => _auth.userChanges();

  String get tel => _auth.currentUser!.email!.split('@').first.substring(3);

  Future<String?> sign(String phone, String password) async {
    final data = await fb.speStudent(phone);
    if (data.tel == 'fake') {
      return "myErrors.wrongTel";
    } else if (data.password == null) {
      data.password = password;
      await fb.saveStudent(data);
      return await signUp(phone, password, "student");
    } else if (data.password == password) {
      return await signIn(phone, password);
    } else {
      return myErrors.wrongPassword;
    }
  }

  Future<String?> signIn(String tel, String password) async {
    try {
      print('998$tel@student.com');
      print(password);
      await _auth.signInWithEmailAndPassword(
        email: '998$tel@student.com',
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return myErrors.userNotFound;
      } else if (e.code == 'wrong-password') {
        return myErrors.wrongPassword;
      } else {
        return myErrors.unknownError;
      }
    } catch (e) {
      print('signIn: $e');
      return myErrors.unknownError;
    }
  }

  Future<String?> signUp(String tel, String password, String end) async {
    try {
      print('998$tel@$end.com');
      print(password);
      await _auth.createUserWithEmailAndPassword(
        email: '998$tel@$end.com',
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return myErrors.userNotFound;
      } else if (e.code == 'wrong-password') {
        return myErrors.wrongPassword;
      } else {
        return myErrors.unknownError;
      }
    } catch (e) {
      print('signIn: $e');
      return myErrors.unknownError;
    }
  }

  void signOut() {
    _auth.signOut();
  }
}
