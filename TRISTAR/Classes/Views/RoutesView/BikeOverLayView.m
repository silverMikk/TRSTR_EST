//
//  BikeOverLayView.m
//  TRISTAR
//
//  Created by Silver Mikk on 5/9/13.
//
//

#import "BikeOverLayView.h"

@implementation BikeOverLayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)ctx
{
    
    UIImage *image = [UIImage imageNamed:@"transition4.png"
                      ] ;
    CGImageRef imageReference = image.CGImage;
    
    MKMapRect theMapRect = [self.overlay boundingMapRect];
    CGRect theRect = [self rectForMapRect:theMapRect];
    
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextTranslateCTM(ctx, 0.0, -theRect.size.height);
    CGContextDrawImage(ctx, theRect, imageReference);
    
    
}

@end
