//
//  GLNavigationURLHelper.m
//  Demos
//
//  Created by gaolong on 16/2/5.
//  Copyright © 2016年 schiller. All rights reserved.
//

#import "GLNavigationURLHelper.h"
#import "GLNavigator.h"
NSString *const GLURLScheme = @"demoapp";
NSString *const GLURLDemoHome = @"demoapp://demo/home";
NSString *const GLURLDemoSecond = @"demoapp://demo/second";
NSString *const GLURLDemoThird = @"demoapp://demo/third";
NSString *const GLURLDemoForth = @"demoapp://demo/forth";
NSString *const GLURLDemoFifth = @"demoapp://demo/fifth";
NSString *const GLURLDemoButtonCell = @"demoapp://demo/home/buttoncell";
NSString *const GLURLDemoScrollCell = @"demoapp://demo/home/scrollcell";
NSString *const GLURLDemoPickerViewCell = @"demoapp://demo/home/pickerviewcell";
NSString *const GLURLDemoTabBarCell = @"demoapp://demo/home/tabbarcell";
NSString *const GLURLDemoAnimationCell = @"demoapp://demo/home/animationcell";
NSString *const GLURLDemoTestCell = @"demoapp://demo/home/testcell";
NSString *const GLURLDemoNetWorkCell = @"demoapp://demo/home/networkcell";
NSString *const GLURLDemoPassValueCell = @"demoapp://demo/home/passvaluecell";
NSString *const GLURLDemoTextViewCell = @"demoapp://demo/home/textviewcell";
NSString *const GLURLDemoAdScrollTimerCell = @"demoapp://demo/home/adscrolltimercell";
NSString *const GLURLDemoLoginCell = @"demoapp://demo/home/logincell";
NSString *const GLURLDemoTopBarCell = @"demoapp://demo/home/presentcell";
NSString *const GLURLDemoWebViewCell = @"demoapp://demo/home/webviewcell";
NSString *const GLURLDemoTableViewCell = @"demoapp://demo/home/tableviewcell";

@implementation GLNavigationURLHelper

+ (void)registerAllURLs
{
    static NSDictionary *URLClassMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        URLClassMap = @{GLURLDemoHome :@"RootViewController",
                        GLURLDemoSecond :@"SecondViewController",
                        GLURLDemoThird :@"ThirdViewController",
                        GLURLDemoForth :@"ForthViewController",
                        GLURLDemoFifth :@"FifthViewController",
                        GLURLDemoButtonCell :@"GLButtonDemoViewController",
                        GLURLDemoScrollCell :@"ScrollDemoVC",
                        GLURLDemoPickerViewCell :@"PickerViewDemoVC",
                        GLURLDemoTabBarCell :@"TarBarDemoVC",
                        GLURLDemoAnimationCell :@"AnimationDemoVC",
                        GLURLDemoTestCell :@"TestDemoVC",
                        GLURLDemoPassValueCell :@"PassValueBlockVC",
                        GLURLDemoTextViewCell :@"TextViewController",
                        GLURLDemoAdScrollTimerCell :@"AdScrollTimerViewController",
                        GLURLDemoLoginCell :@"LoginDemoVC",
                        GLURLDemoTopBarCell :@"GLPresentViewController",
                        GLURLDemoWebViewCell :@"WebViewDemo",
                        GLURLDemoTableViewCell :@"GLUserLoginViewController",
                        };
    });
    
    [URLClassMap enumerateKeysAndObjectsUsingBlock:^(NSString *urlString, NSString *  _Nonnull className, BOOL * _Nonnull stop) {
        [[GLNavigator navigator].map from:urlString toViewController:className];
    }];
}

@end