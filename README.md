# Flutter - 疫情实况，加油武汉

三天前的晚上，躺着刷抖音和新闻的我，突然想到，不知道自己能为这次的疫情做点什么，作为一个App程序猿，好像就是开发一个App，打开掘金后，推送给我[CrazyQ1的这篇文章](https://juejin.im/post/5e2c8ba3e51d4557e86e9b8c)，当即阅读了一遍，大佬已经先行一步，菜鸟也得跟上啊



先感谢几位免费提供Api的几位大佬

- https://lab.isaaclin.cn/nCoV/
- https://github.com/programmerauthor/spread-information

### 更新
#### 疫情地图上线、地区数据样式修改 - 2020-2-6
1、疫情地图 

之前一直困扰的疫情实时地图，目前是用本地web的方式加上去，加载速度会略慢，暂时只这种解决方案，后续有新的，再继续更新

ps：页面上的疫情地图是可以点的哟，不是图片哈

<img src="https://user-gold-cdn.xitu.io/2020/2/6/1701a79091992c35?w=708&h=1402&f=png&s=278552" width = 30%>



2、地区数据样式修改
稍微对各地区疫情数据的样式修改了下，之前的样式不够满意，现在的看着还行

<img src="https://user-gold-cdn.xitu.io/2020/2/6/1701a7a57a4933fd?w=708&h=1402&f=png&s=150735" width=30%>



### 准备

1、先把大佬的代码clone一遍，看看大佬怎么写的，用了大佬写的几个Widget和图片，希望不要被打

![img](https://user-gold-cdn.xitu.io/2020/2/5/17014bb4ee8252c5?w=300&h=300&f=jpeg&s=18608)

2、看看Github上有没有相关的开源项目、API，我项目里用到了上面提到的两位大佬的API

3、天行数据的API

4、可以参考今日头条、百度的设计稿

### 项目介绍

<img src="https://user-gold-cdn.xitu.io/2020/2/6/1701a7bda12a1ef9?w=708&h=1402&f=png&s=302366" width=25%><img src="https://user-gold-cdn.xitu.io/2020/2/5/17014bd64f23b29b?w=136&h=467" width=25%><img src="https://user-gold-cdn.xitu.io/2020/2/5/17014bd9b6bde069?w=136&h=467" width=25%><img src="https://user-gold-cdn.xitu.io/2020/2/5/17014bdccfe6f7a7?w=136&h=467&f=png&s=404054" width=25%>


比较烦的几个点，就是数据展示。看了头条、百度啊各种疫情地图，深感自己太菜。所有的疫情地图都是Web画的，Flutter实现比较困难，接着接续尝试，暂时就没把疫情地图放上去。

趋势图用的是人家商业化的图表库：syncfusion_flutter_charts，就这个看着符合使用场景（比较酷）

**项目结构介绍**



![img](https://user-gold-cdn.xitu.io/2020/2/5/17014ca72233ac4f?w=1096&h=412&f=png&s=78086)

- 路由使用的是法法注解路由
- 网络请求使用的是Dio
- 状态管理使用的是BLoC方案

### 项目地址

码云：https://gitee.com/sponmas/realtime_info_app.git

GIthub：https://github.com/cnsponmas/realtime_app.git

其他好像没什么可以讲的，后续会继续更新的，补充一些其他模块，最重要的当然是疫情地图
#### 目前项目还有很多待优化的地方，页面的渲染速度，疫情地图等等，慢慢更新哈，有什么问题可以[掘金评论](https://juejin.im/post/5e3a9a9651882549215cc6d7)里回复，我会尽力解决的

![](https://user-gold-cdn.xitu.io/2020/2/6/1701a820dc709438?w=585&h=425&f=jpeg&s=20287)

## 大家没什么事就别出门了，像我一样，出门也要戴口罩，勤洗手

## 最后希望疫情赶紧过去，加油