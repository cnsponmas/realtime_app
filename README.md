三天前的晚上，躺着刷抖音和新闻的我，突然想到，不知道自己能为这次的疫情做点什么，作为一个App程序猿，好像就是开发一个App，打开掘金后，推送给我[CrazyQ1的这篇文章](https://juejin.im/post/5e2c8ba3e51d4557e86e9b8c)，当即阅读了一遍，大佬已经先行一步，菜鸟也得跟上啊


先感谢几位免费提供Api的几位大佬

- https://lab.isaaclin.cn/nCoV/
- https://github.com/programmerauthor/spread-information

### 更新
#### 2020-2-9 新增防护知识页面
##### 1、 新增防护知识页面
分为个人防护、知识百科。
##### 2、 优化列表加载
新增item加载动画、加载前的loading(目前还不太满意，继续优化)
>后续继续优化页面渲染和一些其他优化项。
>ps：昨天返程了，路上折腾了一天，所以这两天更新比较少。

<img src="https://user-gold-cdn.xitu.io/2020/2/9/1702a0676a2b8e27?w=708&h=1402&f=png&s=493438" width=40%>


#### 2020-2-6 疫情地图上线、地区数据样式修改
##### 1、疫情地图 

之前一直困扰的疫情实时地图，目前是用本地web的方式加上去，加载速度会略慢，暂时只这种解决方案，后续有新的，再继续更新
ps：页面上的疫情地图是可以点的哟，不是图片哈

<img src="https://user-gold-cdn.xitu.io/2020/2/6/1701a79091992c35?w=708&h=1402&f=png&s=278552" width=40%>



##### 2、地区数据样式修改
稍微对各地区疫情数据的样式修改了下，之前的样式不够满意，现在的看着还行

<img src="https://user-gold-cdn.xitu.io/2020/2/6/1701a7a57a4933fd?w=708&h=1402&f=png&s=150735" width=40%>

### 准备

1、先把clone开源代码，参考一下其他开发者的框架代码，用了大佬写的几个Widget和图片，希望不要被打

![img](https://user-gold-cdn.xitu.io/2020/2/5/17014bb4ee8252c5?w=300&h=300&f=jpeg&s=18608)

2、看看Github上有没有相关的开源项目、API，我项目里用到了上面提到的两位大佬的API

3、天行数据的API

4、可以参考今日头条、百度的设计稿

### 项目介绍

<img src="https://user-gold-cdn.xitu.io/2020/2/6/1701a7bda12a1ef9?w=708&h=1402&f=png&s=302366" width=25%><img src="https://user-gold-cdn.xitu.io/2020/2/5/17014bd64f23b29b?w=136&h=467" width=25%><img src="https://user-gold-cdn.xitu.io/2020/2/5/17014bd9b6bde069?w=136&h=467" width=25%><img src="https://user-gold-cdn.xitu.io/2020/2/5/17014bdccfe6f7a7?w=136&h=467&f=png&s=404054" width=25%>

目前疫情地图的可视化展示基本都是web展示，flutter还未找到相应的实现方式，所以暂时使用web页面展示，是可以选中省查看数据的

趋势图用的是人家商业化的图表库：syncfusion_flutter_charts，就这个看着符合使用场景（比较酷）

#### 项目结构介绍

![img](https://user-gold-cdn.xitu.io/2020/2/5/17014ca72233ac4f?w=1096&h=412&f=png&s=78086)

#### 项目中的插件

- cached_network_image：网络图片加载库
- Dio：网络请求库
- rxdart：配合BLoC做状态管理
- flutter_webview_plugin：webview比较好用的库
- syncfusion_flutter_charts：强大的图片库，功能非常强大
- pull_to_refresh：上拉刷新下拉加载更多库

### 项目地址

GIthub：https://github.com/cnsponmas/realtime_app.git

其他好像没什么可以讲的，后续会继续更新的，补充一些其他模块，最重要的当然是疫情地图
#### 目前项目还有很多待优化的地方，页面的渲染速度，疫情地图等等，慢慢更新哈，有什么问题可以评论里回复，我会尽力解决的

![](https://user-gold-cdn.xitu.io/2020/2/6/1701a820dc709438?w=585&h=425&f=jpeg&s=20287)

## 大家没什么事就别出门了，像我一样，出门也要戴口罩，勤洗手

## 最后希望疫情赶紧过去，加油