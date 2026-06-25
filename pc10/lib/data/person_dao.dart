import 'package:floor/floor.dart';

import 'person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM person ORDER BY id DESC')
  Stream<List<Person>> watchAllPersons();

  @insert
  Future<void> insertPerson(Person person);
}
