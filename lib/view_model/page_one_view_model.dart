
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageOneViewModel with ChangeNotifier{

  String _selectedCategory="Cycle";


  String get selectedCategory => _selectedCategory;




  void setSelectedCategory(String categoryName){

    _selectedCategory=categoryName;

    notifyListeners();
  }

}