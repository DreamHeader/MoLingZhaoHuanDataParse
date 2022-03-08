//
//  GameDefenseDeckAssignInfo.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameDefenseDeckAssignInfo : NSObject
//"base_number":10,
//"deck_id":5435375,
//"status":1 
@property (assign,nonatomic)  int base_number;
@property (assign,nonatomic)  int deck_id;
@property (assign,nonatomic)  int status;

-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
