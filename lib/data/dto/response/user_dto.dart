class UserDTO {
  NameDTO name;
  String email;
  String phone;
  PictureDTO picture;

  UserDTO(
      {required this.name,
      required this.email,
      required this.phone,
      required this.picture});

  static UserDTO fromJson(dynamic user) => UserDTO(
      name: NameDTO.fromJson(user["name"]),
      email: user["email"],
      phone: user["phone"],
      picture: PictureDTO.fromJson(user["picture"]));
}

class NameDTO {
  String title;
  String first;
  String last;

  NameDTO({required this.title, required this.first, required this.last});

  static NameDTO fromJson(dynamic name) =>
      NameDTO(title: name["title"], first: name["first"], last: name["last"]);

  String fullName() => "$title $first $last";
}

class PictureDTO {
  String large;
  String medium;
  String thumbnail;

  PictureDTO(
      {required this.large, required this.medium, required this.thumbnail});

  static PictureDTO fromJson(dynamic picture) => PictureDTO(
      large: picture["large"],
      medium: picture["medium"],
      thumbnail: picture["thumbnail"]);
}
