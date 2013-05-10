//
//  CustomAnnotationView.m
//  TRISTAR
//
//  Created by Silver Mikk on 5/8/13.
//
//

#import "CustomAnnotationView.h"
#import "CustomAnnotation.h"
#import <QuartzCore/QuartzCore.h>
@implementation CustomAnnotationView
@synthesize backImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;}

#define kHeight 46
#define kWidth  40
#define kBorder 2

-(id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
    CustomAnnotation *tation = (CustomAnnotation*)annotation;
    if (tation.annotationType == CustomAnnotationTypeSwim) {
        self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
		self.frame = CGRectMake(0, 0, kWidth, kHeight);
		self.backgroundColor = [UIColor clearColor];
        backImage = [[UIImageView alloc] initWithFrame:CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder)];
        [backImage setBackgroundColor:[UIColor clearColor]];
        [backImage.layer setShadowOpacity:0.8];
        [backImage.layer setShadowRadius:3.0];
        [backImage.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        [backImage setImage:[UIImage imageNamed:@"swim2.png"]];
        [self addSubview:backImage];
        
    }else if (tation.annotationType == CustomAnnotationTypeBike) {
        self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
		self.frame = CGRectMake(0, 0, kWidth, kHeight);
		self.backgroundColor = [UIColor clearColor];
        backImage = [[UIImageView alloc] initWithFrame:CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder)];
        [backImage setBackgroundColor:[UIColor clearColor]];
        [backImage.layer setShadowOpacity:0.8];
        [backImage.layer setShadowRadius:3.0];
        [backImage.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        [backImage setImage:[UIImage imageNamed:@"bike.png"]];
        [self addSubview:backImage];
       
    }else if (tation.annotationType==CustomAnnotationTypeRun) {
        self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
		self.frame = CGRectMake(0, 0, kWidth, kHeight);
		self.backgroundColor = [UIColor clearColor];
        backImage = [[UIImageView alloc] initWithFrame:CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder)];
        [backImage setBackgroundColor:[UIColor clearColor]];
        [backImage.layer setShadowOpacity:0.8];
        [backImage.layer setShadowRadius:3.0];
        [backImage.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        [backImage setImage:[UIImage imageNamed:@"run.png"]];
        [self addSubview:backImage];
      
    }else if (tation.annotationType==CustomAnnotationTypeFinish) {
        self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
		self.frame = CGRectMake(0, 0, kWidth, kHeight);
		self.backgroundColor = [UIColor clearColor];
        backImage = [[UIImageView alloc] initWithFrame:CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder)];
        [backImage setBackgroundColor:[UIColor clearColor]];
        [backImage.layer setShadowOpacity:0.8];
        [backImage.layer setShadowRadius:3.0];
        [backImage.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        [backImage setImage:[UIImage imageNamed:@"finish.png"]];
        [self addSubview:backImage];
    }
    
    return self;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
