import 'package:flutter/cupertino.dart';

import '../../data/data_sources/local_data_source_counter.dart';


class CounterProvider extends ChangeNotifier {
 final LocalDataSourceCounter localDataSourceCounter ;
  int counter=0 ;

  CounterProvider({required this.localDataSourceCounter});
  void plus()async{
        counter++;
         localDataSourceCounter.save(counter);
        notifyListeners();
      }
 void minus()async{
   counter--;
    localDataSourceCounter.save(counter);
   notifyListeners();
 }
 void clear()async{
   counter=0;
    localDataSourceCounter.save(counter);
   notifyListeners();
 }
 void loadCounter() {
  counter=  localDataSourceCounter.getCounter();
 }



}