import 'package:isar/isar.dart';


part 'user.g.dart';

@collection
class User{
  
  Id id=Isar.autoIncrement;
  late String name;
  late int age;

  User(this.name, this.age);

@override
  String toString() {
//    print("name=[$name], age=[$age]");
    return "name=[$name], age=[$age]";
  }
  


}