//
//  ResultCell.h
//  TRISTAR
//
//  Created by mishanet on 3/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *swimDurationLabel;
@property (strong, nonatomic) IBOutlet UILabel *bikeDurationLabel;
@property (strong, nonatomic) IBOutlet UILabel *runDurationLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalDurationLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *rankLabel;
@end
