import 'package:flutter/material.dart';
import 'package:sm_realtime_app/bloc/bloc_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sm_realtime_app/model/rumor_model.dart';
import 'package:common_utils/common_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RumorsPage extends StatelessWidget {
  RefreshController _refreshController = RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {


    RumorsBLoC dataBLoC = BLoCProvider.of<RumorsBLoC>(context);
    return StreamBuilder<Map>(
      stream: dataBLoC.outRumorsData,
      builder: (BuildContext context, AsyncSnapshot<Map>snapshot) {
        _refreshController.refreshCompleted();
        _refreshController.loadComplete();
        List datas = List();
        if(snapshot.data != null) {
          datas = snapshot.data['rumors_data'];
        }
        return Container(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            header: WaterDropHeader(),
            onRefresh: () {
              dataBLoC.initData();
            },
            onLoading: (){
              dataBLoC.loadMore();
            },

            child: ListView.builder(
                itemBuilder: (c, i) {
              RumorModel model = datas[i];
              return _buildCell(model, c);
            },
              itemCount: datas.length,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCell(RumorModel item, BuildContext context) {
    if(item.imgsrc.startsWith('//')){
      item.imgsrc = 'https:${item.imgsrc}';
    }
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "routes://sm_web_page",arguments: {
          "webUrl":"https://vp.fact.qq.com/article?id=${item.id}",
          "title" : item.author.toString()
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 25,
              margin: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: typeColor(item.explain, item.markstyle),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(item.explain),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 10,right: 10, top: 10,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                      Text(item.desc, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
                      SizedBox(height: 5,),
                      Text('${item.date}', style: TextStyle(color: Colors.grey[500]),)
                    ],
                  )
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 10,top: 10,bottom: 10),
                child: CachedNetworkImage(imageUrl: item.imgsrc,width: 100,)),
          ],
        ),
      ),
    );
  }


  Color typeColor(String explain, String markstyle) {
    if(TextUtil.isEmpty(explain)) {
      switch (markstyle) {
        case 'fake':
          return Colors.red;
          break;
        case 'genuine':
          return Colors.green;
          break;
      }
    }
    switch (explain) {
      case '谣言':
        return Colors.red;
        break;
      case '尚无定论':
        return Colors.amber;
        break;
      case '有失实':
        return Colors.green[200];
        break;
      case '存在争议':
        return Colors.grey[500];
        break;
      case '确实如此':
        return Colors.green;
        break;
      case '确有此事':
        return Colors.green;
        break;
      case '伪科学':
        return Colors.red[400];
        break;
    }
    return Colors.amber;
  }



}
