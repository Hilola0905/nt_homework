class CountryModel{
  final Map<String,dynamic> flags;
  final String status;

  CountryModel({
    required this.flags,
    required this.status
});
  factory CountryModel.fromJson(Map<String,dynamic> json){
    return CountryModel(
        flags: json["flags"] as Map<String,dynamic>? ?? {},
        status: json["status"] as String? ?? "",
    );
  }
}