import 'package:hive_ce/hive.dart';

class LocalDataSourceCounter {
  final Box<dynamic> box;

  LocalDataSourceCounter({required this.box});

  void save(int counter) async {
    await box.put('counter', counter);
  }

   int getCounter()  {
  return  box.get('counter')??0;
  }
}
