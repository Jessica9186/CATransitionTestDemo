//
//  ViewController.m
//  CATransitionTestDemo
//
//  Created by zxy on 16/3/22.
//  Copyright © 2016年 Chenshaohua. All rights reserved.
//

#define IMAGE_1 @"IMG_0320.jpg"
#define IMAGE_2 @"IMG_0329.jpg"
#define DURATION 0.7f

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,assign) int subtype;

@end

typedef enum : NSUInteger{
    Fade = 1,                   // 淡入淡出
    Push,                       // 推挤
    Reveal,                     // 揭开
    MoveIn,                     // 覆盖
    Cube,                       // 立方体
    SuckEffect,                 // 吸吮
    OglFlip,                    //翻转
    RippleEffect,               // 波纹
    PageCurl,                   // 翻页
    PageUnCurl,                 // 反翻页
    CameraIrisHollowOpen,       // 镜头打开
    CameraIrisHollowClose,      // 镜头关闭
    CurlDown,                   // 下翻页
    CurlUp,                     // 上翻页
    FlipFromLeft,               // 左翻转
    FlipFromRight,              // 右翻转
    
}AnimationType;

@implementation ViewController

- (void)viewDidLoad {
    _subtype = 0;
    [super viewDidLoad];
    
    [self addBgImageWithImageName:IMAGE_2];
}
- (IBAction)tapButton:(id)sender {
    UIButton *button = sender;
    AnimationType animationType = button.tag;
    
    NSString *subtypeString;
    switch (_subtype) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
            
        default:
            break;
    }
    _subtype +=1;
    if (_subtype > 3) {
        _subtype = 0;
    }
    
    switch (animationType) {
        case Fade:
            [self transitionWithType:kCATransitionFade withSubtype:subtypeString ForView:self.view];
            break;
        case Push:
            [self transitionWithType:kCATransitionPush withSubtype:subtypeString ForView:self.view];
            break;
        case Reveal:
            [self transitionWithType:kCATransitionReveal withSubtype:subtypeString ForView:self.view];
            break;
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn withSubtype:subtypeString ForView:self.view];
            break;
        case Cube:
            [self transitionWithType:@"cube" withSubtype:subtypeString ForView:self.view];
            break;
        case SuckEffect:
            [self transitionWithType:@"suckEffect" withSubtype:subtypeString ForView:self.view];
            break;
        case OglFlip:
            [self transitionWithType:@"oglFlip" withSubtype:subtypeString ForView:self.view];
            break;
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" withSubtype:subtypeString ForView:self.view];
            break;
        case PageCurl:
            [self transitionWithType:@"pageCurl" withSubtype:subtypeString ForView:self.view];
            break;
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" withSubtype:subtypeString ForView:self.view];
            break;
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" withSubtype:subtypeString ForView:self.view];
            break;
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" withSubtype:subtypeString ForView:self.view];
            break;
        case CurlDown:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
        case CurlUp:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
        case FlipFromLeft:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
        case FlipFromRight:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
            
        default:
            break;
            
        }
    static int  i = 0;
    if (i == 0) {
        [self addBgImageWithImageName:IMAGE_1];
        i = 1;
    }else{
        [self addBgImageWithImageName:IMAGE_2];
        i = 0;
    }

}

#pragma mark - UIView实现动画
- (void)animationWithView:(UIView *)view WithAnimationTransition:(UIViewAnimationTransition)transition
{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}
#pragma mark - 给view添加背景图
- (void)addBgImageWithImageName:(NSString *)imageName {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
    
}
#pragma CATransition动画实现
- (void)transitionWithType:(NSString *)type withSubtype:(NSString *)subtype ForView:(UIView *)view
{
    // 创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    // 设置运动时间
    animation.duration = DURATION;
    
    // 设置运动type
    animation.type = type;
    if (subtype != nil) {
        // 设置子类
        
        animation.subtype = subtype;
    }
    
    // 设置运动速度
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}
@end
