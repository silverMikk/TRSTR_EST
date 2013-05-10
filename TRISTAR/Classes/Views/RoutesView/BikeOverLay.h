//
//  BikeOverLay.h
//  TRISTAR
//
//  Created by Silver Mikk on 5/9/13.
//
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>

@interface BikeOverLay  : NSObject <MKOverlay> {
    
}

- (MKMapRect)boundingMapRect;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end