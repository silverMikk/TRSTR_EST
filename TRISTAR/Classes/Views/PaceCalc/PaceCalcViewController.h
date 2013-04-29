//
//  PaceCalcViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SplitValues;

@interface PaceCalcViewController : UIViewController{
    int meterToSwim;
    int meterToBike;
    int meterToRun;
    
    SplitValues *splitValues;
    NSManagedObjectContext *context;
}

@property (weak, nonatomic) IBOutlet UILabel *swimDurationLabel;
@property (weak, nonatomic) IBOutlet UILabel *T1DurationLabel;
@property (weak, nonatomic) IBOutlet UILabel *bikeDurationLabel;
@property (weak, nonatomic) IBOutlet UILabel *T2DurationLabel;
@property (weak, nonatomic) IBOutlet UILabel *runDurationLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalDurationLabel;

@property (weak, nonatomic) IBOutlet UILabel *swimSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *bikeSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *runSpeedLabel;

@property (weak, nonatomic) IBOutlet UILabel *swimDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *bikeDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *runDistanceLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *unitsSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *distanceSegment;

@property (weak, nonatomic) IBOutlet UISlider *swimSlider;
@property (weak, nonatomic) IBOutlet UISlider *T1Slider;
@property (weak, nonatomic) IBOutlet UISlider *bikeSlider;
@property (weak, nonatomic) IBOutlet UISlider *T2Slider;
@property (weak, nonatomic) IBOutlet UISlider *runSlider;

- (IBAction)swimSliderChanged:(id)sender;
- (IBAction)T1SliderChanged:(id)sender;
- (IBAction)bikeSliderChanged:(id)sender;
- (IBAction)T2SliderChanged:(id)sender;
- (IBAction)runSliderChanged:(id)sender;

- (IBAction)unitsChanged:(id)sender;
- (IBAction)distanceChanged:(id)sender;

@end
