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

@property (weak, nonatomic) IBOutlet UIButton *raceButton;
@property (weak, nonatomic) IBOutlet UIButton *newsButton;
@property (weak, nonatomic) IBOutlet UIButton *toolButton;
@property (weak, nonatomic) IBOutlet UIButton *scheduleButton;


- (IBAction)racesPressed:(id)sender;
- (IBAction)newsPressed:(id)sender;
- (IBAction)toolsPressed:(id)sender;
- (IBAction)schedulePressed:(id)sender;
@end
