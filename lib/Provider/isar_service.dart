
import 'package:flutter_application_1/Models/user.dart';
import 'package:isar/isar.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

 

  Future<int> saveUser(User user) async {
    final isar = await db;
    int res = isar.writeTxnSync<int>(() => isar.users.putSync(user));
    return res;
  }


  Future<List<User>> getAllUsers() async {
    final isar = await db;
    return await isar.users.where().findAll();
  }

  Stream<List<User>> listenToUsers() async* {
    final isar = await db;
    yield* isar.users.where().watch(fireImmediately: true);
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }




  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UserSchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}