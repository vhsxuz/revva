import 'package:get/get.dart';
import 'package:revva/models/user_model.dart';
import 'package:revva/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final AuthService _authService = AuthService();

  var user = Rxn<UserModel>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  Future<void> fetchUser() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final firebaseUid = prefs.getString('firebase_uid');

      if (firebaseUid != null) {
        final fetchedUser = await _authService.getUserByFirebaseUid(
          firebaseUid,
        );
        user.value = fetchedUser;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
