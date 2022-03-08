//
//  GameBattleBaseInfo.m
//  gameBattle
//
//  Created by Future on 2022/2/21.
//

#import "GameBattleBaseInfo.h"

@implementation GameBattleBaseInfo 
-(void)parseDataWithDic:(NSDictionary *)dic{
    self.siege_id = [dic[@"siege_id"] longValue];
    self.match_id = [dic[@"match_id"] longValue];
    self.base_number = [dic[@"base_number"] longValue];
    self.base_type = [dic[@"base_type"] longValue];
    self.guild_id = [dic[@"guild_id"] longValue];
    self.base_status = [dic[@"base_status"] longValue];
    self.battle_start_time = [dic[@"battle_start_time"] longValue];
    self.construct_time = [dic[@"construct_time"] longValue];
}
@end
