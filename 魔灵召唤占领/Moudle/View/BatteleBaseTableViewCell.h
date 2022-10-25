//
//  BatteleBaseTableViewCell.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BatteleBaseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *gonghuiNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *attackRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *attackCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *defenseBattleRateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *errorview;

@end

NS_ASSUME_NONNULL_END
