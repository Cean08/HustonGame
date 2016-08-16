//
//  RequestPath.h
//  TRProject
//
//  Created by Cean on 16/7/19.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#ifndef RequestPath_h
#define RequestPath_h

/****************  资讯  ******************/

//#define kBasePath @"http://cache.tuwan.com"

#define kVideoAndPicPath @"http://cache.tuwan.com/app/?aid=%@&appid=1"
//头条
#define kTouTiaoPath @"http://cache.tuwan.com/app/?appid=1&classmore=indexpic&appid=1&appver=2.1&start=%ld"

//独家
#define kDuJiaPath  @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1&start=%ld"

//暗黑3
#define kAnHeiPath @"http://cache.tuwan.com/app/?appid=1&dtid=83623&classmore=indexpic&appid=1&appver=2.1&start=%ld"

//魔兽
#define kMoShouPath @"http://cache.tuwan.com/app/?appid=1&dtid=31537&classmore=indexpic&appid=1&appver=2.1&start=%ld"

//风暴
#define kFengBaoPath  @"http://cache.tuwan.com/app/?appid=1&dtid=31538&classmore=indexpic&appid=1&appver=2.1&start=%ld"

//炉石
#define kLuShiPath  @"http://cache.tuwan.com/app/?appid=1&dtid=31528&classmore=indexpic&appid=1&appver=2.1&start=%ld"

//星际2
#define kXingJiPath @"http://cache.tuwan.com/app/?appid=1&dtid=91821&appid=1&appver=2.1&start=%ld"

//守望
#define kShouWangPath @"http://cache.tuwan.com/app/?appid=1&dtid=57067&appid=1&appver=2.1&start=%ld"

//图片
#define kTuPianPath @"http://cache.tuwan.com/app/?appid=1&type=pic&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld"

//视频
#define kShiPinPath @"http://cache.tuwan.com/app/?appid=1&type=video&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld"

//攻略
#define kGongLuePath    @"http://cache.tuwan.com/app/?appid=1&type=guide&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld"

//幻化
#define kHuanHuaPath @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=幻化&appid=1&appver=2.1&start=%ld"

//趣闻
#define kQuWenPath  @"http://cache.tuwan.com/app/?appid=1&dtid=0&class=heronews&mod=趣闻&classmore=indexpic&appid=1&appver=2.1&start=%ld"

//COS
#define kCOSPath    @"http://cache.tuwan.com/app/?appid=1&class=cos&mod=cos&classmore=indexpic&dtid=0&appid=1&appver=2.1&start=%ld"

//美女
#define kMeiNvPath @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=美女&classmore=indexpic&typechild=cos1&appid=1&appver=2.1&start=%ld"
//推荐
#define kIntroPath @"http://api.tuwan.com/app/?appid=1&class=cookielike&id=334961,334948,334932,334882,334359,&appid=1&appver=2.1"


/****************  工具  ******************/
//#define kBasePath @""
#define kToolPath @"http://api.tuwan.com/app/?class=dbwallpaper&ver=2.1&appid=1"

//"key": "魔兽世界时光局"
#define kWowSgPath @"http://api.tuwan.com/wowsg/?type=getapp"

//"key": "风暴倒影大厅"
//英雄联赛的 MMR
#define kFlBLXPath @"http://cache.tuwan.com/app/?class=fblx&order=%@&appid=1"
//英雄联赛的 英雄
#define kFlashHeroPath @"http://cache.tuwan.com/app/?class=fblx&order=herodetails&type=pro&appid=1&m_type=%ld%@"

//"key": "风暴英雄库"
#define kHeroPath @"http://db.fb.tuwan.com/api/data.ashx?model=list&format=json&type=&appid=1"

//"key": "风暴天赋模拟器"

//"key": "魔兽世界追随者"

//"key": "联盟还是部落"

//"key": "魔兽世界玩具箱"
#define kToyPath @"http://db.wow.tuwan.com/api/data.ashx?type=toy&appid=1"

//玩具详情页
#define kDetailPath @"http://db.wow.tuwan.com/api/getitem.ashx?type=toy&id=%ld&appid=1"

#endif /* RequestPath_h */

/****************  圈子  ******************/
#define kItem3Path @"http://bbs.tuwan.com/plugin.php?id=api:index&module=bbs&class=forumlist&fid=72&appid=1&page=%ld&pagesize=10"

#define kAllReply @"http://bbs.tuwan.com/plugin.php?id=api:index&module=bbs&class=thread&appid=1&page=%ld&pagesize=10&tid=%@"

/****************  其他  ******************/

