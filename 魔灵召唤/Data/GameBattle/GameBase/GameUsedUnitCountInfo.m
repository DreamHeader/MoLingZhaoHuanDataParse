//
//  GameUsedUnitCountInfo.m
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import "GameUsedUnitCountInfo.h"

@implementation GameUsedUnitCountInfo
//@property (assign,nonatomic)  int wizard_id;
//@property (assign,nonatomic)  int used_unit_count;
-(void)parseDataWithDic:(NSDictionary*)dic{
    self.wizard_id = [dic[@"wizard_id"] longValue];
    
    self.used_unit_count = [dic[@"used_unit_count"] longValue];
}
@end
