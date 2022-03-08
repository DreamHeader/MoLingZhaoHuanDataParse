//
//  GameMemberPerInfo.h
//  魔灵召唤占领
//
//  Created by Future on 2022/3/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameMemberPerInfo : NSObject
 
@property (assign,nonatomic)  long guild_id;
@property (assign,nonatomic)  long wizard_id;
@property (assign,nonatomic)  long grade;
@property (assign,nonatomic)  long channel_uid;
@property (copy,nonatomic)  NSString * country;
@property (copy,nonatomic)  NSString * wizard_name;
@property (assign,nonatomic)  long wizard_level;
@property (assign,nonatomic)  long rating_id;
@property (assign,nonatomic)  long arena_score;
@property (assign,nonatomic)  long last_login_timestamp;
@property (assign,nonatomic)  long join_timestamp;
 
@property (assign,nonatomic)  long attact_win_count; // 攻击胜利次数
@property (assign,nonatomic)  long attact_lose_count; // 攻击失败次数
@property (assign,nonatomic)  long attact_total_count; // 攻击总次数
@property (assign,nonatomic)  long defense_win_count; // 防守胜利次数
@property (assign,nonatomic)  long defense_lose_count; // 防守失败次数
@property (assign,nonatomic)  long defense_total_count; // 防守总次数
@property (assign,nonatomic)  long battleScore; // 贡献度

@end

NS_ASSUME_NONNULL_END
