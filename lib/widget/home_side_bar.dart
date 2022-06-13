import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/video.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({Key? key, required this.video}) : super(key: key);
  final Video video;
  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.repeat();
    super.initState();
  }
  @override
  void dispose(){
    _animationController.dispose() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _profileImageButton(widget.video.postedBy.profileImageUrl),
          _sizeBarItem("heart", widget.video.likes, style),
          _sizeBarItem("Comment", widget.video.comments, style),
          _sizeBarItem("share", "Share", style),
          AnimatedBuilder(animation: _animationController, child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.yellow,
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx2ULve-eCxEL5DmQNyW-fjpe71DzPU5SR7YEeTZ4zgxRiMV7CxTjJL1u_WGs4awTTSJI&usqp=CAU"),
              ),
              CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzZP3bsN28u8lpRIu_4szO21CnKIR6HmS81Q&usqp=CAU"),
              )
            ],
          ), builder: (context, child){
            return Transform.rotate(angle: 2 * pi * _animationController.value, child: child,);
          })
        ],
      ),
    );
  }

   _sizeBarItem(String iconName, String label, TextStyle style){
     return Column(
       children: [
        Image.network("https://www.iconpacks.net/icons/2/free-heart-icon-3510-thumb.png", height: 50,),
         SizedBox(height: 5,),
         Text(label, style: style,)
       ],
     );
   }

  _profileImageButton(String imageUrl) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
                 fit: BoxFit.cover,
              image: NetworkImage(imageUrl)
            )
          ),
        ),
        Positioned(
            bottom: -10,
            child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25),
          ),
       child: Icon(
         Icons.add,
         color: Colors.white,
         size: 20,
       ),
        ))
      ],
    );
  }
}
