//
//  GameBattleModel.m
//  gameBattle
//
//  Created by Future on 2022/2/17.
//

#import "GameBattleModel.h"

@implementation GameBattleModel

-(instancetype)init{
    self = [super init];
    if (self) {
        self.wizard_id = 0;
        self.matchup_info = [[GameMatchupInfo alloc]init];
        self.attack_log =  [[GameAttackLog alloc]init];
        self.defense_log =  [[GameAttackLog alloc]init];
    }
    return  self;
}
-(void)parseDataWithDic:(NSDictionary *)dic{
    
    if (!dic|| dic.allKeys.count == 0) {
        return;
    }
    if (![dic isKindOfClass:[NSDictionary class]]) {
        return;
    }
    self.wizard_id = [dic[@"wizard_id"] longValue];
    id objc = nil;
    if ((objc=dic[@"matchup_info"])!=nil && [objc isKindOfClass:[NSDictionary class]]) {
        [self.matchup_info parseDataWithDic:objc];
    }
    
    if ((objc=dic[@"attack_log"])!=nil && [objc isKindOfClass:[NSDictionary class]]) {
        [self.attack_log parseDataWithDic:objc];
    }
    
    if ((objc=dic[@"defense_log"])!=nil && [objc isKindOfClass:[NSDictionary class]]) {
        [self.defense_log parseDataWithDic:objc];
    }
}


@end
