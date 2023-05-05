

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_skill_test/data/model/response_model/SubSymptom.dart';
import 'package:soft_bd_skill_test/utill/color_resources.dart';
import 'package:soft_bd_skill_test/view_model/page_two_view_model.dart';
import 'package:intl/intl.dart';
import 'package:soft_bd_skill_test/view_model/view_all_selected_view_model.dart';

class ViewAllSelectedPage extends StatefulWidget {
  const ViewAllSelectedPage({Key key}) : super(key: key);

  @override
  _ViewAllSelectedPageState createState() => _ViewAllSelectedPageState();
}

class _ViewAllSelectedPageState extends State<ViewAllSelectedPage> {

  CustomPopupMenuController _controller = CustomPopupMenuController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _load();
    });
  }



  @override
  Widget build(BuildContext context) {


    final width=MediaQuery.of(context).size.width;

    return Consumer<ViewAllSelectedViewModel>(
        builder: (context,viewAllSelectedViewModel,child) {

          return Scaffold(
            backgroundColor: ColorResources.bodyColor,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: ColorResources.bodyColor,
                statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              leadingWidth: 0,
              leading: SizedBox(),
              elevation: 0.0,
              backgroundColor: ColorResources.bodyColor,
              title: Padding(
                padding:  EdgeInsets.only(left: width*(6/360),right: width*(6/360)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width*(10/360),vertical: width*(10/360)),
                        height: width*(35/360),
                        width: width*(35/360),
                        child: Image(image: AssetImage("assets/Polygon 9.png"),fit: BoxFit.contain,),
                        decoration: BoxDecoration(
                          // image: DecorationImage(
                          //   image: AssetImage("assets/Polygon 9.png",),
                          // ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(0.3,0.3),
                              )
                            ]
                        ),
                      ),
                    ),
                    Text("All SELECTED ITEMS"),
                    ElevatedButton(
                      onPressed: () {},
                      child: Center(child: Icon(Icons.question_mark, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(width*(3/360)),
                        fixedSize: Size(width*(30/360),width*(30/360)),
                        minimumSize: Size(width*(30/360),width*(40/360)),
                        // maximumSize: Size(width*(30/360),width*(40/360)),
                        // backgroundColor: Colors.blue, // <-- Button color
                        // foregroundColor: Colors.red, // <-- Splash color
                      ),
                    )
                  ],
                ),
              ),
              centerTitle: true,
              foregroundColor: ColorResources.BLACK,
            ),
            body: viewAllSelectedViewModel.selectedPageTowData!=null?Column(
              // physics: BouncingScrollPhysics(),
              // shrinkWrap: true,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: viewAllSelectedViewModel.selectedPageTowData.data.symptoms.map((symptoms) {
                    return Padding(
                      padding: EdgeInsets.only(left: width*(20/360),top: width*(15/360)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${symptoms.title}",style: TextStyle(fontSize: width*(14/360),fontWeight: FontWeight.w600),),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: symptoms.subSymptom.map((subSympTom) {
                                return symptoms.selectedSubSymptom!=null&&symptoms.selectedSubSymptom.title==subSympTom.title?Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: width*(8/360)),
                                  child:

                                  GestureDetector(
                                    onTap: (){

                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: width*(35/360),
                                          width: width*(35/360),
                                          margin: EdgeInsets.symmetric(vertical: width*(3/360)),
                                          padding: EdgeInsets.all(width*(8/360)),
                                          decoration: BoxDecoration(
                                              color: ColorResources.bodyColor,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: ColorResources.primaryColor)
                                          ),
                                          child: Image(image: NetworkImage("${subSympTom.icon}"),fit: BoxFit.fill,),
                                        ),
                                        Text("${subSympTom.title}",style: TextStyle(fontSize: width*(8/360)),)
                                      ],
                                    ),
                                  ),


                                ):SizedBox.shrink();
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: width*(10/360)),
                    height: width*(50/360),
                    width: width*(280/360),
                    decoration: BoxDecoration(
                        color: ColorResources.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: width*(10/360),vertical: width*(10/360)),
                          height: width*(35/360),
                          width: width*(35/360),
                          child: Image(image: AssetImage("assets/Polygon 1.png"),fit: BoxFit.contain,),
                          decoration: BoxDecoration(
                            // image: DecorationImage(
                            //   image: AssetImage("assets/Polygon 9.png",),
                            // ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.3,0.3),
                                )
                              ]
                          ),
                        ),
                        Text("VIEW ALL SELECTED ITEMS",style: TextStyle(fontSize: width*(14/360),color: Colors.white.withOpacity(.5),fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                )
              ],
            ):SizedBox.shrink(),
          );
        }
    );
  }
}
