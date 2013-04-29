//
//  MainViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RacesViewController.h"

@interface MainViewController : UIViewController<ModalViewDelegate>{
    int bannerIndex;
    NSTimer *bannerTimer;
}
@property (weak, nonatomic) IBOutlet UIImageView *banner;

- (IBAction)racesPressed:(id)sender;
- (IBAction)newsPressed:(id)sender;
- (IBAction)toolsPressed:(id)sender;
- (IBAction)schedulePressed:(id)sender;
@end
