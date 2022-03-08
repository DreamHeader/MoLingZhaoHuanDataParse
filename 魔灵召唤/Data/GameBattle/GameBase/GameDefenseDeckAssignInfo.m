//
//  GameDefenseDeckAssignInfo.m
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import "GameDefenseDeckAssignInfo.h"

@implementation GameDefenseDeckAssignInfo
 
-(void)parseDataWithDic:(NSDictionary*)dic{
    self.base_number = [dic[@"base_number"] longValue];
    self.deck_id = [dic[@"deck_id"] longValue];
    self.status = [dic[@"status"] longValue];
}
@end
