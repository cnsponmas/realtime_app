import 'package:flutter/material.dart';
import 'package:sm_realtime_app/bloc/bloc_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sm_realtime_app/model/news_model.dart';
import 'package:sm_realtime_app/widgets/news_card_widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class HomePage extends StatelessWidget{

  RefreshController _refreshController = RefreshController(initialRefresh: true);
  @override
  Widget build(BuildContext context) {

    HomeBLoC bloc = BLoCProvider.of<HomeBLoC>(context);

    return StreamBuilder<List>(
      stream: bloc.outHomeList,
      builder: (BuildContext context, AsyncSnapshot<List>snapshot) {
        _refreshController.refreshCompleted();
        _refreshController.loadComplete();

        return Container(
          padding: EdgeInsets.only(top: 10),
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            header: WaterDropHeader(complete: Container(
              height: 55.0,
              child: Container(),
            ),),
            footer: CustomFooter(builder: (BuildContext context,  LoadStatus mode) {
              Widget body;
              if(mode == LoadStatus.canLoading){
                body = Text("加载更多");
              }else if(mode == LoadStatus.loading){
                body =  CupertinoActivityIndicator();
              }else{
                body = Text("没有更多数据");
              }
              return Container(
                height: 55.0,
                child: Center(child:body),
              );
            }),
            onRefresh: () {
              bloc.initData();
            },
            onLoading: (){
              bloc.loadMoreData();
            },
            child: _buildContent(snapshot),

          ),
        );
      },
    );
  }

  Widget _buildContent(AsyncSnapshot snapshot) {
    if(snapshot.connectionState == ConnectionState.waiting) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return ListView.builder(itemBuilder: (c, i) {
      return AnimationConfiguration.staggeredList(
        position: i,
        duration: const Duration(milliseconds: 375),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: _renderRow(snapshot.data, i),
          ),
        ),
      );
//      return _renderRow(snapshot.data, i);
    },
      itemCount: snapshot.data == null ? 0: snapshot.data.length,
    );
  }

  Widget _renderRow(List list, int index) {
    var model = list[index];
    if(model is LabNewsModel) {
      return NewsCardWidget(labNewsModel: model,);
    }else {
      return Container(
        child: Center(
          child: Text('数据类型错误'),
        ),
      );
    }
  }

  Widget _infoRow(DescModel model) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.only(left: 15,bottom: 10,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('新型冠状病毒肺炎', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
            _infoCell('assets/images/source.png', '传染源', model.infectSource),
            _infoCell('assets/images/source.png', '病毒', model.virus),
            _infoCell('assets/images/source.png', '传播方式', model.passWay),
            _infoCell('assets/images/source.png', '易感人群', model.remark1),
            _infoCell('assets/images/source.png', '潜伏期', model.remark2),
            SizedBox(height: 10,),
            Divider(height: 0.2,)
          ],
        ),
      ),
    );
  }

  Widget _infoCell(String img, String title, String content) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(img,width: 20,),
              SizedBox(width: 5,),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),),
            ],
          ),
          Text('- ${content}',maxLines: 10,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),),
        ],
      ),
    );
  }
}



