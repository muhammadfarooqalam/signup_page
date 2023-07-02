import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  static Future<sql.Database> openDb() async {
    return sql.openDatabase(
      'mypushup.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await database.execute(
            "CREATE TABLE IF NOT EXISTS lms_authentication(id INTEGER PRIMARY KEY AUTOINCREMENT, full_name Text, email Text, password Text)");
      },
    );
  }

  static Future<List<Map<String, dynamic>>> get() async {
    final db = await DatabaseHelper.openDb();
    return db.rawQuery('SELECT * FROM lms_authentication');
  }

  static Future<int> update(
      int id, String name, String email, String password) async {
    final db = await DatabaseHelper.openDb();
    final result = await db.rawUpdate(
        'UPDATE lms_authentication SET full_name = ?, email ?, password ? WHERE id = ?',
        [name, email, password, id]);

    return result;
  }

  static Future<int> save(String name, String email, String password) async {
    final db = await DatabaseHelper.openDb();
    final id = await db.insert('lms_authentication',
        {'full_name': name, "email": email, "password": password});
    return id;
  }
}
