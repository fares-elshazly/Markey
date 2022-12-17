class RegisterDTO {
  final String name;
  final String email;
  final String password;
  final String referralCode;
  final List<int> tagsIds;

  RegisterDTO({
    required this.name,
    required this.email,
    required this.password,
    required this.referralCode,
    required this.tagsIds,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "referral_code": referralCode,
        "tags": tagsIds,
        "gender": 1,
        "status": 1,
      };
}
