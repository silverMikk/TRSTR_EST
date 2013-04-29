//
//  ResultCell.m
//  TRISTAR
//
//  Created by mishanet on 3/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ResultCell.h"

@implementation ResultCell
@synthesize nameLabel = _nameLabel;
@synthesize rankLabel = _rankLabel;
@synthesize swimDurationLabel = _swimDurationLabel;
@synthesize bikeDurationLabel = _bikeDurationLabel;
@synthesize runDurationLabel = _runDurationLabel;
@synthesize totalDurationLabel = _totalDurationLabel;
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
