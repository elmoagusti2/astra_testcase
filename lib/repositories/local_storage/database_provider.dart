import 'package:astra_testscase/models/pokemons/pokemons/result.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    String path = "pokdedex.db";
    int version = 1;

    return await openDatabase(
      path,
      version: version,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE POKEMON (
            id INTEGER PRIMARY KEY,
            name TEXT,
            url TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertLocalPokemon(List<Result> models) async {
    final db = await database;
    Batch batch = db.batch();

    for (var model in models) {
      batch.insert('pokemon', model.toJson());
    }
    await batch.commit();
  }

  Future<List<Result>> getLocalPokemons() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pokemon');
    return List.generate(maps.length, (i) {
      return Result.fromJson(maps[i]);
    });
  }
}
