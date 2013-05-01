//
//  ScheduleCell.m
//  TRISTAR
//
//  Created by Silver Mikk on 5/1/13.
//
//

#import "ScheduleCell.h"

@implementation ScheduleCell
@synthesize nameLabel=_nameLabel;
@synthesize timeLabel=_timeLabel;
@synthesize backView=_backView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
