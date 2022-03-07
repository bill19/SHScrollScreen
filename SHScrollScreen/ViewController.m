//
//  ViewController.m
//  SHScrollScreen
//
//  Created by hao sun on 2022/3/1.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "SHScrollScreenView.h"
@interface ViewController ()
/// <#name#>
@property (nonatomic, strong) ViewController1 *vc1;
@property (nonatomic, strong) ViewController2 *vc2;
/// <#name#>
@property (nonatomic, strong) SHScrollScreenView *screenView;

/// <#name#>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *titleLabel2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.screenView];
    self.screenView.frame = CGRectMake(0, 50, self.view.bounds.size.width, 400);
    self.screenView.direction = VerticalScrollIndicator;
//    [self.screenView configWithViews:@[self.titleLabel,self.titleLabel2]];
    [self.screenView configWithViewControllers:@[self.vc1,self.vc2]];
    
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"1111111";
        _titleLabel.backgroundColor = [UIColor redColor];
    }
    return _titleLabel;
}

- (UILabel *)titleLabel2 {
    
    if (!_titleLabel2) {
        _titleLabel2 = [[UILabel alloc] init];
        _titleLabel2.textColor = [UIColor blackColor];
        _titleLabel2.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel2.textAlignment = NSTextAlignmentCenter;
        _titleLabel2.text = @"222222";
        _titleLabel2.backgroundColor = [UIColor redColor];
    }
    return _titleLabel2;
}

- (ViewController1 *)vc1 {
    if (!_vc1) {
        _vc1 = [ViewController1 new];
    }
    return _vc1;
}

- (ViewController2 *)vc2 {
    if (!_vc2) {
        _vc2 =[ViewController2 new];
    }
    return _vc2;
}

- (SHScrollScreenView *)screenView {
    if (!_screenView) {
        _screenView = [[SHScrollScreenView alloc] init];
    }
    return _screenView;
}
@end
