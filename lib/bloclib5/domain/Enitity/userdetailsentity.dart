class Userdetailsentity {
  int success;
  String message;
  List<Datum> data;

  Userdetailsentity({
    required this.success,
    required this.message,
    required this.data,
  });

}

class Datum {
  DateTime createdAt;
  String name;
  String avatar;
  String id;
  Details details;

  Datum({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.id,
    required this.details,
  });
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    createdAt: DateTime.parse(json["createdAt"]),
    name: json["name"],
    avatar: json["avatar"],
    id: json["id"],
    details: Details.fromJson(json["details"]),
  );

}

class Details {
  String email;
  String phone;
  String address;

  Details({
    required this.email,
    required this.phone,
    required this.address,
  });
  factory Details.fromJson(Map<String, dynamic> json) => Details(
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
  );

}
