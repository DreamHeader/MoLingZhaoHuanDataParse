//
//  GameSpecialBaseRuleInfo.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameSpecialBaseRuleInfo : NSObject
//"siege_id":2022020304,
//"match_id":2022020304000003,
//"guild_id":41512,
//"base_number":19,
//"rule_id":4,
//"set_wizard_id":17403765,
//"rule_begin_time":1645168629,
//"rule_end_time":0
@property (assign,nonatomic)  int siege_id;
@property (assign,nonatomic)  int match_id;
@property (assign,nonatomic)  int guild_id;
@property (assign,nonatomic)  int base_number;
@property (assign,nonatomic)  int rule_id;
@property (assign,nonatomic)  int set_wizard_id;
@property (assign,nonatomic)  int rule_begin_time;
@property (assign,nonatomic)  int rule_end_time; 
-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
