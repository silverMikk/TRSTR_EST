//
//  ChooseToolViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RacesViewController.h"

@interface ChooseToolViewController : UIViewController

@property (nonatomic,assign) id<ModalViewDelegate> delegate;

- (IBAction)paceCalcPressed:(id)sender;
- (IBAction)checkListPressed:(id)sender;
- (IBAction)personalBestPressed:(id)sender;
@end
