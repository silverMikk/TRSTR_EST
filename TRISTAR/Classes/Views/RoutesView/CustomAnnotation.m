//
//  CustomAnnotation.m
//  TRISTAR
//
//  Created by Silver Mikk on 5/8/13.
//
//

#import "CustomAnnotation.h"


@implementation CustomAnnotation
@synthesize coordinate;
@synthesize annotationType;
@synthesize title;
-init{
    return self;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)cord{
    coordinate = cord;
    return self;
}

@end
