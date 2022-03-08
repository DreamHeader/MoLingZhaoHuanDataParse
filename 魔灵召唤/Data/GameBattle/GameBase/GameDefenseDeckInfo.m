//
//  GameDefenseDeckInfo.m
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import "GameDefenseDeckInfo.h"

@implementation GameDefenseDeckInfo

- (void)parseDataWithDic:(NSDictionary *)dic{
    
    self.deck_id = [dic[@"deck_id"] longValue];
    self.wizard_id = [dic[@"wizard_id"] longValue];
    self.total_win_count = [dic[@"total_win_count"] longValue];
    self.total_draw_count = [dic[@"total_draw_count"] longValue];
    self.total_lose_count = [dic[@"total_lose_count"] longValue];
    self.win_count = [dic[@"win_count"] longValue];
    self.draw_count = [dic[@"draw_count"] longValue];
    self.lose_count = [dic[@"lose_count"] longValue];
    self.total_count = [dic[@"total_count"] longValue];
    self.winning_rate = [dic[@"winning_rate"] longValue];
}
@end
