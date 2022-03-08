//
//  GameMemberInfo.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameMemberInfo : NSObject
//"guild_id":30652,
//"wizard_id":35398,
//"grade":4,
//"channel_uid":111459365,
//"country":"CN",
//"wizard_name":"超凶∑(ﾟДﾟ)",
//"wizard_level":50,
//"rating_id":3002,
//"arena_score":1732,
//"last_login_timestamp":1645169803,
//"join_timestamp":1550384461
@property (assign,nonatomic)  long guild_id;
@property (assign,nonatomic)  long wizard_id;
@property (assign,nonatomic)  long grade;
@property (assign,nonatomic)  long channel_uid;
@property (copy,nonatomic)  NSString * country;
@property (copy,nonatomic)  NSString * wizard_name;
@property (assign,nonatomic)  long wizard_level;
@property (assign,nonatomic)  long rating_id;
@property (assign,nonatomic)  long arena_score;
@property (assign,nonatomic)  long last_login_timestamp;
@property (assign,nonatomic)  long join_timestamp;
-(void)parseDataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
