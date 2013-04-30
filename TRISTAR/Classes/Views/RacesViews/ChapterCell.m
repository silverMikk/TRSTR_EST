//
//  ChapterCell.m
//  TRISTAR
//
//  Created by Silver Mikk on 4/30/13.
//
//

#import "ChapterCell.h"

@implementation ChapterCell
@synthesize titleLabel= _titleLabel;
@synthesize contentTextView=_contentTextView;


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
