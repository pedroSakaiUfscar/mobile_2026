import 'package:flutter/foundation.dart';

import '../data/app_database.dart';
import '../data/person.dart';
import '../data/person_dao.dart';

class PersonViewModel extends ChangeNotifier {
  PersonViewModel(this._personDao);

  final PersonDao _personDao;

  late final Stream<List<Person>> personsStream =
      _personDao.watchAllPersons();

  Future<void> addPerson(String name, int age) async {
    await _personDao.insertPerson(Person(name: name, age: age));
  }

  static Future<PersonViewModel> create() async {
    final database = await $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .build();
    return PersonViewModel(database.personDao);
  }
}
