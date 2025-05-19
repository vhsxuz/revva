import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:revva/models/user_model.dart';
import 'package:revva/routes/route.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final Dio _dio = Dio();
  final String _baseUrl = dotenv.env['HOST']!;

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        // Simpan Firebase UID ke SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('firebase_uid', credential.user!.uid);
        Get.offAllNamed(Routes.HOME);
        Get.snackbar(
          'Login Success',
          'Welcome Back!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        return credential.user;
      }

      throw Exception();
    } on FirebaseAuthException {
      Get.snackbar(
        'Login Failed',
        'Email or Password is incorrect',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled sign in
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        await _registerToBackend(
          firebaseUid: user.uid,
          name: user.displayName ?? 'No Name',
          email: user.email ?? '',
        );

        // Simpan Firebase UID ke SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('firebase_uid', user.uid);

        Get.snackbar(
          'Login Success',
          'Welcome Back!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.offAllNamed(Routes.HOME);
      }

      return user;
    } catch (e) {
      Get.snackbar(
        'Google Sign In Failed',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user != null) {
        await _registerToBackend(
          firebaseUid: user.uid,
          name: name,
          email: email,
        );

        Get.snackbar(
          'Registrasi Success',
          'Yeay!, account is created',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.offAllNamed(Routes.LOGIN);
        return user;
      }

      throw Exception();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Weak Password',
          'Password is too weak',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Email Already In Use',
          'Email is already in use',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> _registerToBackend({
    required String firebaseUid,
    required String name,
    required String email,
  }) async {
    final url = '$_baseUrl/api/v1/user/register';

    try {
      final response = await _dio.post(
        url,
        data: {'firebase_uid': firebaseUid, 'name': name, 'email': email},
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Register API failed: ${response.data}');
      }
    } on DioException catch (e) {
      Get.snackbar(
        'Register API Failed',
        e.response?.data.toString() ?? e.message ?? 'Unknown error occurred',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<UserModel?> getUserByFirebaseUid(String firebaseUid) async {
    final url = '$_baseUrl/api/v1/user/firebase/$firebaseUid';

    try {
      final prefs = await SharedPreferences.getInstance();
      final firebaseUid = prefs.getString('firebase_uid');

      if (firebaseUid == null) return null;
      final response = await _dio.get(url);

      if (response.statusCode == 200 && response.data['data'] != null) {
        return UserModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to fetch user data');
      }
    } on DioException catch (e) {
      Get.snackbar(
        'Fetch User Failed',
        e.response?.data.toString() ?? e.message ?? 'Unknown error',
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      return null;
    }
  }
}
