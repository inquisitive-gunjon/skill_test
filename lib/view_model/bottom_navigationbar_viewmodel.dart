import 'package:flutter/material.dart';
import 'package:soft_bd_skill_test/utill/color_resources.dart';

class BottomNavigationBarViewModel with ChangeNotifier {

  int _selectedIndex = 0;
  String _title = "Page One";

  int get selectedIndex => _selectedIndex;
  String get title => _title;

  void updateSelectedIndex(){
    _selectedIndex=0;
    notifyListeners();
  }

  void addParcelNavigation(){
    _selectedIndex=1;
    notifyListeners();
  }

  // final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom == 0;

  Widget floatingActionButton(BuildContext context,bool islanding) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom == 0;
    return Visibility(
      visible: keyboardIsOpen,
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Color(0xFF0B4461)),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image:
                    AssetImage("assets/images/add_parcel_button.png"),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
        onPressed: () {
          _onItemTapped(1, islanding, context);

        },
      ),
    );
  }

  Widget bottomNavigationBar(BuildContext context,bool isLanding) {
    return BottomAppBar(

        // shape: CircularNotchedRectangle(),
        // clipBehavior: Clip.antiAlias,
        notchMargin: 4,
        child: BottomNavigationBar(
          backgroundColor: Colors.purpleAccent,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.shifting,
          onTap: (index){
            _onItemTapped(index,isLanding,context);
          },
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset("assets/Icon4.png",height: MediaQuery.of(context).size.width*(20/360),width: MediaQuery.of(context).size.width*(20/360),color: Colors.black,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/Group 3185.png",height: MediaQuery.of(context).size.width*(20/360),width: MediaQuery.of(context).size.width*(20/360),color: Colors.black,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/Group 3184.png",height: MediaQuery.of(context).size.width*(20/360),width: MediaQuery.of(context).size.width*(20/360),color: Colors.black,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/Group 3184.png",height: MediaQuery.of(context).size.width*(20/360),width: MediaQuery.of(context).size.width*(20/360),color: Colors.black,),
              label: '',
            ),
          ],
        ));
  }

  // Widget getWidget(int index) {
  //   if (index == 0 ) {
  //     return Container();
  //   }
  //   if (index == 2 ) {
  //     return Container();
  //   }
  //   if (index == 1) {
  //     return Container();
  //   }
  // }

  // String getTitle(int selectedIndex) {
  //   if (selectedIndex == 0 ) {
  //     return "DashBoard";
  //   }
  //   if (selectedIndex == 2 ) {
  //     return "My Profile";
  //   }
  //   if (selectedIndex == 1) {
  //     return "Add Parcel";
  //   }
  // }

  void _onItemTapped(int index, bool isLanding,BuildContext context) {
    _selectedIndex = index;
    notifyListeners();
    if(!isLanding){
      // Navigator.pushReplacementNamed(context, LandingPage.routeName);
    }

    //tap=false;
  }
}