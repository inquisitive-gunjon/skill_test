import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_skill_test/data/model/base_model/page_one_data_model.dart';
import 'package:soft_bd_skill_test/utill/color_resources.dart';
import 'package:soft_bd_skill_test/utill/dimensions.dart';
import 'package:soft_bd_skill_test/view/page_tow.dart';
import 'package:soft_bd_skill_test/view_model/bottom_navigationbar_viewmodel.dart';
import 'package:soft_bd_skill_test/view_model/page_one_view_model.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int selectedDate;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Consumer<BottomNavigationBarViewModel>(
      builder: (context,bottomNavigationBarViewModel,child) {
        return Scaffold(
          backgroundColor: ColorResources.bodyColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ColorResources.bodyColor,
            foregroundColor: ColorResources.fontColor,
            iconTheme: IconThemeData(color: ColorResources.primaryColor),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PageTwo()));
                  },
                  child: SizedBox(
                    height: size * (18 / 360),
                    width: size * (18 / 360),
                    child: Image(
                      image: AssetImage("assets/Icon-1.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: ColorResources.primaryColor,
          ),
          body: Consumer<PageOneViewModel>(
            builder: (context,pageOneViewModel,child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: size*(8/360)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: PageOneDataModel.categoryList.map((e) => GestureDetector(

                          onTap: (){
                            pageOneViewModel.setSelectedCategory(e.categoryName);
                          },

                          child: Container(
                            height: size*.3,
                            width: size*.3,
                            decoration: BoxDecoration(
                                color: pageOneViewModel.selectedCategory==e.categoryName?ColorResources.primaryColor:Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(0.4,0.4),
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  blurStyle: BlurStyle.outer
                                )
                              ]
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: size*(25/360)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: size*(25/360),
                                      width: size*(25/360),
                                      child: Image(
                                        image: AssetImage("${e.categoryIcon}"),
                                        color: pageOneViewModel.selectedCategory==e.categoryName?Colors.white:ColorResources.primaryColor,
                                      )),
                                  // SizedBox(height: size*(8/360),),
                                  Text("${e.categoryName}",style: TextStyle(color: pageOneViewModel.selectedCategory==e.categoryName?Colors.white:ColorResources.fontColor,),),
                                ],
                              ),
                            ),
                          ),

                        )).toList(),
                      ),
                    ),

                    // SizedBox(
                    //   height: 500,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: CalendarTimeline(
                    //     initialDate: DateTime(2020, 4, 20),
                    //     firstDate: DateTime(2019, 1, 15),
                    //     lastDate: DateTime(2020, 11, 20),
                    //     onDateSelected: (date) => print(date),
                    //     leftMargin: 20,
                    //     monthColor: Colors.blueGrey,
                    //     dayColor: Colors.teal[200],
                    //     activeDayColor: Colors.white,
                    //     activeBackgroundDayColor: Colors.redAccent[100],
                    //     dotsColor: Color(0xFF333A47),
                    //     selectableDayPredicate: (date) => date.day != 23,
                    //     locale: 'en_ISO',
                    //   ),
                    // )

                    SizedBox(
                      height: size*(30/360),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: size*(8/360)),
                      child: Container(
                        height: size*(500/360),
                        width: size,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0,0.0),
                              color: Colors.grey.shade400,
                              blurRadius: 50,
                              blurStyle: BlurStyle.outer,
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  child: Column(children: [
                                    SizedBox(height: 10,),
                                    SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: PageOneDataModel.dayNameList.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 15),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(PageOneDataModel.dayNameList[index].toString()),
                                                  SizedBox(height: 6,),
                                                  Text(PageOneDataModel.dateNameList[index].toString()),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ]),
                                )),
                            Expanded(
                                flex: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorResources.bodyColor,
                                  ),
                                  child: Center(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 100,
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Title",style: TextStyle(color: Colors.black),),
                                            Text("1st Day",
                                              style: TextStyle(color: Colors.deepOrange),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: size*(50/360),
                    ),
                    Center(child: Text("Explore",style: TextStyle(fontWeight: FontWeight.w600),)),
                    SizedBox(
                      height: size*(20/360),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size*(8/360)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: PageOneDataModel.categoryList2.map((e) => Container(
                          height: size*(80/360),
                          width: size*(80/360),
                          child: Padding(
                            padding: EdgeInsets.all(size*(5/360)),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey.shade200),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            height: size*(15/360),
                                            width: size*(15/360),
                                            image: AssetImage(e.categoryIcon),
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: size * (8 / 360),
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text(e.categoryName,
                                      style: TextStyle(
                                        fontSize: size * (7 / 360),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                        )).toList(),
                      ),
                    ),
                    SizedBox(
                      height: size * (200 / 360),
                      width: size,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          disableCenter: true,
                          onPageChanged: (index, reason) {
                            // Provider.of<BannerProvider>(context, listen: false).setCurrentIndex(index);
                          },
                        ),
                        itemCount: PageOneDataModel.bannerImageList.length,
                        itemBuilder: (context, index, _) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage(
                                      PageOneDataModel.bannerImageList[index]),
                                ),
                                // FadeInImage.assetNetwork(
                                //   placeholder: Images.placeholder, fit: BoxFit.cover,
                                //   image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
                                //       '/${bannerProvider.mainBannerList[index].photo}',
                                //   imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_3x1, fit: BoxFit.cover),
                                // ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),


                    SizedBox(height: size * (8 / 360),),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size*(8/360)),
                      child: Container(
                        padding: EdgeInsets.only(left: size*(10/360), right: size*(10/360), top: size*(10/360)),
                        height: size * (180 / 360),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 3.0,
                                  spreadRadius: 0,
                                  offset: Offset(0.3, 3),
                              )
                            ]),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Demo APP",
                                    style: TextStyle(
                                        fontSize: size * (Dimensions.FONT_SIZE_LARGE / 360),
                                        color: Colors.purpleAccent.shade400)),
                                SizedBox(height: size * (10 / 360),),
                                Text("In this example, we have set an image inside the CircleAvatar widget using the backgroundImage property. The image is geeksforgeeks logo whose address is provided inside the NetworkImage’s argument. And at last, we have assigned 100 as value to the radius of the CircleAvatar.",
                                    style: TextStyle(
                                        fontSize: size *
                                            (Dimensions.FONT_SIZE_EXTRA_SMALL / 360),
                                        color: ColorResources.fontColor))
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image(
                                height: size*(90/360),
                                width: size*(140/360),
                                fit: BoxFit.fill,
                                image: AssetImage("assets/Group 2131.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: size * (30 / 360),
                    ),
                    Center(
                        child: Text("Unlock Premium",
                            style: TextStyle(
                                fontSize: size * (Dimensions.FONT_SIZE_LARGE / 360),
                                color: ColorResources.primaryColor,
                                fontWeight: FontWeight.w600))),
                    SizedBox(
                      height: size * (30 / 360),
                    ),
                    Container(
                      height: size * .4,
                      width: size,
                      padding: EdgeInsets.symmetric(horizontal: size * (20 / 360)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            // width: size,
                            padding: EdgeInsets.symmetric(horizontal: size * (25 / 360),vertical: size*(40/360)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorResources.primaryColor,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 2.0,
                                      spreadRadius: 0,
                                      offset: Offset(0.8, 0.8))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "30-Day Free Trial",
                                  style: TextStyle(
                                      fontSize: size*(Dimensions.FONT_SIZE_SMALL/360),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "(Then BDT 3,400.00/year only BDT 283.34/month)",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                                ),
                              ],
                            ),
                          )),
                          SizedBox(
                            width: size * (10 / 360),
                          ),
                          Expanded(
                              child: Container(
                                height: size,
                            width: size,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 2.0,
                                      spreadRadius: 0,
                                      offset: Offset(0.8, 0.8))
                                ]),
                            child: Center(
                              child: Text(
                                "1 month BDT 700.00",
                                style: TextStyle(
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                    color: ColorResources.fontColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),

                    SizedBox(height: size*(30/360),),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size*(8/360)),
                      child: Container(
                        padding: EdgeInsets.only(left: size*(15/360), right: size*(10/360), top: size*(15/360)),
                        height: size * (180 / 360),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 3.0,
                                spreadRadius: 0,
                                offset: Offset(0.3, 3),
                              )
                            ]),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Add My Partner",
                                    style: TextStyle(
                                        fontSize:
                                        size * (Dimensions.FONT_SIZE_LARGE / 360),
                                        color: Colors.purpleAccent.shade200,
                                      fontWeight: FontWeight.w600
                                    ),
                                ),
                                SizedBox(
                                  height: size * (10 / 360),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image(
                                height: size*(135/360),
                                width: size*(240/360),
                                fit: BoxFit.fill,
                                image: AssetImage("assets/Group 3183.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              );
            }
          ),
          bottomNavigationBar: bottomNavigationBarViewModel.bottomNavigationBar(context, true),
        );
      }
    );
  }
}
