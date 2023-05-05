

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soft_bd_skill_test/data/model/response_model/PageTwoDataModel.dart';

class ViewAllSelectedViewModel with ChangeNotifier{



  PageTwoDataModel _selectedPageTowData;
  PageTwoDataModel get selectedPageTowData => _selectedPageTowData;




  void setSelectedPageTowData(PageTwoDataModel pageTwoDataModel){
    _selectedPageTowData=pageTwoDataModel;
    notifyListeners();
  }



}