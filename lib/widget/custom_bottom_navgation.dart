import 'dart:ui';

import 'package:flutter/material.dart';
class CustomBottomNavgationBar extends StatelessWidget {
 final int selectedPageIndex;
 final Function onIconTap;
 CustomBottomNavgationBar({Key? key, required this.selectedPageIndex, required this.onIconTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final barHight = MediaQuery.of(context).size.height * 0.10;
   final style = Theme.of(context).textTheme .bodyText1! .copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white );
    return Container(
      color: selectedPageIndex == 0? Colors.black : Colors.white,
      height: barHight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
            _bottomBarNavItem(0, "home", style, "home",),
           _bottomBarNavItem(2, "Discover", style, "search"),
           _addVideoNavItem(barHight),
           _bottomBarNavItem(3, "InBox", style, "massage"),
           _bottomBarNavItem(4, "Profile", style, "account"),
         ],
      ),
    );
  }
 _bottomBarNavItem(int index, String label, TextStyle, String iconName) {
    bool isSelected = selectedPageIndex == index;
    Color iconAndTextColor = isSelected ? Colors.black : Colors.grey;
    if(isSelected && selectedPageIndex ==0){
      iconAndTextColor = Colors.white;
    }
    return Column(
      children: [
        TextButton(onPressed:()=> {onIconTap(index)}, child: Icon(Icons.home, color: iconAndTextColor,), ),
        Text(label )
      ],
    );
 }
 _addVideoNavItem(double height){
   return Center(
     child: Container(
       height: height - 15,
       width: 48,
       decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blueAccent, Colors.redAccent]),
       borderRadius: BorderRadius.circular(8),
       ),
       child: Center(
         child: Container(
           width: 41,
           height: height-15,
      decoration: BoxDecoration(
          color: selectedPageIndex == 0 ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(8)
      ),
child: Icon(Icons.add, color: selectedPageIndex ==0 ? Colors.black : Colors.white,),
         ),
       ),
     ),
   );
 }
}
