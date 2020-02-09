import 'package:flutter/material.dart';
import 'package:sm_realtime_app/bloc/bloc_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sm_realtime_app/model/recommend_model.dart';

class ProtectView extends StatelessWidget {
  RefreshController _refreshController = RefreshController(initialRefresh: true);
  @override
  Widget build(BuildContext context) {
    ProtectBLoC bloc = BLoCProvider.of<ProtectBLoC>(context);
    return StreamBuilder(
        stream: bloc.outProtectData,
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
        child: _buildRecomendWidget(data),
      );
    });
  }

  _buildRecomendWidget(Map data) {
    if(data == null || data['recomend_data'] == null) {
      return Container();
    }
    List recomendData = data['recomend_data'] ;
    return ListView.builder(
      itemBuilder: (context, index) {
        var model = recomendData[index];
        return _buildCell(model,context);
      },
      itemCount: recomendData.length,
    );
  }

  _buildCell(RecommendModel model, BuildContext context) {
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
                  child: Text(model.title.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),),
                ),
                SizedBox(width: 10,),
                CachedNetworkImage(imageUrl: model.imgUrl,width: 150,),
                SizedBox(width: 10,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
