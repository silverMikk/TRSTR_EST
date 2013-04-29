//
//  PesronalBestCell.m
//  TRISTAR
//
//  Created by mishanet on 3/16/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PesronalBestCell.h"

@implementation PesronalBestCell
@synthesize nameLabel = _nameLabel;
@synthesize duratinLabel =_duratinLabel;
@synthesize dateLabel = _dateLabel;

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
