import 'package:shared_preference/Model/model.dart';

class PersonModel extends Model {
  static String table = 'person';

  int id;
  String firstName;
  String lastName;

  PersonModel({
    this.id,
    this.firstName,
    this.lastName,
  });
  static PersonModel fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'],
      firstName: map['firstName'].toString(),
      lastName: map['lastName'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
