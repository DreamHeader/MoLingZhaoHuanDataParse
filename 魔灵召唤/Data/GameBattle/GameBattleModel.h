//
//  GameBattleModel.h
//  gameBattle
//
//  Created by Future on 2022/2/17.
//
 
#import <Foundation/Foundation.h>
#import "GameMatchupInfo.h"
#import "GameAttackLog.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameBattleModel : NSObject

@property (assign,nonatomic) long wizard_id;

@property (strong,nonatomic)  GameAttackLog * attack_log;

@property (strong,nonatomic)  GameMatchupInfo * matchup_info;

@property (strong,nonatomic)  GameAttackLog * defense_log;
  
-(void)parseDataWithDic:(NSDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
