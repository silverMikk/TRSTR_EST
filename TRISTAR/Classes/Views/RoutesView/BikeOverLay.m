//
//  BikeOverLay.m
//  TRISTAR
//
//  Created by Silver Mikk on 5/9/13.
//
//

#import "BikeOverLay.h"

@implementation BikeOverLay

-(CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(48.85883, 2.2945);
}

- (MKMapRect)boundingMapRect
{
    
    MKMapPoint upperLeft   = MKMapPointForCoordinate(CLLocationCoordinate2DMake(58.046114, 26.460922));
    MKMapPoint upperRight  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(58.046114, 26.461965));
    MKMapPoint bottomLeft  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(58.045542, 26.460922));
    
    MKMapRect bounds = MKMapRectMake(upperLeft.x, upperLeft.y, fabs(upperLeft.x - upperRight.x), fabs(upperLeft.y - bottomLeft.y));
    
    return bounds;
}

@end