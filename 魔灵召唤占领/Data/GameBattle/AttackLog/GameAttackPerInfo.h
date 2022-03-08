//
//  GameAttackPerInfo.h
//  gameBattle
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>
#import "GameBattleGuildInfo.h"
#import "GameBattleLogInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameAttackPerInfo : NSObject

@property (strong,nonatomic) NSArray<GameBattleGuildInfo*> * guild_info_list;

@property (strong,nonatomic)  NSArray<GameBattleLogInfo*> * battle_log_list;

@property (assign,nonatomic) int season_type;


-(void)parseDataWithDic:(NSDictionary*)dic;


@end

NS_ASSUME_NONNULL_END
