//
//  GameMemberInfo.m
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import "GameMemberInfo.h"

@implementation GameMemberInfo
 
-(void)parseDataWithDic:(NSDictionary*)dic{
    
    self.guild_id = [dic[@"guild_id"] longValue];
    self.wizard_id = [dic[@"wizard_id"] longValue];
    self.grade = [dic[@"grade"] longValue];
    self.channel_uid = [dic[@"channel_uid"] longValue];
    self.wizard_level = [dic[@"wizard_level"] longValue];
    self.rating_id = [dic[@"rating_id"] longValue];
    self.arena_score = [dic[@"arena_score"] longValue];
    self.last_login_timestamp = [dic[@"last_login_timestamp"] longValue];
    self.join_timestamp = [dic[@"join_timestamp"] longValue];
    self.country = dic[@"country"];
    self.wizard_name = dic[@"wizard_name"];
}
@end
