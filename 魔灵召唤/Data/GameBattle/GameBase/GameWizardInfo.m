//
//  GameWizardInfo.m
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import "GameWizardInfo.h"

@implementation GameWizardInfo
//@property (strong,nonatomic)  NSString * wizard_name;
//@property (assign,nonatomic)  int wizard_id;
//@property (assign,nonatomic)  int channel_uid;
//@property (assign,nonatomic)  int rating_id;
//@property (assign,nonatomic)  int guild_id;
-(void)parseDataWithDic:(NSDictionary *)dic{
    self.wizard_name = dic[@"wizard_name"];
    self.wizard_id = [dic[@"wizard_id"] longValue];
    self.channel_uid = [dic[@"channel_uid"] longValue];
    self.rating_id = [dic[@"rating_id"] longValue];
    self.guild_id = [dic[@"guild_id"] longValue];
}
@end
