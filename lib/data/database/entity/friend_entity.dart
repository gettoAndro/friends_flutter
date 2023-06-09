const String idFieldName = "id";
const String nameFieldName = "name";
const String emailFieldName = "email";
const String phoneFieldName = "phone";
const String avatarFieldName = "avatar";

class FriendEntity {
  int? id;
  String name;
  String email;
  String phone;
  String avatar;

  FriendEntity(
      {required this.name,
      required this.email,
      required this.phone,
      required this.avatar});

  Map<String, Object?> toMap() {
    var map = <String, Object?> {
      nameFieldName: name,
      emailFieldName: email,
      phoneFieldName: phone,
      avatarFieldName: avatar,
    };

    if (id != null) {
      map[idFieldName] = id;
    }

    return map;
  }

  FriendEntity fromMap(Map map) {
    var friend = FriendEntity(
        name: map[nameFieldName],
        email: map[emailFieldName],
        phone: map[phoneFieldName],
        avatar: map[avatarFieldName]);

    friend.id = map[idFieldName];

    return friend;
  }
}
