//
//  RoutesViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "RoutesViewController.h"
#import "RouteAgent.h"
#import "WaypointObject.h"
#import "RouteObject.h"

@interface RoutesViewController ()

@end

@implementation RoutesViewController
@synthesize mapView;
@synthesize segmentController;
@synthesize SwimID,BikeID,RunID;
@synthesize swimLine,bikeLine,runLine;
@synthesize swimLineView,bikeLineView,runLineView;
@synthesize title;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [self setSegmentController:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationItem setTitle:title];
    [[self.navigationItem backBarButtonItem] setTitle:@"Back"];
    
    [self loadRoutes];
    
    if (nil != self.swimLine) {
		[self.mapView addOverlay:self.swimLine];
	}
    if (nil != self.bikeLine) {
		[self.mapView addOverlay:self.bikeLine];
	}
    if (nil != self.runLine) {
		[self.mapView addOverlay:self.runLine];
	}
	// zoom in on the route. 
    if (SwimID !=0) {
        [segmentController setHidden:NO];
        [self zoomInOnRouteOnRect:_swimRect];
    }else {
        [segmentController setHidden:YES];
        [self zoomInOnRouteOnRect:_runRect];
    }

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)segmentChanged:(id)sender {

    switch (segmentController.selectedSegmentIndex) {
        case 0:
            [self zoomInOnRouteOnRect:_swimRect];
            break;
        case 1:
            [self zoomInOnRouteOnRect:_bikeRect];
            break;
        case 2:
            [self zoomInOnRouteOnRect:_runRect];
            break;
            
        default:
            break;
    }
}

- (IBAction)aeroButtonPressed:(id)sender {
    [mapView setMapType:MKMapTypeSatellite];
}

- (IBAction)hybridButtonPressed:(id)sender {
    [mapView setMapType:MKMapTypeHybrid];
}

- (IBAction)mapButtonPressed:(id)sender {
    [mapView setMapType:MKMapTypeStandard];
}

#pragma mark mapviewdelegate


-(MKOverlayView*)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay{
    MKOverlayView* overlayView = nil;
	
	if(overlay == self.swimLine)
	{
		//if we have not yet created an overlay view for this overlay, create it now. 
		if(nil == self.swimLineView)
		{
			self.swimLineView = [[MKPolylineView alloc] initWithPolyline:self.swimLine];
			self.swimLineView.fillColor = [UIColor yellowColor];
			self.swimLineView.strokeColor = [UIColor yellowColor];
			self.swimLineView.lineWidth = 3;
		}
		
		overlayView = self.swimLineView;
		
	}else if(overlay == self.bikeLine)
	{
		//if we have not yet created an overlay view for this overlay, create it now. 
		if(nil == self.bikeLineView)
		{
			self.bikeLineView = [[MKPolylineView alloc] initWithPolyline:self.bikeLine];
			self.bikeLineView.fillColor = [UIColor blueColor];
			self.bikeLineView.strokeColor = [UIColor blueColor];
			self.bikeLineView.lineWidth = 3;
		}
		
		overlayView = self.bikeLineView;
		
	}else if(overlay == self.runLine)
	{
		//if we have not yet created an overlay view for this overlay, create it now. 
		if(nil == self.runLineView)
		{
			self.runLineView = [[MKPolylineView alloc] initWithPolyline:self.runLine];
			self.runLineView.fillColor = [UIColor greenColor];
			self.runLineView.strokeColor = [UIColor greenColor];
			self.runLineView.lineWidth = 3;
		}
		
		overlayView = self.runLineView;
		
	}
	
	return overlayView;
    
}


-(void)loadRoutes{
   
    RouteAgent *agent = [[RouteAgent alloc] init];
    MKMapPoint northEastPoint; 
	MKMapPoint southWestPoint; 
    if (SwimID!=0) {
        NSArray *swimArray = [agent getRouteWaypointsForID:SwimID];
        
        
        // create a c array of points. 
        MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * swimArray.count);
        for(int idx = 0; idx < swimArray.count; idx++)
        {
            WaypointObject *w = [swimArray objectAtIndex:idx];
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(w.latitude.doubleValue, w.longitude.doubleValue);
            MKMapPoint point = MKMapPointForCoordinate(coord);
            
            //start
            if (idx==0) {
                MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
                annotationPoint.coordinate =coord;
                annotationPoint.title = @"Start";
                [mapView addAnnotation:annotationPoint];
                
                
            }
            //end
            if (idx==swimArray.count-1) {
                MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
                annotationPoint.coordinate = coord;
                annotationPoint.title = @"End";
                [mapView addAnnotation:annotationPoint];
                
            }
            
            //
            // adjust the bounding box
            //
            
            // if it is the first point, just use them, since we have nothing to compare to yet. 
            if (idx == 0) {
                northEastPoint = point;
                southWestPoint = point;
            }
            else 
            {
                if (point.x > northEastPoint.x) 
                    northEastPoint.x = point.x;
                if(point.y > northEastPoint.y)
                    northEastPoint.y = point.y;
                if (point.x < southWestPoint.x) 
                    southWestPoint.x = point.x;
                if (point.y < southWestPoint.y) 
                    southWestPoint.y = point.y;
            }
            
            pointArr[idx] = point;
            
        }
        // create the polyline based on the array of points. 
        self.swimLine = [MKPolyline polylineWithPoints:pointArr count:swimArray.count];
        
        _swimRect = MKMapRectMake(southWestPoint.x, southWestPoint.y, northEastPoint.x - southWestPoint.x, northEastPoint.y - southWestPoint.y);
        
        // clear the memory allocated earlier for the points
        free(pointArr);

    }
    if (BikeID !=0) {
        NSArray *bikeArray = [agent getRouteWaypointsForID:BikeID];
        
        
        // create a c array of points. 
        MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * bikeArray.count);
        for(int idx = 0; idx < bikeArray.count; idx++)
        {
            WaypointObject *w = [bikeArray objectAtIndex:idx];
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(w.latitude.doubleValue, w.longitude.doubleValue);
            MKMapPoint point = MKMapPointForCoordinate(coord);
            
            //start
            if (idx==0) {
                MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
                annotationPoint.coordinate =coord;
                annotationPoint.title = @"Start";
                [mapView addAnnotation:annotationPoint];
                
                
            }
            //end
            if (idx==bikeArray.count-1) {
                MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
                annotationPoint.coordinate = coord;
                annotationPoint.title = @"End";
                [mapView addAnnotation:annotationPoint];
                
            }
            
            //
            // adjust the bounding box
            //
            
            // if it is the first point, just use them, since we have nothing to compare to yet. 
            if (idx == 0) {
                northEastPoint = point;
                southWestPoint = point;
            }
            else 
            {
                if (point.x > northEastPoint.x) 
                    northEastPoint.x = point.x;
                if(point.y > northEastPoint.y)
                    northEastPoint.y = point.y;
                if (point.x < southWestPoint.x) 
                    southWestPoint.x = point.x;
                if (point.y < southWestPoint.y) 
                    southWestPoint.y = point.y;
            }
            
            pointArr[idx] = point;
            
        }
        // create the polyline based on the array of points. 
        self.bikeLine = [MKPolyline polylineWithPoints:pointArr count:bikeArray.count];
        
        _bikeRect = MKMapRectMake(southWestPoint.x, southWestPoint.y, northEastPoint.x - southWestPoint.x, northEastPoint.y - southWestPoint.y);
        
        // clear the memory allocated earlier for the points
        free(pointArr);

    }
    
    if (RunID !=0) {
        NSArray *runArray = [agent getRouteWaypointsForID:RunID];
        
        
        // create a c array of points. 
        MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * runArray.count);
        for(int idx = 0; idx < runArray.count; idx++)
        {
            WaypointObject *w = [runArray objectAtIndex:idx];
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(w.latitude.doubleValue, w.longitude.doubleValue);
            MKMapPoint point = MKMapPointForCoordinate(coord);
            
            //start
            if (idx==0) {
                MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
                annotationPoint.coordinate =coord;
                annotationPoint.title = @"Start";
                [mapView addAnnotation:annotationPoint];
                
                
            }
            //end
            if (idx==runArray.count-1) {
                MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
                annotationPoint.coordinate = coord;
                annotationPoint.title = @"End";
                [mapView addAnnotation:annotationPoint];
                
            }
            
            //
            // adjust the bounding box
            //
            
            // if it is the first point, just use them, since we have nothing to compare to yet. 
            if (idx == 0) {
                northEastPoint = point;
                southWestPoint = point;
            }
            else 
            {
                if (point.x > northEastPoint.x) 
                    northEastPoint.x = point.x;
                if(point.y > northEastPoint.y)
                    northEastPoint.y = point.y;
                if (point.x < southWestPoint.x) 
                    southWestPoint.x = point.x;
                if (point.y < southWestPoint.y) 
                    southWestPoint.y = point.y;
            }
            
            pointArr[idx] = point;
            
        }
        // create the polyline based on the array of points. 
        self.runLine = [MKPolyline polylineWithPoints:pointArr count:runArray.count];
        
        _runRect = MKMapRectMake(southWestPoint.x, southWestPoint.y, northEastPoint.x - southWestPoint.x, northEastPoint.y - southWestPoint.y);
        
        // clear the memory allocated earlier for the points
        free(pointArr);
        
    }
       
}

-(void) zoomInOnRouteOnRect:(MKMapRect)rect
{
	[self.mapView setVisibleMapRect:rect animated:YES];
}

@end
