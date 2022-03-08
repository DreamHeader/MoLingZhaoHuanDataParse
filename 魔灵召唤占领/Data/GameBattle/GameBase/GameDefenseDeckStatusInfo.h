//
//  GameDefenseDeckStatusInfo.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameDefenseDeckStatusInfo : NSObject
//"siege_id":2022020304,
//"match_id":2022020304000003,
//"base_number":10,
//"defense_guild_id":30652,
//"deck_id":5729524,
//"status":3,
//"attack_guild_id":41512,
//"attack_wizard_id":3980712,
//"battle_start_time":1645173117
@property (assign,nonatomic)  int siege_id;
@property (assign,nonatomic)  int match_id;
@property (assign,nonatomic)  int base_number;
@property (assign,nonatomic)  int defense_guild_id;
@property (assign,nonatomic)  int deck_id;
@property (assign,nonatomic)  int status;
@property (assign,nonatomic)  int attack_guild_id;
@property (assign,nonatomic)  int attack_wizard_id;
@property (assign,nonatomic)  int battle_start_time;


-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
