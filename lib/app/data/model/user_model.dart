import 'dart:convert';

List<Login> loginFromJson(String str) =>
    List<Login>.from(json.decode(str).map((x) => Login.fromJson(x)));

String loginToJson(List<Login> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Login {
  int id;
  String username;
  String password;
  int noKtp;
  String namaLengkap;
  String namaIbu;
  String alamat;
  int saldo;
  String role;

  Login({
    required this.id,
    required this.username,
    required this.password,
    required this.noKtp,
    required this.namaLengkap,
    required this.namaIbu,
    required this.alamat,
    required this.saldo,
    required this.role,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        noKtp: json["no_ktp"],
        namaLengkap: json["nama_lengkap"],
        namaIbu: json["nama_ibu"],
        alamat: json["alamat"],
        saldo: json["saldo"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "no_ktp": noKtp,
        "nama_lengkap": namaLengkap,
        "nama_ibu": namaIbu,
        "alamat": alamat,
        "saldo": saldo,
        "role": role,
      };
}
