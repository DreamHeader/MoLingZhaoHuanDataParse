//
//  GameDataManage.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/22.
//

#import <Foundation/Foundation.h>
#import "GameBattleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GameDataManage : NSObject

@property (strong,nonatomic) GameBattleModel * dataModel;

+(instancetype)shareManage;
-(void)downloadBattleData;
// 解析占领数据
-(void)parseGameBattleData;
// 获取对应数据的machid
-(long)getMachId;
// 获取自己的公会的guildid
-(long)getSelfGuildId;
-(GameBattleGuildInfo *)getSelfGuildInfo;
-(GameBattleGuildInfo *)getGuildInfo:(long)guildInfo;
// 自己公会进攻成功次数
-(long)getSelfGuildAttackCount;
// 玩家进攻次数 自己公会
-(long)getAttackCount:(long)userId;
// 玩家进攻成功次数 自己公会
-(long)getAttackWinCount:(long)userId;
// 玩家进攻失败次数 自己公会
-(long)getAttackLoseCount:(long)userId;

-(long)getDefenseAllCount:(long)userId;
-(long)getDefenseWinCount:(long)userId;
-(long)getDefenseLoseCount:(long)userId;
// 获取组合后的成员信息数据
-(NSArray*)getSetUpTotalMemberInfo;
// 获取 公会 PK 公会 总计的攻击次数
/*
   type   0 获取攻击次数。 1 获取攻击成功次数 2 获取防守的次数  3 获取防守成功次数
 */
-(long)getGuildAttackOtherGuildData:(long)attackGuildId defenseGuildId:(long)defenseGuildId type:(int)type;
// 获取除了自己其他的公会基本信息
-(NSArray*)getOtherGuildInfo;
@end

NS_ASSUME_NONNULL_END
