//
//  GameBattleLogInfo.m
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import "GameBattleLogInfo.h"

@implementation GameBattleLogInfo

-(void)parseDataWithDic:(NSDictionary*)dic{
    self.log_type = [dic[@"log_type"] longValue];
    self.siege_id = [dic[@"siege_id"] longValue];
    self.match_id = [dic[@"match_id"] longValue];
    self.base_number = [dic[@"base_number"] longValue];
    self.guild_id = [dic[@"guild_id"] longValue];
    self.channel_uid = [dic[@"channel_uid"] doubleValue];
    self.wizard_id = [dic[@"wizard_id"] longValue];
    self.wizard_level = [dic[@"wizard_level"] longValue];
    self.opp_guild_id = [dic[@"opp_guild_id"] longValue];
    self.opp_channel_uid = [dic[@"opp_channel_uid"] longValue];
    self.opp_wizard_id = [dic[@"opp_wizard_id"] longValue];
    self.opp_wizard_level = [dic[@"opp_wizard_level"] longValue];
    self.win_lose = [dic[@"win_lose"] longValue];
    
    self.request_type = [dic[@"request_type"] longValue];
    self.match_score_var = [dic[@"match_score_var"] longValue];
    self.log_timestamp = [dic[@"log_timestamp"] longValue];
     
    self.guild_name = dic[@"guild_name"] ;
    self.wizard_name = dic[@"wizard_name"];
    self.opp_guild_name = dic[@"opp_guild_name"] ;
    self.opp_wizard_name = dic[@"opp_wizard_name"];
}
@end
