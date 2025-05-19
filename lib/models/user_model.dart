class UserModel {
  final String id;
  final String firebase_uid;
  final String email;
  final String name;
  final String role;
  final String referral_code;

  UserModel({
    required this.id,
    required this.firebase_uid,
    required this.email,
    required this.name,
    required this.role,
    required this.referral_code,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    firebase_uid: json['firebase_uid'],
    name: json['name'],
    email: json['email'],
    role: json['role'],
    referral_code: json['referral_code'],
  );
}
