//
//  GameMatchupInfo.h
//  gameBattle
//
//  Created by Future on 2022/2/17.
//

#import <Foundation/Foundation.h>
#import "GameSetUpValueInfo.h"
#import "GameBattleGuildInfo.h"
#import "GameBattleBaseInfo.h"
#import "GameWizardInfo.h"
#import "GameDefenseDeckInfo.h"
#import "GameDefenseDeckAssignInfo.h"
#import "GameDefenseDeckStatusInfo.h"
#import "GameUsedUnitCountInfo.h"
#import "GameMemberInfo.h"
#import "GameSpecialBaseRuleInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface GameMatchupInfo : NSObject

@property (copy,nonatomic)  NSString * command;

@property (assign,nonatomic) long ret_code;

@property (strong,nonatomic) GameSetUpValueInfo * setup_values;

@property (strong,nonatomic) NSDictionary * match_info;

@property (strong,nonatomic) NSArray<GameBattleGuildInfo*> * guild_list;

@property (strong,nonatomic) NSArray<GameBattleBaseInfo*> * base_list;

@property (strong,nonatomic) NSArray<GameWizardInfo*> * wizard_info_list;

@property (strong,nonatomic) NSArray * visible_base_number_list;

@property (strong,nonatomic) NSArray * separated_base_number_list;

@property (strong,nonatomic) NSArray<GameDefenseDeckInfo*>  * defense_deck_list;

@property (strong,nonatomic) NSArray<GameDefenseDeckAssignInfo*> * defense_deck_assign_list;

@property (strong,nonatomic) NSArray<GameDefenseDeckStatusInfo*> * defense_deck_status_list;

@property (strong,nonatomic) NSArray<GameUsedUnitCountInfo*> * used_unit_count_list;

@property (strong,nonatomic) NSArray * my_attack_unit_id_list;

@property (strong,nonatomic) NSArray * my_defense_unit_id_list;

@property (strong,nonatomic) NSArray<GameMemberInfo*> * member_info_list;

@property (strong,nonatomic) NSDictionary * alert_ping_info_list;

@property (strong,nonatomic) NSArray<GameSpecialBaseRuleInfo*> * special_base_rule_info;

@property (assign,nonatomic) int ts_val;

@property (assign,nonatomic) int tvalue;

@property (assign,nonatomic) int tvaluelocal;

@property (copy,nonatomic)  NSString * tzone;

-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
