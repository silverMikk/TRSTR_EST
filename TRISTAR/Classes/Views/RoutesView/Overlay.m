//
//  Overlay.m
//  TRISTAR
//
//  Created by Silver Mikk on 5/8/13.
//
//

#import "Overlay.h"

@implementation Overlay

-(CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(58.047205, 26.473133);
}

- (MKMapRect)boundingMapRect
{
    
    MKMapPoint upperLeft   = MKMapPointForCoordinate(CLLocationCoordinate2DMake(58.047654, 26.471674));
    MKMapPoint upperRight  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(58.047654, 26.474249));
    MKMapPoint bottomLeft  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(58.046527, 26.471770));
    
    MKMapRect bounds = MKMapRectMake(upperLeft.x, upperLeft.y, fabs(upperLeft.x - upperRight.x), fabs(upperLeft.y - bottomLeft.y));
    
    return bounds;
}

@end