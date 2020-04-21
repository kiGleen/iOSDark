//
//  ViewController.m
//  iOSDark
//
//  Created by zoujing@gogpay.cn on 2020/3/31.
//  Copyright © 2020 cn.gogpay.dcb. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Manage.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;


@property (weak, nonatomic) IBOutlet UIView *bgView2;
@property (weak, nonatomic) IBOutlet UIView *view01;
@property (weak, nonatomic) IBOutlet UIView *view02;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.dcbWhiteToSecondColor];
    
    ///当模式发生变化的时候 只有在以下情况下才能监听模式发生了变化!!!!!
    ///
    ///1、在UIViewController中 以下三个方法中
    ///viewWillLayoutSubviews()  viewDidLayoutSubviews()  traitCollectionDidChange()
    ///
    ///2、在UIView中 以下四个方法
    ///draw()  layoutSubview()  traitCollectionDidChange()  tintColorDidChange()
    ///
    ///3、UIPresentationController  以下三个方法
    ///containerViewWillLayoutSubviews()  containerViewDidLayoutSubviews()  traitCollectionDidChange()
    
    
    ///暗黑模式的颜色适配
    [self.bgView setBackgroundColor:UIColor.dcbWhiteToTertiaryColor];
    self.bgView.layer.cornerRadius = 8.0;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.borderWidth = 1.0;
    ///设置一个默认的边框颜色 这儿设置的切换模式 不生效需要在traitCollectionDidChange中设置
    self.bgView.layer.borderColor = UIColor.dcbDividerColor.CGColor;
    

    
    ///图片适配
    ///1、将普通模式下的图片拖入Assets.scassets中
    ///2、选中图片，打开右边栏，设置图片Appearances ->> Any,Dark
    ///3、将暗黑模式下的图片拖进Assets.scassets中
    ///4、直接[UIImage imageNamed:@"icon_test_gr"]即可
    [self.iconImageView setImage:[UIImage imageNamed:@"icon_test_gr"]];
    
    
    
    [self.titleLabel setText:@"暗黑模式"];
    [self.subTitleLabel setText:@"暗黑模式副标题"];
    [self.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.subTitleLabel setFont:[UIFont systemFontOfSize:14]];
    
    
    ///字体颜色适配
    [self.titleLabel setTextColor:UIColor.dcbMainTextColor];
    [self.subTitleLabel setTextColor:UIColor.dcbGaryTextColor];
    
    
    [self.bgView2 setBackgroundColor:UIColor.dcbGrayToTertiaryColor];
    ///使用Colors.xcassets颜色
    [self.view01 setBackgroundColor:[UIColor colorNamed:@"Color01"]];
    [self.view02 setBackgroundColor:[UIColor colorNamed:@"Color02"]];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    if (@available(iOS 13.0, *)) {
        ///获取当前系统模
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            NSLog(@"iOS13 暗黑模式");
        }else{
            NSLog(@"iOS13 普通模式");
        }
    }
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];

    ///设置CGColor颜色时
    ///iOS13后，UIColor能够表示动态颜色，但是CGColor依然只能表示一种颜色
    ///所以对于CALayer对象只能在traitCollectionDidChange方法中进行改变
    self.bgView.layer.borderColor = UIColor.dcbDividerColor.CGColor;
    
    
    
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                NSLog(@"--------> iOS13 暗黑模式");
            }else{
                NSLog(@"--------> iOS13 普通模式");
            }
        }
    }
}




@end
