//
//  CustomAnnotationView.h
//  TRISTAR
//
//  Created by Silver Mikk on 5/8/13.
//
//

#import <MapKit/MapKit.h>

@class CustomAnnotation;
@interface CustomAnnotationView : MKAnnotationView{
    UIImageView *backImage;
}


@property (nonatomic, retain) UIImageView *backImage;


@end

