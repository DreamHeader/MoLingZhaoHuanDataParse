//
//  GameBattleGuildInfo.m
//  gameBattle
//
//  Created by Future on 2022/2/21.
//

#import "GameBattleGuildInfo.h"

@implementation GameBattleGuildInfo

-(void)parseDataWithDic:(NSDictionary *)dic{
    self.siege_id = [dic[@"siege_id"] longValue];
    self.guild_id = [dic[@"guild_id"] longValue];
    self.match_id = [dic[@"match_id"] longValue];
    self.rating_id = [dic[@"rating_id"] longValue];
    self.pos_id = [dic[@"pos_id"] longValue];
    self.match_score = [dic[@"match_score"] doubleValue];
    self.match_score_increment = [dic[@"match_score_increment"] longValue];
    self.match_rank = [dic[@"match_rank"] longValue];
    self.disqualified = [dic[@"disqualified"] longValue];
    self.play_member_count = [dic[@"play_member_count"] longValue];
    self.attack_count = [dic[@"attack_count"] longValue];
    self.attack_unit_count = [dic[@"attack_unit_count"] longValue];
    self.master_channel_uid = [dic[@"master_channel_uid"] longValue];
    self.guild_name = dic[@"guild_name"] ;
    self.match_score_last_update_time = dic[@"match_score_last_update_time"];
}
@end
