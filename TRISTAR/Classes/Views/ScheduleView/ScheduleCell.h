//
//  ScheduleCell.h
//  TRISTAR
//
//  Created by Silver Mikk on 5/1/13.
//
//

#import <UIKit/UIKit.h>

@interface ScheduleCell : UITableViewCell


@property(strong,nonatomic) IBOutlet UILabel *timeLabel;
@property(strong,nonatomic) IBOutlet UILabel *nameLabel;
@property(strong,nonatomic) IBOutlet UIView *backView;
@end
