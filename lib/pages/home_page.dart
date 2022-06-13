import 'package:flutter/material.dart';
import 'package:tiktok_clone/widget/home_side_bar.dart';
import 'package:tiktok_clone/widget/video_detail.dart';
import 'package:tiktok_clone/widget/video_tile.dart';

import '../_mock_data/_mock.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool _isFollowingSelect = true;
    int _snappedPageIndex = 0;
    return Scaffold(
   extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(onTap: () => {
              setState((){
                _isFollowingSelect =  true;
              })
            },    child: Text("Following",
                style: Theme.of(context).textTheme .bodyText1! .copyWith(fontSize:  _isFollowingSelect ? 18 : 15,
                    color:  _isFollowingSelect ?  Colors.white : Colors.grey))),
            Text("  |  ", style: Theme.of(context).textTheme .bodyText1! .copyWith(fontSize: 14, color: Colors.grey ),),
            GestureDetector(onTap: () => {
              setState((){
                _isFollowingSelect =  false;
              })
            },  child: Text("For you", style: Theme.of(context).textTheme .bodyText1! .copyWith(fontSize:  !_isFollowingSelect ? 18 : 15,
                color: !_isFollowingSelect ? Colors.white : Colors.grey )))
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: PageView.builder(
        onPageChanged: (int page) => {
          setState((){
            _snappedPageIndex = page;
          }),

        },
          scrollDirection: Axis.vertical,
          itemCount: videos.length,
          itemBuilder: (context,  index){
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            VideoTile(video: videos[index], currentIndex:index, snappedPageIndex: _snappedPageIndex, ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: VideoDetail(video: videos[index],),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.75,
                    child: HomeSideBar(video: videos[index],),
                  ),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
