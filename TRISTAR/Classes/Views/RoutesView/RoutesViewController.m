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
#import "CustomAnnotation.h"
#import "CustomAnnotationView.h"
#import "Overlay.h"
#import "OverLayView.h"
#import "BikeOverLay.h"
#import "BikeOverLayView.h"

@interface RoutesViewController ()

@end

@implementation RoutesViewController
@synthesize mapView;
@synthesize segmentController;
@synthesize SwimID,BikeID,RunID;
@synthesize swimLine,bikeLine,runLine,addBikeLine;
@synthesize swimLineView,bikeLineView,runLineView,addbikeLineView;
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
    [self setSwimLine:nil];
    [self setSwimLineView:nil];
    [self setBikeLine:nil];
    [self setBikeLineView:nil];
    [self setAddBikeLine:nil];
    [self setAddbikeLineView:nil];
    [self setRunLine:nil];
    [self setRunLineView:nil];
    [self setMapView:nil];
    [self setSegmentController:nil];
    [self setTitle:nil];
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
    if (nil != self.addBikeLine) {
		[self.mapView addOverlay:self.addBikeLine];
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
        
        //add transition area
        
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
		
	}else if(overlay == self.addBikeLine)
	{
		//if we have not yet created an overlay view for this overlay, create it now.
		if(nil == self.addbikeLineView)
		{
			self.addbikeLineView = [[MKPolylineView alloc] initWithPolyline:self.addBikeLine];
			self.addbikeLineView.fillColor = [UIColor blueColor];
			self.addbikeLineView.strokeColor = [UIColor blueColor];
			self.addbikeLineView.lineWidth = 3;
		}
		
		overlayView = self.addbikeLineView;
		
	}else{
        
        if ([overlay class]== [Overlay class]) {
            Overlay *mapOverlay = (Overlay *)overlay;
            OverLayView *mapOverlayView = [[OverLayView alloc] initWithOverlay:mapOverlay];
            return mapOverlayView;
        }else if ([overlay class]==[BikeOverLay class]){
            BikeOverLay *mapOverlay = (BikeOverLay *)overlay;
            BikeOverLayView *mapOverlayView = [[BikeOverLayView alloc] initWithOverlay:mapOverlay];
            return mapOverlayView;
        }
        
        

    }
	
	return overlayView;
    
}


-(CustomAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation{
	// start pin
    CustomAnnotation *myAnnotation = (CustomAnnotation*)annotation;
    CustomAnnotationView *annotationView = nil;
    
    
	if(myAnnotation.annotationType == CustomAnnotationTypeSwim)
	{
		NSString* identifier = @"Swim";
		CustomAnnotationView *newAnnotationView = (CustomAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
		}
        
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == CustomAnnotationTypeBike)
	{
		NSString* identifier = @"Bike";
		CustomAnnotationView *newAnnotationView = (CustomAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
		}
        
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == CustomAnnotationTypeRun)
	{
		NSString* identifier = @"Run";
		CustomAnnotationView *newAnnotationView = (CustomAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
		}
        
		annotationView = newAnnotationView;
	}
    else if(myAnnotation.annotationType == CustomAnnotationTypeFinish)
	{
		NSString* identifier = @"Finish";
		CustomAnnotationView *newAnnotationView = (CustomAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
		}
        
		annotationView = newAnnotationView;
	}

	[annotationView setEnabled:NO];
	[annotationView setCanShowCallout:NO];
    
	    
	[annotationView setEnabled:NO];
	[annotationView setCanShowCallout:NO];
    
	return annotationView;
}


-(void)loadRoutes{
   
    RouteAgent *agent = [[RouteAgent alloc] init];
    MKMapPoint northEastPoint; 
	MKMapPoint southWestPoint; 
    if (SwimID!=0) {
        NSArray *swimArray = [agent getRouteWaypointsForID:SwimID];
        
        Overlay *overlay = [[Overlay alloc] init];
        [mapView addOverlay:overlay];
        
        
        // create a c array of points. 
        MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * swimArray.count);
        for(int idx = 0; idx < swimArray.count; idx++)
        {
            WaypointObject *w = [swimArray objectAtIndex:idx];
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(w.latitude.doubleValue, w.longitude.doubleValue);
            MKMapPoint point = MKMapPointForCoordinate(coord);
            
            //start
            if (idx==0) {
                CustomAnnotation *annotationPoint = [[CustomAnnotation alloc] init];
                annotationPoint.coordinate = coord;
                annotationPoint.annotationType=CustomAnnotationTypeSwim;
                [mapView addAnnotation:(id)annotationPoint];

                
                
            }
            //end
            if (idx==swimArray.count-1) {
                
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
        NSArray *addBikeArrray ;
        
        
        if (BikeID==12) {
            // add sign to route 1. and 2. bike loop
            BikeOverLay *overlay = [[BikeOverLay alloc] init];
            [mapView addOverlay:overlay];
            addBikeArrray = [[agent getRouteWaypointsForID:32] subarrayWithRange:NSMakeRange(10, 40)];
        }
        
        // create a c array of points.
        MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * bikeArray.count);
        for(int idx = 0; idx < bikeArray.count; idx++)
        {
            WaypointObject *w = [bikeArray objectAtIndex:idx];
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(w.latitude.doubleValue, w.longitude.doubleValue);
            MKMapPoint point = MKMapPointForCoordinate(coord);
            
            //start
            if (idx==0) {
                CustomAnnotation *annotationPoint = [[CustomAnnotation alloc] init];
                annotationPoint.coordinate = coord;
                annotationPoint.annotationType=CustomAnnotationTypeBike;
                [mapView addAnnotation:(id)annotationPoint];
                
                
            }
            //end
            if (idx==bikeArray.count-1) {
                
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

        if (addBikeArrray !=nil) {
            // create a c array of points.
            MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * addBikeArrray.count);
            for(int idx = 0; idx < addBikeArrray.count; idx++)
            {
                WaypointObject *w = [addBikeArrray objectAtIndex:idx];
                CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(w.latitude.doubleValue, w.longitude.doubleValue);
                MKMapPoint point = MKMapPointForCoordinate(coord);
                
                                
                                
                pointArr[idx] = point;
                
            }
            // create the polyline based on the array of points.
            self.addBikeLine = [MKPolyline polylineWithPoints:pointArr count:addBikeArrray.count];
            
            
            // clear the memory allocated earlier for the points
            free(pointArr);
            
        
        }
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
                CustomAnnotation *annotationPoint = [[CustomAnnotation alloc] init];
                annotationPoint.coordinate = coord;
                annotationPoint.annotationType=CustomAnnotationTypeRun;
                [mapView addAnnotation:(id)annotationPoint];
                
                
            }
            //end
            if (idx==runArray.count-1) {
                CustomAnnotation *annotationPoint = [[CustomAnnotation alloc] init];
                annotationPoint.coordinate = coord;
                annotationPoint.annotationType=CustomAnnotationTypeFinish;
                [mapView addAnnotation:(id)annotationPoint];
                
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
