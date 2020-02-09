import 'package:flutter/material.dart';
import 'package:sm_realtime_app/bloc/bloc_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sm_realtime_app/model/wiki_model.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class WikiView extends StatelessWidget {
  RefreshController _refreshController = RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    WikiBLoC bloc = BLoCProvider.of<WikiBLoC>(context);
    return StreamBuilder(
        stream: bloc.outWikiData,
        builder: (BuildContext context, AsyncSnapshot<Map>snapshot) {
          _refreshController.refreshCompleted();
          var data = snapshot.data;
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            controller: _refreshController,
            header: WaterDropHeader(),
            onRefresh: () {
              bloc.initData();
            },
            child: _buildContent(snapshot),
          );
        });
  }

  _buildWikiWidget(Map data,BuildContext context) {
    if(data == null || data['wiki_data'] == null) {
      return Container();
    }
    List recomendData = data['wiki_data'] ;
    return ListView.builder(
      itemBuilder: (context, index) {
        var model = recomendData[index];
        return _buildCell(model,context);
      },
      itemCount: recomendData.length,
    );
  }

  Widget _buildContent(AsyncSnapshot snapshot) {
    if(snapshot.data == null || snapshot.data['wiki_data'] == null) {
      return Container();
    }
    List recomendData = snapshot.data['wiki_data'] ;

    if(snapshot.connectionState == ConnectionState.waiting) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return ListView.builder(itemBuilder: (c, i) {
      var model = recomendData[i];
      return AnimationConfiguration.staggeredList(
        position: i,
        duration: const Duration(milliseconds: 375),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: _buildCell(model,c),
          ),
        ),
      );
    },
      itemCount: recomendData.length,
    );
  }


  _buildCell(WikiModel model,BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        Navigator.pushNamed(context, "routes://sm_web_page",arguments: {
          "webUrl":model.linkUrl,
          "title" : model.title
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
          children: <Widget>[
            Divider(height: 0.2,),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(model.title.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),),
                      SizedBox(height: 10,),
                      Text(model.description.toString(), style: TextStyle(color: Colors.black, fontSize: 14),),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                TextUtil.isEmpty(model.imgUrl) ? Container():CachedNetworkImage(imageUrl: model.imgUrl,width: 100,),
                SizedBox(width: 10,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
