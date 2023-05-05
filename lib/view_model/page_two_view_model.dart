


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:soft_bd_skill_test/data/model/response_model/PageTwoDataModel.dart';
import 'package:soft_bd_skill_test/data/model/response_model/SubSymptom.dart';
import 'package:soft_bd_skill_test/data/model/response_model/Symptoms.dart';
import 'package:soft_bd_skill_test/data/repository/base/api_response.dart';
import 'package:soft_bd_skill_test/data/repository/page_two_repo.dart';
import 'package:soft_bd_skill_test/utill/color_resources.dart';



class PageTwoViewModel with ChangeNotifier{
  PageTwoRepo pageTwoRepo;

  PageTwoViewModel({this.pageTwoRepo});




  bool _isLoading=false;
  PageTwoDataModel _pageTwoDataModel;
  PageTwoDataModel _copyPageTwoDataModel;
  String _currentDateTime;
  SubSymptom _primarySelectedSubSymptom;





  bool get isLoading=>_isLoading;
  PageTwoDataModel get pageTwoDataModel=>_pageTwoDataModel;
  PageTwoDataModel get copyPageTwoDataModel=>_copyPageTwoDataModel;
  String get currentDateTime=> _currentDateTime;
  SubSymptom get primarySelectedSubSymptom=> _primarySelectedSubSymptom;



  Color getSelectedSymptomsColor(SubSymptom selectedSubSymptom,SubSymptom subSymptom){

    if(selectedSubSymptom!=null){
      if(selectedSubSymptom.title==subSymptom.title){
        return ColorResources.primaryColor;
      }
      else{
        return ColorResources.bodyColor;
      }
    }else{
      if(_primarySelectedSubSymptom!=null){
        if(_primarySelectedSubSymptom.title==subSymptom.title){
          return ColorResources.primaryColor;
        }else{
          return ColorResources.bodyColor;
        }

      }else{
        return ColorResources.bodyColor;
      }
    }
  }





  void setPrimarySelectedSubSymptom(SubSymptom subSymptom ){
    _primarySelectedSubSymptom=subSymptom;
    notifyListeners();
  }






  void confirmSelectedSubSymptom(Symptoms symptoms,SubSymptom subSymptom ){

    int  symptomIndex =_pageTwoDataModel.data.symptoms.indexOf(symptoms);
    print(symptomIndex);
    // int  subSymptomIndex =_pageTwoDataModel.data.symptoms[symptomIndex].subSymptom.indexOf(subSymptom);
    // print(subSymptomIndex);
    _pageTwoDataModel.data.symptoms[symptomIndex].selectedSubSymptom=subSymptom;
    print(_pageTwoDataModel.data.symptoms[symptomIndex].selectedSubSymptom.title);
    print(_pageTwoDataModel.data.symptoms[symptomIndex].selectedSubSymptom.title);
    _copyPageTwoDataModel=_pageTwoDataModel;
    notifyListeners();

  }




  void loadCurrentDate()async{
    DateTime now =await DateTime.now();
    _currentDateTime = "${now.day} ${DateFormat('MMMM').format(now)}";
    notifyListeners();
  }





  Future<void> getPageTwoData() async{
    _isLoading=true;
    notifyListeners();
    ApiResponse apiResponse =await pageTwoRepo.getPageTowData();
    if(apiResponse.response!=null && apiResponse.response.statusCode==200){
      _isLoading=false;
      notifyListeners();
      _pageTwoDataModel= PageTwoDataModel.fromJson(apiResponse.response.data);
      if(_copyPageTwoDataModel!=null){
        _copyPageTwoDataModel.data.symptoms.where((element) {
          if(element.selectedSubSymptom!=null){
            int subSyntomsIndex=_copyPageTwoDataModel.data.symptoms.indexOf(element);
            _pageTwoDataModel.data.symptoms[subSyntomsIndex]=element;
            _copyPageTwoDataModel=_pageTwoDataModel;
            notifyListeners();
          }
          notifyListeners();
          return false;
        });
        notifyListeners();
      }else{
        _copyPageTwoDataModel=_pageTwoDataModel;
        notifyListeners();
      }
    }else{
      _isLoading=false;
      notifyListeners();
    }

  }



}