//
//  Overlay.h
//  TRISTAR
//
//  Created by Silver Mikk on 5/8/13.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Overlay : NSObject <MKOverlay> {
    
}

- (MKMapRect)boundingMapRect;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end