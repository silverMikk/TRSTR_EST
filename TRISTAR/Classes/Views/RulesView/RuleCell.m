//
//  RuleCell.m
//  TRISTAR
//
//  Created by Silver Mikk on 5/2/13.
//
//

#import "RuleCell.h"

@implementation RuleCell
@synthesize nameLabel=_nameLabel;
@synthesize numberLabel =_numberLabel;

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
