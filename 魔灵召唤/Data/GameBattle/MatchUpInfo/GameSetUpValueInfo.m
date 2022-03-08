//
//  GameSetUpValueInfo.m
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import "GameSetUpValueInfo.h"

@implementation GameSetUpValueInfo
-(void)parseDataWithDic:(NSDictionary*)dic{
    self.max_match_score = [dic[@"max_match_score"] longValue];
    self.max_deck_count_per_member = [dic[@"max_deck_count_per_member"] longValue];
    self.max_attack_unit_count = [dic[@"max_attack_unit_count"] longValue];
    self.my_attack_unit_count_left = [dic[@"my_attack_unit_count_left"] longValue];
    self.war_rest_start_time = [dic[@"war_rest_start_time"] longValue];
    self.war_rest_finish_time = [dic[@"war_rest_finish_time"] longValue];
}
@end
