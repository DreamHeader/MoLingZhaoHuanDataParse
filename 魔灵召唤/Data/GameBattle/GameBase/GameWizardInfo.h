//
//  GameWizardInfo.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameWizardInfo : NSObject

//"wizard_id":35398,
//"channel_uid":111459365,
//"wizard_name":"超凶∑(ﾟДﾟ)",
//"rating_id":3002,
//"guild_id":30652
@property (strong,nonatomic)  NSString * wizard_name;
@property (assign,nonatomic)  int wizard_id;
@property (assign,nonatomic)  int channel_uid;
@property (assign,nonatomic)  int rating_id;
@property (assign,nonatomic)  int guild_id;
-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
