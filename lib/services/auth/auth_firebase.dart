// Detener la aplicación e instalar el paquete firebase_auth
// dart pub add firebase_auth
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Devolver los datos del usuario actual en sesión
  User? get user => _auth.currentUser;
  User? getUser() {
    return _auth.currentUser;
  }

  // Crear cuenta con email y password
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // Iniciar sesión con email y password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // Cerrar sesion
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
