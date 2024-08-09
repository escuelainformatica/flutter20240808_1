class Usuario {
  String? userName;
  String? password;
  String? level;

  Usuario({this.userName, this.password, this.level});

  Usuario.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    password = json['Password'];
    level = json['Level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    data['Level'] = this.level;
    return data;
  }
}