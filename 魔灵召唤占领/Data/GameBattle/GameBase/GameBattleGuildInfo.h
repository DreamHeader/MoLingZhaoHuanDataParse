//
//  GameBattleGuildInfo.h
//  gameBattle
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameBattleGuildInfo : NSObject
//"siege_id":2022020304,
//"guild_id":30652,
//"match_id":2022020304000003,
//"rating_id":4003,
//"pos_id":1,
//"match_score":6522.596699999998,
//"match_score_increment":0,
//"match_rank":1,
//"disqualified":0,
//"play_member_count":25,
//"attack_count":177,
//"attack_unit_count":531,
//"guild_name":"今日的我们",
//"master_channel_uid":119041271,
//"match_score_last_update_time":1645174682
@property (assign,nonatomic) long siege_id;
@property (assign,nonatomic) long guild_id;
@property (assign,nonatomic) long match_id;
@property (assign,nonatomic) long rating_id;
@property (assign,nonatomic) long pos_id;
@property (assign,nonatomic) double match_score;
@property (assign,nonatomic) long match_score_increment;
@property (assign,nonatomic) long match_rank;
@property (assign,nonatomic) long disqualified;
@property (assign,nonatomic) long play_member_count;
@property (assign,nonatomic) long attack_count;
@property (assign,nonatomic) long attack_unit_count;
@property (copy,nonatomic) NSString* guild_name;
@property (assign,nonatomic) long master_channel_uid;
@property (copy,nonatomic) NSString* match_score_last_update_time;
-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
