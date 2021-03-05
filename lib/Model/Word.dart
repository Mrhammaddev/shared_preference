import 'package:shared_preference/Model/model.dart';

class WordModel extends Model {
  static String table = 'words';

  int id;
  String words;
  dynamic translation;

  WordModel({
    this.id,
    this.words,
    this.translation,
  });

  static WordModel fromMap(Map<String, dynamic> map) {
    return WordModel(
        id: map['id'],
        words: map['words'].toString(),
        translation: map['translation']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'words': words,
      'translation': translation,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
