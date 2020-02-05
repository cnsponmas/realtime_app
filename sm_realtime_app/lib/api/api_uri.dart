
class ApiUri {
  static const String GET_HOST = 'http://49.232.173.220:3001';

  static const String POST_HOST = 'https://www.leviatan.cn/2019-nCoV';

  /// 按时间线获取事件
  static const String TIMELINE = '/data/getTimelineService';

  /// 获取整体统计信息
  static const String STATISTICS = '/data/getStatisticsService';

  /// 获取指定省份信息，例如：/data/getAreaStat/山东
  static const String AREASTAT = '/data/getAreaStat/';

  /// 获取最新事件
  static const String NEWST = '/data/getNewest/';

  /// 最新辟谣
  static const String RUNMOR = '/data/getIndexRumorList';

  /// 最新防护知识
  static const String RECOMMEND = '/data/getIndexRecommendList';

  /// 最新知识百科
  static const String WIKI = '/data/getWikiList';

  /// 诊疗信息
  static const String ENTRIES = '/data/getEntries';

  /// 全国省份级患者分布数据
  static const String CHINA = '/data/getListByCountryTypeService1';

  /// 全球海外其他地区患者分布数据
  static const String OVERSEAS = '/data/getListByCountryTypeService2';

  /// 获取整体统计信息
  static const String ALL = '/data/getStatisticsService';

  /// 天行数据 Host
  static const String TIANXING_HOST = 'http://api.tianapi.com';

  /// 天行数据 最新事件
  static const String TX_INFO = '/txapi/ncov/index';

  /// 天行数据 辟谣
  static const String TX_RUNMOR = '/txapi/rumour/index';

  /// 天行数据 数据汇总
  static const String TX_DATA = '/txapi/ncovcity/index';

  static const String TX_KEY = '6f23b0f9136968b34581ef838f02989a';

  static const String LAB_HOST = 'https://lab.ahusmart.com';

  static const String LAB_DATA = '/nCoV/api/overall';

  static const String LAL_AREA = '/nCoV/api/area';

  static const String LAB_NEWS = '/nCoV/api/news';
}