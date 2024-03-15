class UserModel {
  final int id;
  final String userName;
  final String name;
  final String state;
  final String avatarUrl;
  UserModel({
    required this.avatarUrl,
    required this.id,
    required this.name,
    required this.state,
    required this.userName
});

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
        avatarUrl: json["avatar_url"] as String? ?? "",
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? "",
        state: json["state"] as String? ?? "",
        userName: json["username"] as String? ?? ""
    );
  }
}
