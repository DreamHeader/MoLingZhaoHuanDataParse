//
//  GameSpecialBaseRuleInfo.m
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import "GameSpecialBaseRuleInfo.h"

@implementation GameSpecialBaseRuleInfo
 
-(void)parseDataWithDic:(NSDictionary*)dic{
    self.siege_id = [dic[@"siege_id"] longValue];
    self.match_id = [dic[@"match_id"] longValue];
    self.guild_id = [dic[@"guild_id"] longValue];
    self.base_number = [dic[@"base_number"] longValue];
    self.rule_id = [dic[@"rule_id"] longValue];
    self.set_wizard_id = [dic[@"set_wizard_id"] longValue];
    self.rule_begin_time = [dic[@"rule_begin_time"] longValue];
    self.rule_end_time = [dic[@"rule_end_time"] longValue];
}
@end
