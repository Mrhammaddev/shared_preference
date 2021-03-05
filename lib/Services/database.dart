import 'package:shared_preference/Model/Video.dart';
import 'package:shared_preference/Model/Word.dart';
import 'package:shared_preference/dbhelper.dart';

class DBService {
  Future<bool> addVideo(PersonModel model) async {
    await DB.init();
    bool isSaved = false;
    if (model != null) {
      int inserted = await DB.insert(PersonModel.table, model);
      isSaved = inserted == 1 ? true : false;
    }
    return isSaved;
  }

  Future<bool> updateVideo(PersonModel model) async {
    await DB.init();
    bool isSaved = false;
    if (model != null) {
      int inserted = await DB.update(PersonModel.table, model);
      isSaved = inserted == 1 ? true : false;
    }
    return isSaved;
  }

  Future<List<PersonModel>> getVideos() async {
    await DB.init();
    List<Map<String, dynamic>> video = await DB.query(PersonModel.table);
    return video.map((item) => newMethod(item)).toList();
  }

  newMethod(item) => PersonModel.fromMap(item);

  Future<bool> deleteVideo(PersonModel model) async {
    await DB.init();
    bool isSaved = false;
    if (model != null) {
      int inserted = await DB.delete(PersonModel.table, model);
      isSaved = inserted == 1 ? true : false;
    }
    return isSaved;
  }

  // Future<bool> addWords(PersonModel model) async {
  //   await DB.init();
  //   bool isSaved = false;
  //   if (model != null) {
  //     int inserted = await DB.insert(PersonModel.table, model);
  //     isSaved = inserted == 1 ? true : false;
  //   }
  //   return isSaved;
  // }

  // Future<List<WordModel>> getWords() async {
  //   await DB.init();
  //   List<Map<String, dynamic>> wordsfromdb = await DB.query(WordModel.table);
  //   return wordsfromdb.map((item) => WordModel.fromMap(item)).toList();
  // }

  // Future<bool> deleteWord(PersonModel model) async {
  //   await DB.init();
  //   bool isSaved = false;
  //   if (model != null) {
  //     int inserted = await DB.delete(PersonModel.table, model);
  //     isSaved = inserted == 1 ? true : false;
  //   }
  //   return isSaved;
  // }
}
