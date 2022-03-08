//
//  GameMatchupInfo.m
//  gameBattle
//
//  Created by Future on 2022/2/17.
//

#import "GameMatchupInfo.h"

@implementation GameMatchupInfo
 
-(void)parseDataWithDic:(NSDictionary*)dic{
    
    self.command = dic[@"command"];
    self.ret_code = [dic[@"ret_code"] longValue];
    GameSetUpValueInfo * valuesModel = [[GameSetUpValueInfo alloc]init];
    [valuesModel parseDataWithDic:dic[@"setup_values"]];
    self.setup_values = valuesModel;
    self.match_info = dic[@"match_info"];
    
    NSMutableArray * dataArray = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"guild_list"] ) {
        GameBattleGuildInfo * info = [[GameBattleGuildInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArray addObject:info];
    }
    self.guild_list = [dataArray copy];
    
    
    NSMutableArray * dataArrayOne = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"base_list"] ) {
        GameBattleBaseInfo * info = [[GameBattleBaseInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArrayOne addObject:info];
    }
    self.base_list = [dataArrayOne copy];
    
    NSMutableArray * dataArrayTwo = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"wizard_info_list"] ) {
        GameWizardInfo * info = [[GameWizardInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArrayTwo addObject:info];
    }
    self.wizard_info_list = [dataArrayTwo copy];
    
    self.visible_base_number_list = [dic[@"visible_base_number_list"] copy];
    self.separated_base_number_list = [dic[@"separated_base_number_list"] copy];

    NSMutableArray * dataArrayThree = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"defense_deck_list"] ) {
        GameDefenseDeckInfo * info = [[GameDefenseDeckInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArrayThree addObject:info];
    }
    self.defense_deck_list = [dataArrayThree copy];
     
    NSMutableArray * dataArrayFour = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"defense_deck_assign_list"] ) {
        GameDefenseDeckAssignInfo * info = [[GameDefenseDeckAssignInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArrayFour addObject:info];
    }
    self.defense_deck_assign_list = [dataArrayFour copy];
    
  
    NSMutableArray * dataArrayFive = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"defense_deck_status_list"] ) {
        GameDefenseDeckStatusInfo * info = [[GameDefenseDeckStatusInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArrayFive addObject:info];
    }
    self.defense_deck_status_list = [dataArrayFive copy];
    
    
    NSMutableArray * dataArraySix = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"used_unit_count_list"] ) {
        GameUsedUnitCountInfo * info = [[GameUsedUnitCountInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArraySix addObject:info];
    }
    self.used_unit_count_list = [dataArraySix copy];
     
    self.my_attack_unit_id_list = dic[@"my_attack_unit_id_list"];
    self.my_defense_unit_id_list = dic[@"my_defense_unit_id_list"];
 
    NSMutableArray * dataArraySeven = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"member_info_list"] ) {
        GameMemberInfo * info = [[GameMemberInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArraySeven addObject:info];
    }
    self.member_info_list = [dataArraySeven copy];
    
    self.alert_ping_info_list = [dic[@"alert_ping_info_list"] copy];
     
    NSMutableArray * dataArrayNight = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"special_base_rule_info"] ) {
        GameSpecialBaseRuleInfo * info = [[GameSpecialBaseRuleInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArrayNight addObject:info];
    }
    self.special_base_rule_info = [dataArrayNight copy];
    self.ts_val = [dic[@"ts_val"] longValue];
    self.tvalue = [dic[@"tvalue"] longValue];
    self.tvaluelocal = [dic[@"tvaluelocal"] longValue];
    self.tzone = dic[@"tzone"];
}
@end
