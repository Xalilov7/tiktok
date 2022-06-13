import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
       slivers: [
         SliverAppBar(
           backgroundColor: Colors.white,
           elevation: 0.25,
           pinned: true,
           centerTitle: false,
           title: Container(
             height: 35,
             decoration: BoxDecoration(
               color: Colors.grey.shade200,
               borderRadius: BorderRadius.circular(2),
             ),
             child: TextField(
               textAlignVertical: TextAlignVertical.center,
               cursorColor: Colors.grey.shade500,
               decoration: InputDecoration(
                 hintText: "Search",
                 hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey.shade500, fontSize: 16, fontWeight: FontWeight.bold),
                 border: InputBorder.none,
                 prefixIcon: Icon(
                   CupertinoIcons.search,
                   color: Colors.black,
                 ),
               ),
               style: Theme.of(context).textTheme.bodyText1!.copyWith(
                 color: Colors.black,
                 fontSize: 16,
                 fontWeight: FontWeight.bold
               ),
             ),
           ),
           actions: [
             IconButton(onPressed: () {}, icon: Icon(
               CupertinoIcons.qrcode_viewfinder,
               color: Colors.black,
             ))
           ],
         )
       ],
    );
  }
}
