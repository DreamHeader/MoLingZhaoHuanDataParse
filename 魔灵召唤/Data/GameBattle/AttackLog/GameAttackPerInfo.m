//
//  GameAttackPerInfo.m
//  gameBattle
//
//  Created by Future on 2022/2/21.
//

#import "GameAttackPerInfo.h"

@implementation GameAttackPerInfo


-(void)parseDataWithDic:(NSDictionary*)dic{
     
    self.season_type = [dic[@"season_type"] longValue];
    
    NSMutableArray * dataArray = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"guild_info_list"] ) {
        GameBattleGuildInfo * info = [[GameBattleGuildInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArray addObject:info];
    }
    self.guild_info_list = [dataArray copy];
    
    NSMutableArray * dataArrayOne = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"battle_log_list"] ) {
        GameBattleLogInfo * info = [[GameBattleLogInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArrayOne addObject:info];
    }
    self.battle_log_list = [dataArrayOne copy];
}
@end
