//
//  GameDefenseDeckStatusInfo.m
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import "GameDefenseDeckStatusInfo.h"

@implementation GameDefenseDeckStatusInfo
 
- (void)parseDataWithDic:(NSDictionary *)dic{
    
    self.siege_id = [dic[@"siege_id"] longValue];
    self.match_id = [dic[@"match_id"] longValue];
    self.base_number = [dic[@"base_number"] longValue];
    self.defense_guild_id = [dic[@"defense_guild_id"] longValue];
    self.deck_id = [dic[@"deck_id"] longValue];
    self.status = [dic[@"status"] longValue];
    self.attack_guild_id = [dic[@"attack_guild_id"] longValue];
    self.attack_wizard_id = [dic[@"attack_wizard_id"] longValue];
    self.battle_start_time = [dic[@"battle_start_time"] longValue];
}
@end
