import 'package:dictionary/src/feature/search_view/model/words_data.dart';
import 'package:flutter/material.dart';



class AddFavourite extends ChangeNotifier {
  
  List<DictionWord> getFav = DictionWord.getWord();

  List<DictionWord> favouriteData = [];

  void addFav(int index) {
   final favourite = DictionWord(
        title: getFav[index].title,
        subtitle: getFav[index].title,
        meaning: getFav[index].title);

     favouriteData.add(favourite);
        notifyListeners();
  }
}
