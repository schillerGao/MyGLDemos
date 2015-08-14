//
//  GLTopBarView.m
//  Demos
//
//  Created by schiller on 15/8/13.
//  Copyright (c) 2015年 schiller. All rights reserved.
//

#import "GLTopBarView.h"
#import "config.h"

#define kGLTopBarRect CGRectMake(0, 0, SCREEN_WIDTH, 64.5)
#define kGLTopBarLineRect CGRectMake(0, 64, SCREEN_WIDTH, 0.5)
#define kGLTopBarTitleLabelRect CGRectMake((self.frame.size.width - 180 ) / 2, 20, 180, 44)
#define kGLTopBarWithSubtitleTitleLabelRect CGRectMake((SCREEN_WIDTH - 120)/2, 20, 120, 30)
#define kGLTopBarSubTitleLabelRect CGRectMake((SCREEN_WIDTH - 120)/2, 44, 120, 20)
#define kGLTopBarLeftButtonRect CGRectMake(0, 20, 65, 44)

#define kGLTopBarRightButtonRect CGRectMake(SCREEN_WIDTH - 100, 20, 90, 44)
#define kGLTopBarRightButtonWithExtendRect CGRectMake(SCREEN_WIDTH - 64, 20, 50, 44)
#define kGLTopBarExtendButtonRect CGRectMake(SCREEN_WIDTH - 114, 20, 50, 44)

#define kGLTopBarButtonTitleFont [UIFont systemFontOfSize:17]

@implementation GLTopBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
    }
    return self;

}

- (id)initWithFrame:(CGRect)frame topBarStyle:(GLTopBarStyle)topBarStyle delegate:(id<GLTopBarViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTopBarStytle:topBarStyle];
        _delegate = delegate;
    }
    
    return self;
}

+ (GLTopBarView *)topBarViewWithStyle:(GLTopBarStyle)topBarStyle delegate:(id<GLTopBarViewDelegate>)delegate
{
    GLTopBarView *topBarView = [[GLTopBarView alloc] initWithFrame:kGLTopBarRect topBarStyle:topBarStyle delegate:delegate];
    
    return topBarView;
    
}

- (void)setupTopBarView:(GLTopBarStyle)topBarStyle
{
    for (UIView *item in self.subviews) {
        [item removeFromSuperview];
    }
    
    switch (topBarStyle) {
        case GLTopBarStyleDefault:
            [self addSubview:self.backgroundView];
            break;
            
        case GLTopBarStyleTitle:
            [self addSubview:self.backgroundView];
            [self addSubview:self.titleLabel];
            break;
        
        case GLTopBarStyleLeftButton:
            [self addSubview:self.backgroundView];
            [self addSubview:self.leftButton];
            break;
        
        case GLTopBarStyleRightButton:
            [self addSubview:self.backgroundView];
            [self addSubview:self.rightButton];
            break;
        
        case GLTopBarStyleTitleLeftButton:
            [self addSubview:self.backgroundView];
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftButton];
            break;
            
        case GLTopBarStyleTitleRightButton:
            [self addSubview:self.backgroundView];
            [self addSubview:self.titleLabel];
            [self addSubview:self.rightButton];
            break;
            
        case GLTopBarStyleTitleLeftButtonRightButton:
            [self addSubview:self.backgroundView];
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftButton];
            [self addSubview:self.rightButton];
            break;
            
        case GLTopBarStyleTitleLeftButtonRightButtonExtendButton:
            [self addSubview:self.backgroundView];
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftButton];
            [self addSubview:self.rightButton];
            [self addSubview:self.extendButton];
            break;
            
        case GLTopBarStyleEmpty:
            break;
            
        case GLTopBarStyleNone:
            self.frame = CGRectZero;
            break;
            
        case GLTopBarStyleTitleLeftButtonSubTitle:
            [self addSubview:self.backgroundView];
            [self addSubview:self.titleLabel];
            [self addSubview:self.subTitleLabel];
            [self addSubview:self.leftButton];
            break;
        
        case GLTopBarStyleTitleLeftButtonSubTitleRightButton:
            [self addSubview:self.backgroundView];
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftButton];
            [self addSubview:self.subTitleLabel];
            [self addSubview:self.rightButton];
            break;
        
        case GLTopBarStyleTitleLeftMenu:
            [self addSubview:self.backgroundView];
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftButton];
            break;
        
        case GLTopBarStyleTitleLeftMenuRightButton:
            [self addSubview:self.backgroundView];
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftButton];
            [self addSubview:self.rightButton];
            break;
        
        default:
            break;
    }
    
    if (self.dockButton) {
        [self addSubview:self.dockButton];
    }
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:kGLTopBarTitleLabelRect];
        _titleLabel.font = [UIFont systemFontOfSize:17.f];
        _titleLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    
    if ((_topBarStytle == GLTopBarStyleTitleLeftButtonSubTitle) || (_topBarStytle == GLTopBarStyleTitleLeftButtonSubTitleRightButton)) {
        _titleLabel.frame = kGLTopBarWithSubtitleTitleLabelRect;
    }
    else {
        _titleLabel.frame = kGLTopBarTitleLabelRect;
    }
    
    return _titleLabel;
    
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:kGLTopBarSubTitleLabelRect];
        _subTitleLabel.textAlignment = NSTextAlignmentLeft;
        _subTitleLabel.font = [UIFont systemFontOfSize:12.0f];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.backgroundColor = [UIColor clearColor];
    }
    
    return _subTitleLabel;
}

- (UIButton *)leftButton
{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.titleLabel.font = kGLTopBarButtonTitleFont;
        
    }
    
    return _leftButton;
}

- (UIView *)backgroundView
{
    if (!_backgroundView) {
        
        UIView *view = [[UIView alloc] initWithFrame:kGLTopBarRect];
        view.backgroundColor = [UIColor colorWithRed:248 green:248 blue:248 alpha:1.];
        _bottomLineView = [[UIView alloc] initWithFrame:kGLTopBarLineRect];
        _bottomLineView.backgroundColor = [UIColor colorWithRed:198 green:198 blue:198 alpha:1.];
        [view addSubview:_bottomLineView];
        
        _backgroundView = view;
    }
    
    return _backgroundView;
}

-(void)setRightButtonFromShareButton:(UIButton *)shareButton
{
    _rightButton=shareButton;
    _rightButton.frame=shareButton.frame;
    [_rightButton setImage:[UIImage imageNamed:@"normal_share"] forState:UIControlStateNormal];
    [_rightButton setImage:[UIImage imageNamed:@"highlight_share"] forState:UIControlStateHighlighted];
    [_rightButton addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_rightButton];
}

-(void)setExtendButtonFromShareButton:(UIButton *)shareButton
{
    _extendButton=shareButton;
    _extendButton.frame=shareButton.frame;
    [_extendButton setImage:[UIImage imageNamed:@"normal_share"] forState:UIControlStateNormal];
    [_extendButton setImage:[UIImage imageNamed:@"highlight_share"] forState:UIControlStateHighlighted];
    [_extendButton addTarget:self action:@selector(extendButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_extendButton];
}


- (void)setTitleText:(NSString *)titleText
{
    if ([_titleText isEqualToString:titleText]) {
        
    }
    else {
        _titleText = titleText;
        _titleLabel.text = _titleText;
    }
}

- (void)setSubTitleText:(NSString *)subTitleText
{
    if ([_subTitleText isEqualToString:subTitleText]) {
        
    }
    else {
        _subTitleText = subTitleText;
        _subTitleLabel.text = _subTitleText;
    }
}

- (void)setLeftButtonTitle:(NSString *)leftButtonTitle
{
    if ([_leftButtonTitle isEqualToString:leftButtonTitle]) {
        
    }
    else {
        _leftButtonTitle = leftButtonTitle;
        [_leftButton setTitle:_leftButtonTitle forState:UIControlStateNormal];
    }
}

- (void)setRightButtonTitle:(NSString *)rightButtonTitle
{
    if ([_rightButtonTitle isEqualToString:rightButtonTitle]) {
        
    }
    else {
        _rightButtonTitle = rightButtonTitle;
        [_rightButton setTitle:_rightButtonTitle forState:UIControlStateNormal];
    }
}

- (void)setLeftButtonImage:(UIImage *)leftButtonImage
{
    _leftButtonImage = leftButtonImage;
    [_leftButton setImage:_leftButtonImage forState:UIControlStateNormal];
}

- (void)setRightButtonImage:(UIImage *)rightButtonImage
{
    _rightButtonImage = rightButtonImage;
    [_rightButton setImage:_rightButtonImage forState:UIControlStateNormal];
}

- (void)setRightButtonImage:(UIImage *)rightButtonImage andHighlightedImage:(UIImage *)highlightedImage{
    self.rightButtonImage = rightButtonImage;
    [self.rightButton setImage:highlightedImage forState:UIControlStateHighlighted];
}

- (void)setExtendButtonImage:(UIImage *)extendButtonImage andHighlightedImage:(UIImage *)highlightedImage{
    self.extendButtonImage = extendButtonImage;
    [self.extendButton setImage:highlightedImage forState:UIControlStateHighlighted];
}

- (void)setExtendButtonImage:(UIImage *)extendButtonImage
{
    _extendButtonImage = extendButtonImage;
    [_extendButton setImage:_extendButtonImage forState:UIControlStateNormal];
}

- (void)setExtendButtonTitle:(NSString *)extendButtonTitle
{
    if ([_extendButtonTitle isEqualToString:extendButtonTitle]) {
        return;
    }
    
    _extendButtonTitle = extendButtonTitle;
    [_extendButton setTitle:_extendButtonTitle forState:UIControlStateNormal];
}

- (void)setTopBarStyle:(GLTopBarStyle)topBarStyle
{
    if (_topBarStytle == topBarStyle) {
        
    }
    else {
        _topBarStytle = topBarStyle;
        [self setupTopBarView:_topBarStytle];
    }
}

@end
