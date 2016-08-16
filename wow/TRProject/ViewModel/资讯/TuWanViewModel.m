//
//  TuWanViewModel.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel

- (NSString *)aidForRow:(NSInteger)row{

    return self.dataList[row].aid;

}
- (NSString *)adAidForRow:(NSInteger)row{
    return self.adList[row].aid;

}
//判定并返回广告的数据类型
- (DetailType)adTypeForRow:(NSInteger)row{
    NSString *type = self.adList[row].type;
    if ([type isEqualToString:@"video"]) {
        return DetailTypeVideo;
    }if ([type isEqualToString:@"pic"]) {
        return DetailTypePic;
    }
    return DetailTypeHTML;

}
//判定并返回非广告的数据类型
- (DetailType)typeForRow:(NSInteger)row{
    NSString *type = self.dataList[row].type;
    if ([type isEqualToString:@"video"]) {
        return DetailTypeVideo;
    }if ([type isEqualToString:@"pic"]) {
        return DetailTypePic;
    }
    return DetailTypeHTML;

}

- (NSURL *)videoURLForRow:(NSInteger)row{
    return self.dataList[row].murl.crow_URL;
}
- (NSURL *)adVideoURLForRow:(NSInteger)row{
    return self.adList[row].murl.crow_URL;
}
- (NSURL *)htmlURLForRow:(NSInteger)row{
    return self.dataList[row].html5.ct_URL;
}
- (NSURL *)adHtmlURLForRow:(NSInteger)row{
    return self.adList[row].html5.ct_URL;
}

-(NSMutableArray<TuWanListModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}
//根据下拉与上拉两种情况，先做出判断，然后发送不同的请求，并对数据进行相应的处理
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler{
//-(void)getRequestModel:(RequestModel)requestModel completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpStart = 0;
    if (requestMode == RequestModeMore) {
        tmpStart = _start + 11;
    } self.dataTask = [TuWanNetWorking getTuWanData:_msgType start:tmpStart completionHandler:^(TuWanModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
                self.adList = model.indexpic;//这里直接给广告数组赋值
            }
            [self.dataList addObjectsFromArray:model.list];
            _start = tmpStart;
        }
        
        ! completionHandler ?: completionHandler(error);
    }];

}
//创建一个bool方法来判断是哪一类cell
-(BOOL)hasPic:(NSInteger)row{

    return [self.dataList[row].showtype isEqualToString:@"1"];
}
//这里要返回一组照片，故用一个数组来接收，通过遍历将数据取出，记得是URL类型，用copy将数组由可变转换为不可变
-(NSArray<NSURL *> *)picList:(NSInteger)row{
    NSMutableArray *tmpArr = [NSMutableArray new];
    [self.dataList[row].showitem enumerateObjectsUsingBlock:^(TuWanShowitemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tmpArr addObject:obj.pic.ct_URL];
    }];
    return tmpArr.copy;
}
-(NSString *)click:(NSInteger)row{
    NSInteger tmpClick = self.dataList[row].click.integerValue;
    if (tmpClick >10000) {
        return [NSString stringWithFormat:@"%.1f人浏览",tmpClick/10000.0];
    }else {
        return [NSString stringWithFormat:@"%ld人浏览",tmpClick];
    }
}
-(NSString *)title:(NSInteger)row{

    return self.dataList[row].title;
}

-(NSURL *)pic:(NSInteger)row{
    return self.dataList[row].litpic.ct_URL;
}
-(NSString *)detail:(NSInteger)row{
    return self.dataList[row].desc;
}

-(instancetype)initWithMsgType:(TuWanMsgType)msgType{
    if (self = [super init]) {
        _msgType = msgType;
    }
    return self;
}

-(NSInteger) rowNumber{
    return self.dataList.count;

}

//- (NSArray<TuWanListModel *> *)adList{
//    if (!_adList) {
//        _adList = [NSArray new];
//    }
//    return _adList;
//}

- (BOOL)hasAD{
    return self.adList != nil;

}
-(NSInteger)adNumber{
    return self.adList.count;
}
-(NSURL *)adIconURL:(NSInteger)row{
    return self.adList[row].litpic.ct_URL;

}
- (NSString *)adTitle:(NSInteger)row{

    return self.adList[row].title;
}

@end
