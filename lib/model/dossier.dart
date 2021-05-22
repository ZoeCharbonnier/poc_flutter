class Dossier {
  final String code;
  final String street;
  final String houseNumber;
  final String city;

  Dossier({this.code, this.street, this.houseNumber, this.city});

  factory Dossier.fromJson(Map<String, dynamic> json) {
    return Dossier(
      code: json['code'],
      street: json['street'],
      houseNumber: json['houseNumber'],
      city: json['city'],
    );
  }


  Map<String, dynamic> toJson() => {
    'code': code,
    'street': street,
    'houseNumber': houseNumber,
    'city': city,
    };

}