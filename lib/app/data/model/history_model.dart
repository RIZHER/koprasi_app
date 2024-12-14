import 'dart:convert';

List<History> historyFromJson(String str) =>
    List<History>.from(json.decode(str).map((x) => History.fromJson(x)));

String historyToJson(List<History> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class History {
  int id;
  int idUser;
  String jenisTransaksi;
  int kodeTransaksi;
  int jumlahTransaksi;
  bool ststus;
  String kantor;

  History({
    required this.id,
    required this.idUser,
    required this.jenisTransaksi,
    required this.kodeTransaksi,
    required this.jumlahTransaksi,
    required this.ststus,
    required this.kantor,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        idUser: json["id_user"],
        jenisTransaksi: json["jenis_transaksi"],
        kodeTransaksi: json["kode_transaksi"],
        jumlahTransaksi: json["jumlah_transaksi"],
        ststus: json["ststus"],
        kantor: json["kantor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "jenis_transaksi": jenisTransaksi,
        "kode_transaksi": kodeTransaksi,
        "jumlah_transaksi": jumlahTransaksi,
        "ststus": ststus,
        "kantor": kantor,
      };
}
