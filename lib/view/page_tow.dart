

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_skill_test/utill/color_resources.dart';
import 'package:soft_bd_skill_test/view_model/page_two_view_model.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  _load()async{
    Provider.of<PageTwoViewModel>(context,listen: false).getPageTwoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.bodyColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorResources.bodyColor,
        title: Text("29 March"),
        centerTitle: true,
        foregroundColor: ColorResources.fontColor,
      ),

    );
  }
}
