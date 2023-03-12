import 'package:cloud_firestore/cloud_firestore.dart';

class CustomUser {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String pseudo;
  final String country;
  final String state;
  final String profession;
  final String favoriteSport;
  final String sportingProfile;
  final List followers;
  final List following;
  final bool isProfesionalAthelete;

  const CustomUser({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.country,
    required this.state,
    required this.followers,
    required this.following,
    required this.isProfesionalAthelete,
    required this.profession,
    required this.favoriteSport,
    required this.pseudo,
    required this.sportingProfile,
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
      state: snapshot["state"],
      isProfesionalAthelete: snapshot['isProfesionalAthelete'],
      profession: snapshot['profession'],
      favoriteSport: snapshot["favoriteSport"],
      pseudo: snapshot["pseudo"],
      sportingProfile: snapshot["sportingProfile"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "country": country,
        "state": state,
        "followers": followers,
        "following": following,
        "isProfesionalAthelete": isProfesionalAthelete,
        "profession": profession,
        "favoriteSport": favoriteSport,
        "pseudo": pseudo,
        "sportingProfile": sportingProfile,
      };
}
