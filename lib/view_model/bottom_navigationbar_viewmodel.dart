import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:soft_bd_skill_test/utill/color_resources.dart';
import 'package:soft_bd_skill_test/view/page_tow.dart';

class BottomNavigationBarViewModel with ChangeNotifier {

  String _selectedMenu="assets/Icon4.png";

  String get selectedMenu=> _selectedMenu;

  static List<String> bottomNavigationImageList=[
    "assets/Icon4.png",
    "assets/Group 3185.png",
    "assets/Group 3184.png",
    "assets/Send.png"
  ];

  Widget bottomNavigationBar(BuildContext context,bool isLanding) {
    final width=MediaQuery.of(context).size.width;
    return Container(
      height: width*(60/360),
      width: width,
      color: Colors.white,
      child: Row(
        children: bottomNavigationImageList.map((e) {
          return Expanded(child: InkWell(
          onTap: (){
            _selectedMenu=e;
            print(_selectedMenu);
            notifyListeners();

            if(_selectedMenu=="assets/Send.png"){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PageTwo()));
            }
          },
          child: Container(
            // height: double.infinity,
            // width: double.infinity,
            color: _selectedMenu==e?ColorResources.primaryColor:Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: width*(16/360),width: width*(16/360),
                    child: Image(image: AssetImage("${e}"),color: ColorResources.fontColor,height: width*(16/360),width: width*(16/360),fit: BoxFit.contain,)),
              ],
            ),
          ),
        ));
        },).toList(),
      ),
    );
  }

}