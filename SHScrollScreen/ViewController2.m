//
//  ViewController2.m
//  SHScrollScreen
//
//  Created by hao sun on 2022/3/1.
//

#import "ViewController2.h"

@interface ViewController2 ()
/// <#name#>
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.frame = CGRectMake(100, 100, 100, 100);
    self.titleLabel.backgroundColor = [UIColor greenColor];
    self.titleLabel.text = @"label2";
    [self.view addSubview:self.titleLabel];
    self.view.backgroundColor = [UIColor grayColor];
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
