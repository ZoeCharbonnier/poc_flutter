import 'dart:convert';

List<Dossier> dossierFromJson(String str) => List<Dossier>.from(json.decode(str).map((x) => Dossier.fromJson(x)));

String dossierToJson(List<Dossier> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dossier {
  Dossier({
    this.code,
    this.buildingTypeId,
    this.buildingTypeDescription,
    this.street,
    this.houseNumber,
    this.postalCode,
    this.city,
    this.isInventoryUnoccupiedNotRemoved,
  });

  String code;
  String buildingTypeId;
  BuildingTypeDescription buildingTypeDescription;
  String street;
  String houseNumber;
  String postalCode;
  String city;
  bool isInventoryUnoccupiedNotRemoved;

  factory Dossier.fromJson(Map<String, dynamic> json) => Dossier(
    code: json["Code"],
    buildingTypeId: json["BuildingTypeId"],
    buildingTypeDescription: buildingTypeDescriptionValues.map[json["BuildingTypeDescription"]],
    street: json["Street"],
    houseNumber: json["HouseNumber"],
    postalCode: json["PostalCode"],
    city: json["City"],
    isInventoryUnoccupiedNotRemoved: json["IsInventoryUnoccupiedNotRemoved"],
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "BuildingTypeId": buildingTypeId,
    "BuildingTypeDescription": buildingTypeDescriptionValues.reverse[buildingTypeDescription],
    "Street": street,
    "HouseNumber": houseNumber,
    "PostalCode": postalCode,
    "City": city,
    "IsInventoryUnoccupiedNotRemoved": isInventoryUnoccupiedNotRemoved,
  };
}

enum BuildingTypeDescription { ZELFSTANDIGE_WONING, GEBOUW_MET_MEERDERE_ENTITEITEN, ZELFSTANDIG_GEBOUW_MET_NIET_WOONFUNCTIE }

final buildingTypeDescriptionValues = EnumValues({
  "Gebouw met meerdere entiteiten": BuildingTypeDescription.GEBOUW_MET_MEERDERE_ENTITEITEN,
  "Zelfstandige woning": BuildingTypeDescription.ZELFSTANDIGE_WONING,
  "Zelfstandig gebouw met niet-woonfunctie": BuildingTypeDescription.ZELFSTANDIG_GEBOUW_MET_NIET_WOONFUNCTIE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
