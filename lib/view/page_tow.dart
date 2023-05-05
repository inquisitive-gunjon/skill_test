

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_skill_test/data/model/response_model/SubSymptom.dart';
import 'package:soft_bd_skill_test/utill/color_resources.dart';
import 'package:soft_bd_skill_test/view/view_all_selected_page.dart';
import 'package:soft_bd_skill_test/view_model/page_two_view_model.dart';
import 'package:intl/intl.dart';
import 'package:soft_bd_skill_test/view_model/view_all_selected_view_model.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {

  CustomPopupMenuController _controller = CustomPopupMenuController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  _load()async{
    Provider.of<PageTwoViewModel>(context,listen: false).loadCurrentDate();
    Provider.of<PageTwoViewModel>(context,listen: false).getPageTwoData();

  }

  @override
  Widget build(BuildContext context) {


    final width=MediaQuery.of(context).size.width;

    return Consumer<PageTwoViewModel>(
      builder: (context,pageTwoViewModel,child) {
        if(pageTwoViewModel!=null){
          Provider.of<ViewAllSelectedViewModel>(context,listen: false).setSelectedPageTowData(pageTwoViewModel.copyPageTwoDataModel);
        }

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
                  Text("${pageTwoViewModel.currentDateTime??""}"),
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
          body: pageTwoViewModel.copyPageTwoDataModel!=null&&pageTwoViewModel.isLoading==false?Column(
            // physics: BouncingScrollPhysics(),
            // shrinkWrap: true,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: pageTwoViewModel.copyPageTwoDataModel.data.symptoms.map((symptoms) {
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
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: width*(8/360)),
                                    child:CustomPopupMenu(
                                      // controller: _controller,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: width*(35/360),
                                            width: width*(35/360),
                                            margin: EdgeInsets.symmetric(vertical: width*(3/360)),
                                            padding: EdgeInsets.all(width*(8/360)),
                                            decoration: BoxDecoration(
                                                color: pageTwoViewModel.primarySelectedSubSymptom!=null&&pageTwoViewModel.primarySelectedSubSymptom.title==subSympTom.title?ColorResources.primaryColor:pageTwoViewModel.getSelectedSymptomsColor(symptoms.selectedSubSymptom, subSympTom),
                                                shape: BoxShape.circle,
                                                border: Border.all(color: ColorResources.primaryColor)
                                            ),
                                            child: Image(image: NetworkImage("${subSympTom.icon}"),fit: BoxFit.fill,),
                                          ),
                                          Text("${subSympTom.title}",style: TextStyle(fontSize: width*(8/360)),)
                                        ],
                                      ),
                                      menuBuilder: () {
                                        // print(pageTwoViewModel.primarySelectedSubSymptom.title);
                                        print(subSympTom.title);
                                        WidgetsBinding.instance.addPostFrameCallback((_) {
                                          pageTwoViewModel.setPrimarySelectedSubSymptom(subSympTom);
                                          print(pageTwoViewModel.primarySelectedSubSymptom.title);
                                        });
                                        return GestureDetector(

                                        child: Container(
                                          height: 100,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: ColorResources.primaryColor,
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: width*(10/360),vertical: width*(7/360)),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("ARE YOU SURE YOU WANT TO SELECT THIS?",style: TextStyle(color: Colors.white,fontSize: width*(14/360),fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      onTap: (){
                                                        print("touch lagche");
                                                        // _controller.hideMenu();
                                                        pageTwoViewModel.confirmSelectedSubSymptom(symptoms,subSympTom);
                                                        Provider.of<ViewAllSelectedViewModel>(context,listen: false).setSelectedPageTowData(pageTwoViewModel.pageTwoDataModel);
                                                        // print(pageTwoViewModel.c);
                                                        pageTwoViewModel.pageTwoDataModel.data.symptoms.where((element) {
                                                          if(element.selectedSubSymptom!=null){
                                                            print(element.selectedSubSymptom.title);
                                                          }
                                                          return true;
                                                        }
                                                        );
                                                      },
                                                      child: Container(
                                                        height: width*(25/360),
                                                        width: width*(50/360),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.white,width: 1),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Text("Yes",style: TextStyle(color: Colors.white,fontSize: width*(14/360),fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: (){
                                                        // _controller.hideMenu();
                                                      },

                                                      child: Container(
                                                        height: width*(25/360),
                                                        width: width*(50/360),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.white,width: 1),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Text("No",style: TextStyle(color: Colors.white,fontSize: width*(14/360),fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        onLongPress: () {
                                          print("onLongPress");
                                        },
                                        onTap: () {
                                          // pageTwoViewModel.setPrimarySelectedSubSymptom(e);
                                          print("onTap");
                                        },
                                      );
                                      },
                                      barrierColor: Colors.transparent,
                                      pressType: PressType.singleClick,
                                      // arrowColor: isMe ? Colors.blueAccent : Colors.pinkAccent,
                                      arrowColor: Colors.transparent,
                                      position: PreferredPosition.bottom,
                                    ),

                                    // GestureDetector(
                                    //   onTap: (){
                                    //
                                    //   },
                                    //   child: Column(
                                    //     children: [
                                    //       Container(
                                    //         height: width*(35/360),
                                    //         width: width*(35/360),
                                    //         margin: EdgeInsets.symmetric(vertical: width*(3/360)),
                                    //         padding: EdgeInsets.all(width*(8/360)),
                                    //         decoration: BoxDecoration(
                                    //             color: ColorResources.bodyColor,
                                    //             shape: BoxShape.circle,
                                    //           border: Border.all(color: ColorResources.primaryColor)
                                    //         ),
                                    //         child: Image(image: NetworkImage("${e.icon}"),fit: BoxFit.fill,),
                                    //       ),
                                    //       Text("${e.title}",style: TextStyle(fontSize: width*(8/360)),)
                                    //     ],
                                    //   ),
                                    // ),


                                  ),
                                  // Container(
                                  //   height: 100,
                                  //   width: 250,
                                  //   color: Colors.red,
                                  // )
                                ],
                              );
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
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllSelectedPage()));
                  },
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
                ),
              )
            ],
          ):SizedBox.shrink(),
        );
      }
    );
  }
}
