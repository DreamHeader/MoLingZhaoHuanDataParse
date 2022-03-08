//
//  GameDataManage.m
//  魔灵召唤占领
//
//  Created by Future on 2022/2/22.
//

#import "GameDataManage.h"
#import "GameMemberPerInfo.h"

@interface GameDataManage()

@end
@implementation GameDataManage

+ (instancetype)shareManage{
    
    static GameDataManage * manage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manage = [[GameDataManage alloc]init];
    });
    return  manage;
}
-(void)downloadBattleData{
    /* 创建网络下载对象 */
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSString * urlStr = [NSString stringWithFormat:@"http://r7sp55fr1.hn-bkt.clouddn.com/SiegeMatch-2022020304000003.json"];
    /* 下载地址 */
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    /* 下载路径 */
    NSString *path = NSHomeDirectory();
    NSString *filePath = [path stringByAppendingPathComponent:url.lastPathComponent];
    /* 开始请求下载 */
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"下载进度：%.0f％", downloadProgress.fractionCompleted * 100);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //如果需要进行UI操作，需要获取主线程进行操作
        });
        /* 设定下载到的位置 */
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"%@",error);
        [self parseGameBattleData:filePath.absoluteString];
    }];
    [downloadTask resume];
}
-(void)parseGameBattleData:(NSString*)filePath {
    NSMutableString * fileMutPath = [[NSMutableString alloc]initWithString:filePath];
    [fileMutPath replaceCharactersInRange:NSMakeRange(0, 8) withString:@""];
    NSData * battleData =[[NSData alloc] initWithContentsOfFile:fileMutPath];
    if (!battleData) {
        NSString * curpath = [[NSBundle mainBundle] pathForResource:@"info" ofType:@"json"];
        battleData = [[NSData alloc]initWithContentsOfURL:[NSURL fileURLWithPath:curpath]];
    }
    NSString *receiveStr = [[NSString alloc]initWithData:battleData encoding:NSUTF8StringEncoding];
    
    NSData * datas = [receiveStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingMutableLeaves error:nil];
    
    self.dataModel = [[GameBattleModel alloc]init];
    [self.dataModel parseDataWithDic:jsonDict];
    
}
-(void)parseGameBattleData{
    //    NSString * urlStr = [NSString stringWithFormat:@"http://r7sp55fr1.hn-bkt.clouddn.com/SiegeMatch-2022020304000003.json"];
    //    /* 下载地址 */
    //    NSURL *url = [NSURL URLWithString:urlStr];
    //    NSData * battleData =[[NSData alloc]initWithContentsOfURL:url];
    //    if (!battleData) {
    NSString * curpath = [[NSBundle mainBundle] pathForResource:@"info" ofType:@"json"];
    NSData * battleData = [[NSData alloc]initWithContentsOfURL:[NSURL fileURLWithPath:curpath]];
    //    }
    NSString *receiveStr = [[NSString alloc]initWithData:battleData encoding:NSUTF8StringEncoding];
    
    NSData * datas = [receiveStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingMutableLeaves error:nil];
    
    self.dataModel = [[GameBattleModel alloc]init];
    [self.dataModel parseDataWithDic:jsonDict];
    
}
-(long)getMachId{
    long machId = 0;
    NSDictionary * dic = [self.dataModel.matchup_info.match_info copy];
    if (dic) {
        machId = [dic[@"match_id"] longValue];
    }
    return  machId;
}
-(long)getSelfGuildId{
    NSArray * arr = [self.dataModel.matchup_info.member_info_list copy];
    GameMemberInfo * model = arr.firstObject;
    return  model.guild_id;
}
-(GameBattleGuildInfo *)getSelfGuildInfo{
    return  [self getGuildInfo:[self getSelfGuildId]];
}
-(GameBattleGuildInfo *)getGuildInfo:(long)guildInfo{
    GameBattleGuildInfo * selfGuildmodel = nil;
    NSArray * array = [self.dataModel.matchup_info.guild_list copy];
    for (GameBattleGuildInfo * model in array) {
        if (model.guild_id == guildInfo) {
            selfGuildmodel = model;
            break;
        }
    }
    return  selfGuildmodel;
}
-(long)getSelfGuildAttackCount {
    long attactWinCount = 0;
    NSArray * dataSource = [self.dataModel.attack_log.log_list copy];
    NSArray * battleInfoList = nil;
    for (GameAttackPerInfo * model in dataSource) {
        NSArray * guildInfoArr = model.guild_info_list;
        if (guildInfoArr.count == 0) {
            continue;
        }
        GameBattleGuildInfo * guildModel = guildInfoArr.firstObject;
        if (guildModel.match_id == [self getMachId]) {
            battleInfoList = [model.battle_log_list copy];
            break;
        }
    }
    if (battleInfoList&&battleInfoList.count > 0 ) {
        for (GameBattleLogInfo * battleInfo in battleInfoList) {
            if (battleInfo.win_lose == 1) {
                attactWinCount++;
            }
        }
    }
    return  attactWinCount;
}

-(long)getAttackCount:(long)userId{
    NSArray * used_unit_count_list = [self.dataModel.matchup_info.used_unit_count_list copy];
    long attackCount = 0;
    for (GameUsedUnitCountInfo * model in used_unit_count_list) {
        if (model.wizard_id ==  userId) {
            attackCount = (model.used_unit_count/3.0);
            break;
        }
    }
    return  attackCount;
    
}
-(long)getAttackWinCount:(long)userId{
    long attactWinCount = 0;
    NSArray * dataSource = [self.dataModel.attack_log.log_list copy];
    NSArray * battleInfoList = nil;
    for (GameAttackPerInfo * model in dataSource) {
        NSArray * guildInfoArr = model.guild_info_list;
        if (guildInfoArr.count == 0) {
            continue;
        }
        GameBattleGuildInfo * guildModel = guildInfoArr.firstObject;
        if (guildModel.match_id == [self getMachId]) {
            battleInfoList = [model.battle_log_list copy];
            break;
        }
    }
    if (battleInfoList&&battleInfoList.count > 0 ) {
        for (GameBattleLogInfo * battleInfo in battleInfoList) {
            if (battleInfo.win_lose == 1&&battleInfo.wizard_id == userId) {
                attactWinCount++;
            }
        }
    }
    return  attactWinCount;
}
-(long)getAttackLoseCount:(long)userId{
    long attactLoseCount = 0;
    NSArray * dataSource = [self.dataModel.attack_log.log_list copy];
    NSArray * battleInfoList = nil;
    for (GameAttackPerInfo * model in dataSource) {
        NSArray * guildInfoArr = model.guild_info_list;
        if (guildInfoArr.count == 0) {
            continue;
        }
        GameBattleGuildInfo * guildModel = guildInfoArr.firstObject;
        if (guildModel.match_id == [self getMachId]) {
            battleInfoList = [model.battle_log_list copy];
            break;
        }
    }
    if (battleInfoList&&battleInfoList.count > 0 ) {
        for (GameBattleLogInfo * battleInfo in battleInfoList) {
            if (battleInfo.win_lose == 2&&battleInfo.wizard_id == userId) {
                attactLoseCount++;
            }
        }
    }
    return attactLoseCount;
}
-(long)getDefenseAllCount:(long)userId{
    long defenseAllCount = 0;
    NSArray * dataSource = [self.dataModel.defense_log.log_list copy];
    NSArray * battleInfoList = nil;
    for (GameAttackPerInfo * model in dataSource) {
        NSArray * guildInfoArr = model.guild_info_list;
        if (guildInfoArr.count == 0) {
            continue;
        }
        GameBattleGuildInfo * guildModel = guildInfoArr.firstObject;
        if (guildModel.match_id == [self getMachId]) {
            battleInfoList = [model.battle_log_list copy];
            break;
        }
    }
    if (battleInfoList&&battleInfoList.count > 0 ) {
        for (GameBattleLogInfo * battleInfo in battleInfoList) {
            if (battleInfo.wizard_id == userId) {
                defenseAllCount++;
            }
        }
    }
    return defenseAllCount;
}
-(long)getDefenseWinCount:(long)userId{
    long defenseWinCount = 0;
    NSArray * dataSource = [self.dataModel.defense_log.log_list copy];
    NSArray * battleInfoList = nil;
    for (GameAttackPerInfo * model in dataSource) {
        NSArray * guildInfoArr = model.guild_info_list;
        if (guildInfoArr.count == 0) {
            continue;
        }
        GameBattleGuildInfo * guildModel = guildInfoArr.firstObject;
        if (guildModel.match_id == [self getMachId]) {
            battleInfoList = [model.battle_log_list copy];
            break;
        }
    }
    if (battleInfoList&&battleInfoList.count > 0 ) {
        for (GameBattleLogInfo * battleInfo in battleInfoList) {
            if (battleInfo.win_lose == 1&&battleInfo.wizard_id == userId) {
                defenseWinCount++;
            }
        }
    }
    return defenseWinCount;
}
-(long)getDefenseLoseCount:(long)userId {
    long defenseLoseCount = 0;
    NSArray * dataSource = [self.dataModel.defense_log.log_list copy];
    NSArray * battleInfoList = nil;
    for (GameAttackPerInfo * model in dataSource) {
        NSArray * guildInfoArr = model.guild_info_list;
        if (guildInfoArr.count == 0) {
            continue;
        }
        GameBattleGuildInfo * guildModel = guildInfoArr.firstObject;
        if (guildModel.match_id == [self getMachId]) {
            battleInfoList = [model.battle_log_list copy];
            break;
        }
    }
    if (battleInfoList&&battleInfoList.count > 0 ) {
        for (GameBattleLogInfo * battleInfo in battleInfoList) {
            if (battleInfo.win_lose == 2&&battleInfo.wizard_id == userId) {
                defenseLoseCount++;
            }
        }
    }
    return defenseLoseCount;
}
-(NSArray*)getSetUpTotalMemberInfo {
    NSMutableArray * setUpDataSource = [[NSMutableArray alloc]init];
    NSArray * memberInfoArr = [[GameDataManage shareManage].dataModel.matchup_info.member_info_list copy];
    for (GameMemberInfo* model in memberInfoArr) {
        GameMemberPerInfo * newData = [[GameMemberPerInfo alloc]init];
        newData.guild_id = model.guild_id;
        newData.wizard_id = model.wizard_id;
        newData.grade = model.grade;
        newData.channel_uid = model.channel_uid;
        newData.country = model.country;
        newData.wizard_name = model.wizard_name;
        newData.wizard_level = model.wizard_level;
        newData.rating_id = model.rating_id;
        newData.arena_score = model.arena_score;
        newData.last_login_timestamp = model.last_login_timestamp;
        newData.join_timestamp = model.join_timestamp;
        
        double attackAllCount = [[GameDataManage shareManage] getAttackCount:model.wizard_id];
        double attackWinCount = [[GameDataManage shareManage] getAttackWinCount:model.wizard_id];
        double attackLoseCount = [[GameDataManage shareManage] getAttackLoseCount:model.wizard_id];
        
        double defenseAllCount = [[GameDataManage shareManage] getDefenseAllCount:model.wizard_id];
        double defenseWinCount = [[GameDataManage shareManage] getDefenseWinCount:model.wizard_id];
        double defenseLoseCount = [[GameDataManage shareManage] getDefenseLoseCount:model.wizard_id];
        
        newData.attact_win_count = attackWinCount;
        newData.attact_lose_count = attackLoseCount;
        newData.attact_total_count = attackAllCount;
        newData.defense_win_count = defenseWinCount;
        newData.defense_lose_count = defenseLoseCount;
        newData.defense_total_count = defenseAllCount;
        newData.battleScore = attackWinCount*15+defenseWinCount*5;
        [setUpDataSource addObject:newData];
    }
    return [setUpDataSource copy];
}
// 攻击方的当前场次的数据
-(GameAttackPerInfo*)getAttackPerInfoData{
    
    NSArray * attackLogArray = [self.dataModel.attack_log.log_list copy];
    GameAttackPerInfo *curAttackModel = nil; // 找到对应的战斗场次的id 数据
    for (GameAttackPerInfo *model in attackLogArray) {
        NSArray * guildInfoList = [model.guild_info_list copy];
        if (guildInfoList.count > 0) {
            GameBattleGuildInfo * guildInf = guildInfoList.firstObject;
            if (guildInf.match_id == [self getMachId]) {
                curAttackModel =  model;
            }
        }
    }
    return curAttackModel;
}
// 防守方的当前场次的数据
-(GameAttackPerInfo*)getDefensePerInfoData{
    NSArray * attackLogArray = [self.dataModel.defense_log.log_list copy];
    GameAttackPerInfo *curAttackModel = nil; // 找到对应的战斗场次的id 数据
    for (GameAttackPerInfo *model in attackLogArray) {
        NSArray * guildInfoList = [model.guild_info_list copy];
        if (guildInfoList.count > 0) {
            GameBattleGuildInfo * guildInf = guildInfoList.firstObject;
            if (guildInf.match_id == [self getMachId]) {
                curAttackModel =  model;
            }
        }
    }
    return curAttackModel;
}
// 获取除了自己其他的公会基本信息
-(NSArray*)getOtherGuildInfo{
    GameAttackPerInfo *curAttackModel = [self getAttackPerInfoData];
    NSMutableArray * arr = [NSMutableArray arrayWithArray:curAttackModel.guild_info_list];
    for (GameBattleGuildInfo * info in arr) {
        if (info.guild_id == [self getSelfGuildId]) {
            [arr removeObject:info];
            break;
        }
    }
    return  arr;
}


// 获取 公会 PK 公会 总计的攻击次数
/*
 type
 0 获取攻击次数(只能看自己对别人 别人对自己 不能看 别人 对别人)。
 1 获取攻击成功次数(只能看自己对别人 别人对自己 不能看 别人 对别人)。 2 获取防守的次数 (只能看自己对别人 别人对自己 不能看 别人 对别人)。
 3 获取防守成功次数(只能看自己对别人 别人对自己 不能看 “别人” 对“别人”)
 */
-(long)getGuildAttackOtherGuildData:(long)attackGuildId defenseGuildId:(long)defenseGuildId type:(int)type{
    NSArray * typeArr = @[@(0),@(1),@(2),@(3)];
    // 没有的类型 不予以统计
    if (![typeArr containsObject:@(type)] ) {
        return 0;
    }
    // 攻击方和防守方一样就不给予计算了
    if (attackGuildId == defenseGuildId) {
        return  0;
    }
    GameAttackPerInfo *curAttackModel = [self getAttackPerInfoData];
    GameAttackPerInfo *curDefenseModel = [self getDefensePerInfoData];
    if (!curAttackModel||!curDefenseModel) {
        return  0;
    }
    long count = 0; //  type   0 获取攻击次数。 1 获取攻击成功次数 2 获取防守的次数  3 获取防守成功次数
    if (type == 0 || type == 1) {
        NSArray * battleList = (attackGuildId == [self getSelfGuildId]) ? curAttackModel.battle_log_list : curDefenseModel.battle_log_list;
        for (GameBattleLogInfo*battleInfo in battleList) {
            // 0 获取攻击次数
            if (type == 0) {
                if (attackGuildId == [self getSelfGuildId]) {
                    if (battleInfo.guild_id == attackGuildId && battleInfo.opp_guild_id == defenseGuildId) {
                        count ++;
                    }
                }else{
                    if (battleInfo.opp_guild_id == attackGuildId && battleInfo.guild_id == defenseGuildId) {
                        count ++;
                    }
                }
            }else if (type == 1){ // 1 获取攻击成功次数
                if (attackGuildId == [self getSelfGuildId]) {
                    if (battleInfo.guild_id == attackGuildId && battleInfo.opp_guild_id == defenseGuildId&&battleInfo.win_lose == 1) {
                        count ++;
                    }
                }else{
                    if (battleInfo.opp_guild_id == attackGuildId && battleInfo.guild_id == defenseGuildId&&battleInfo.win_lose == 2) {
                        count ++;
                    }
                }
            }
        }
    }else{
        NSArray * battleList = (attackGuildId == [self getSelfGuildId]) ? curDefenseModel.battle_log_list : curAttackModel.battle_log_list;
        for (GameBattleLogInfo*battleInfo in battleList) {
            if (type == 2) { // 2 获取防守的次数
                if (attackGuildId == [self getSelfGuildId]) {
                    if (battleInfo.guild_id == attackGuildId && battleInfo.opp_guild_id == defenseGuildId) {
                        count ++;
                    }
                }else{
                    if (battleInfo.opp_guild_id == attackGuildId && battleInfo.guild_id == defenseGuildId) {
                        count ++;
                    }
                }
            }else if (type == 3){ // 3 获取防守成功次数
                if (attackGuildId == [self getSelfGuildId]) {
                    if (battleInfo.guild_id == attackGuildId && battleInfo.opp_guild_id == defenseGuildId&&battleInfo.win_lose == 1) {
                        count ++;
                    }
                }else{
                    if (battleInfo.opp_guild_id == attackGuildId && battleInfo.guild_id == defenseGuildId&&battleInfo.win_lose == 2) {
                        count ++;
                    }
                }
            }
            
        }
    }
    return  count;
}
@end
