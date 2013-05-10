//
//  CustomAnnotation.h
//  TRISTAR
//
//  Created by Silver Mikk on 5/8/13.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef enum {
    CustomAnnotationTypeSwim = 0,
    CustomAnnotationTypeBike = 1,
    CustomAnnotationTypeRun=2,
    CustomAnnotationTypeFinish=3
} CustomAnnotationType;


@interface CustomAnnotation : NSObject

@property (nonatomic, retain) NSString *title;
@property CLLocationCoordinate2D coordinate;
@property CustomAnnotationType annotationType;
@end
