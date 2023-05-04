

import 'package:flutter/material.dart';
import 'package:soft_bd_skill_test/data/model/response_model/PageTwoDataModel.dart';
import 'package:soft_bd_skill_test/data/repository/base/api_response.dart';
import 'package:soft_bd_skill_test/data/repository/page_two_repo.dart';

class PageTwoViewModel with ChangeNotifier{
  PageTwoRepo pageTwoRepo;

  PageTwoViewModel({this.pageTwoRepo});

  bool _isLoading=false;
  PageTwoDataModel _pageTwoDataModel;


  bool get isLoading=>_isLoading;
  PageTwoDataModel get pageTwoDataModel=>_pageTwoDataModel;



  Future<void> getPageTwoData() async{

    _isLoading=true;

    ApiResponse apiResponse =await pageTwoRepo.getPageTowData();

    if(apiResponse.response!=null && apiResponse.response.statusCode==200){
      _isLoading=false;
      notifyListeners();
      _pageTwoDataModel= PageTwoDataModel.fromJson(apiResponse.response.data);

    }else{
      _isLoading=false;
      notifyListeners();
    }

  }

}