//
//  GameBattleBaseInfo.h
//  gameBattle
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameBattleBaseInfo : NSObject
//"siege_id":2022020304,
//"match_id":2022020304000003,
//"base_number":1,
//"base_type":1,
//"guild_id":30652,
//"base_status":0,
//"battle_start_time":1645156800,
//"construct_time":1645156800
@property (assign,nonatomic) long siege_id;
@property (assign,nonatomic) long match_id;
@property (assign,nonatomic) long base_number;
@property (assign,nonatomic) long base_type;
@property (assign,nonatomic) long guild_id;
@property (assign,nonatomic) long base_status;
@property (assign,nonatomic) long battle_start_time;
@property (assign,nonatomic) long construct_time;

-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
