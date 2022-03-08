//
//  GameBattleLogInfo.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameBattleLogInfo : NSObject
//"log_type":2,
//"siege_id":2022020304,
//"match_id":2022020304000003,
//"base_number":24,
//"guild_id":30652,
//"guild_name":"今日的我们",
//"channel_uid":163318764,
//"wizard_id":17164352,
//"wizard_name":"诗诗老公　",
//"wizard_level":50,
//"opp_guild_id":41512,
//"opp_guild_name":"瀞灵廷",
//"opp_channel_uid":149262575,
//"opp_wizard_id":14566173,
//"opp_wizard_name":"魚旦",
//"opp_wizard_level":50,
//"win_lose":2,
//"request_type":1,
//"match_score_var":0,
//"log_timestamp":1645174465
@property (assign,nonatomic)  int log_type;
@property (assign,nonatomic)  int siege_id;
@property (assign,nonatomic)  int match_id;
@property (assign,nonatomic)  int base_number;

@property (assign,nonatomic)  int guild_id;
@property (assign,nonatomic)  int channel_uid;
@property (assign,nonatomic)  int wizard_id;
@property (assign,nonatomic)  int wizard_level;


@property (assign,nonatomic)  int opp_guild_id; // 敌方公会id
@property (assign,nonatomic)  int opp_channel_uid;
@property (assign,nonatomic)  int opp_wizard_id; // 敌方成员id

@property (assign,nonatomic)  int opp_wizard_level; // 敌方成员等级
@property (assign,nonatomic)  int win_lose; // 1胜利 2失败
@property (assign,nonatomic)  int request_type;
@property (assign,nonatomic)  int match_score_var;
@property (assign,nonatomic)  int log_timestamp;
@property (copy,nonatomic)  NSString * guild_name;
@property (copy,nonatomic)  NSString * wizard_name;
@property (copy,nonatomic)  NSString * opp_guild_name;
@property (copy,nonatomic)  NSString * opp_wizard_name;

-(void)parseDataWithDic:(NSDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
