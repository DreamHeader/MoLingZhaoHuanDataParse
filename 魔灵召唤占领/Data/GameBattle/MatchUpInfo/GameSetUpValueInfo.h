//
//  GameSetUpValueInfo.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameSetUpValueInfo : NSObject
//"max_match_score":20000,
//"max_deck_count_per_member":10,
//"max_attack_unit_count":30,
//"my_attack_unit_count_left":0,
//"war_rest_start_time":1645156800,
//"war_rest_finish_time":1645156800
@property (assign,nonatomic) long max_match_score;
@property (assign,nonatomic) long max_deck_count_per_member;
@property (assign,nonatomic) long max_attack_unit_count;
@property (assign,nonatomic) long my_attack_unit_count_left;
@property (assign,nonatomic) long war_rest_start_time;
@property (assign,nonatomic) long war_rest_finish_time;
-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
