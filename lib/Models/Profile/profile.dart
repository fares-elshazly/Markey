import 'previous_work.dart';
import 'certificate.dart';
import 'package.dart';
import '/Models/Tips/tip.dart';

List<Profile> profilesFromJson(List json) =>
    List<Profile>.from(json.map((x) => Profile.fromJson(x)));

class Profile {
  final int id;
  final String name;
  final String email;
  final String? avatar;
  final String gender;
  final String location;
  final String description;
  final String username;
  final String qrCode;
  final bool isExpert;
  final List<PreviousWork> previousWorks;
  final List<Certificate> certificates;
  final List<Package> packages;
  final List<Tip> tips;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.gender,
    required this.location,
    required this.description,
    required this.username,
    required this.qrCode,
    required this.isExpert,
    required this.previousWorks,
    required this.certificates,
    required this.packages,
    required this.tips,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        gender: json["gender"],
        location: json["location"],
        description: json["description"],
        username: json["username"],
        qrCode: json["qr_code"],
        isExpert: json["type"] == "expert",
        previousWorks: previousWorksFromJson(json["previous_work"]["data"]),
        certificates: certificatesFromJson(json["certificates"]["data"]),
        packages: packagesFromJson(json["packages"]["data"]),
        tips: tipsFromJson(json["shared_tips"]["data"]),
      );
}
