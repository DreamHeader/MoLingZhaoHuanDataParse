//
//  GameAttackLog.h
//  gameBattle
//
//  Created by Future on 2022/2/17.
//

#import <Foundation/Foundation.h>
#import "GameAttackPerInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface GameAttackLog : NSObject

@property (copy,nonatomic)  NSString * command;

@property (assign,nonatomic) long ret_code;

@property (assign,nonatomic) long log_type;

@property (strong,nonatomic) NSArray<GameAttackPerInfo*> * log_list;
  
@property (assign,nonatomic) long ts_val;

@property (assign,nonatomic) long tvalue;
 
@property (assign,nonatomic) long tvaluelocal;
 
@property (copy,nonatomic)  NSString * tzone;


-(void)parseDataWithDic:(NSDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
