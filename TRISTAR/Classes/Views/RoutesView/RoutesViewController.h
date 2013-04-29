//
//  RoutesViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface RoutesViewController : UIViewController<MKMapViewDelegate>{
    
    MKMapRect _swimRect;
    MKMapRect _bikeRect;
    MKMapRect _runRect;
    
    CGRect tableRecShown;
    CGRect tableRecHidden;
}

@property (nonatomic, retain) MKPolyline* swimLine;
@property (nonatomic, retain) MKPolyline* bikeLine;
@property (nonatomic, retain) MKPolyline* runLine;
@property (nonatomic, retain) MKPolylineView* swimLineView;
@property (nonatomic, retain) MKPolylineView* bikeLineView;
@property (nonatomic, retain) MKPolylineView* runLineView;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@property int SwimID;
@property int BikeID;
@property int RunID;

@property NSString *title;

- (IBAction)segmentChanged:(id)sender;

- (IBAction)aeroButtonPressed:(id)sender;
- (IBAction)hybridButtonPressed:(id)sender;
- (IBAction)mapButtonPressed:(id)sender;
@end
