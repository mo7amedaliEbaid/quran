class QuranSurahModel {
  int? id;
  String? name;
  String? transliteration;
  String? type;
  int? totalVerses;
  List<Verses>? verses;

  QuranSurahModel(
      {this.id,
      this.name,
      this.transliteration,
      this.type,
      this.totalVerses,
      this.verses});

  QuranSurahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    transliteration = json['transliteration'];
    type = json['type'];
    totalVerses = json['total_verses'];
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['transliteration'] = transliteration;
    data['type'] = type;
    data['total_verses'] = totalVerses;
    if (verses != null) {
      data['verses'] = verses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Verses {
  int? id;
  String? text;
  String? transliteration;

  Verses({this.id, this.text, this.transliteration});

  Verses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    transliteration = json['transliteration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['transliteration'] = transliteration;
    return data;
  }
}
