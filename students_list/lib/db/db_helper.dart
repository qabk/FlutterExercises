import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:students_list/student.dart';

class DBHelper {
  static Database? _db;
  static const String ID = "id";
  static const String NAME = "name";
  static const String AGE = "age";
  static const String ADDRESS = "address";
  static const String IMGLINK = "imglink";
  static const String DB_NAME = 'student1.db';
  static const String TABLE = 'Student';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb('student1.db');
    return _db;
  }

  initDb(String s) async {
    //init db
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    //tạo database
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $NAME TEXT, $AGE TEXT, $ADDRESS TEXT, $IMGLINK TEXT)");
  }

  Future<Student> save(Student student) async {
    var dbClient = await db;
    student.id = await dbClient!.insert(TABLE, student.toMap());
    return student;
  }

  Future<List<Student>> getStudent() async {
    //get list employees đơn giản
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!
        .query(TABLE, columns: [ID, NAME, AGE, ADDRESS, IMGLINK]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Student> students = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        students.add(Student.fromMap(maps[i]));
      }
    }
    return students;
  }

  Future<int> delete(int id) async {
    // xóa employee
    var dbClient = await db;
    return await dbClient!.delete(TABLE,
        where: '$ID = ?',
        whereArgs: [id]); //where - xóa tại ID nào, whereArgs - argument là gì?
  }

  Future<int> update(Student student) async {
    var dbClient = await db;
    return await dbClient!.update(TABLE, student.toMap(),
        where: '$ID = ?', whereArgs: [student.id]);
  }

  Future close() async {
    //close khi không sử dụng
    var dbClient = await db;
    dbClient!.close();
  }
}
