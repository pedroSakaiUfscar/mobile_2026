import 'package:floor/floor.dart';

@Entity(tableName: 'person')
class Person {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final int age;

  Person({
    this.id,
    required this.name,
    required this.age,
  });
}
