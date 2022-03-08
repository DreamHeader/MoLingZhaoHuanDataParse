//
//  GameDefenseDeckInfo.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameDefenseDeckInfo : NSObject
//"deck_id":3788827,
//"wizard_id":35398,
//"total_win_count":0,
//"total_draw_count":0,
//"total_lose_count":0,
//"win_count":0,
//"draw_count":0,
//"lose_count":0,
//"total_count":0,
//"winning_rate":0
 
@property (assign,nonatomic)  int deck_id;
@property (assign,nonatomic)  int wizard_id;
@property (assign,nonatomic)  int total_win_count;
@property (assign,nonatomic)  int total_draw_count;

@property (assign,nonatomic)  int total_lose_count;
@property (assign,nonatomic)  int win_count;
@property (assign,nonatomic)  int draw_count;
@property (assign,nonatomic)  int lose_count;
@property (assign,nonatomic)  int total_count;
@property (assign,nonatomic)  int winning_rate;
-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
