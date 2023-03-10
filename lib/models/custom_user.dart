import 'package:cloud_firestore/cloud_firestore.dart';

class CustomUser {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String pseudo;
  final String country;
  final String city;
  final String profession;
  final String favoriteSport;
  final List followers;
  final List following;
  final bool isProfesionalAthelete;

  const CustomUser({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.country,
    required this.city,
    required this.followers,
    required this.following,
    required this.isProfesionalAthelete,
    required this.profession,
    required this.favoriteSport,
    required this.pseudo,
  });

  static CustomUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return CustomUser(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      country: snapshot["country"],
      followers: snapshot["followers"],
      following: snapshot["following"],
      city: snapshot["city"],
      isProfesionalAthelete: snapshot['isProfesionalAthelete'],
      profession: snapshot['profession'],
      favoriteSport: snapshot["favoriteSport"],
      pseudo: snapshot["pseudo"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "country": country,
        "city": city,
        "followers": followers,
        "following": following,
        "isProfesionalAthelete": isProfesionalAthelete,
        "profession": profession,
        "favoriteSport": favoriteSport,
        "pseudo": pseudo,
      };
}
