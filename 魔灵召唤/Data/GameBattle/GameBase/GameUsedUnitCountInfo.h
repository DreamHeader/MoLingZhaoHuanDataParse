//
//  GameUsedUnitCountInfo.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameUsedUnitCountInfo : NSObject
//"wizard_id":35398,
//"used_unit_count":30
@property (assign,nonatomic)  int wizard_id;
@property (assign,nonatomic)  int used_unit_count;
-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
