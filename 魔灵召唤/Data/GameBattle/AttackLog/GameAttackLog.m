//
//  GameAttackLog.m
//  gameBattle
//
//  Created by Future on 2022/2/17.
//

#import "GameAttackLog.h"

@implementation GameAttackLog


-(void)parseDataWithDic:(NSDictionary*)dic{
    self.command = dic[@"command"];
    self.ret_code = [dic[@"ret_code"] longValue];
    self.log_type = [dic[@"log_type"] longValue];
    NSMutableArray * dataArray = [[NSMutableArray alloc]init];
    for (NSDictionary * data in dic[@"log_list"] ) {
        GameAttackPerInfo * info = [[GameAttackPerInfo alloc]init];
        [info parseDataWithDic:data];
        [dataArray addObject:info];
    }
    self.log_list = [dataArray copy];
    self.ts_val = [dic[@"ts_val"] longValue];
    self.tvalue = [dic[@"tvalue"] longValue];
    self.tvaluelocal = [dic[@"tvaluelocal"] longValue];
    self.tzone = dic[@"tzone"];
    
    
    
}
@end
