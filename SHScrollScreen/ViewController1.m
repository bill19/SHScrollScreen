//
//  ViewController1.m
//  SHScrollScreen
//
//  Created by hao sun on 2022/3/1.
//

#import "ViewController1.h"

@interface ViewController1 ()<UIScrollViewDelegate>

/// <#name#>
@property (nonatomic, strong) UILabel *titleLabel;

/// <#name#>
@property (nonatomic, strong) UIScrollView *mainScrollView;
@end

@implementation ViewController1


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.frame = CGRectMake(100, 100, 100, 3000);
    self.titleLabel.backgroundColor = [UIColor redColor];
    self.titleLabel.text = @"label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2label1 label2";
    
    [self.view addSubview:self.mainScrollView];
    self.mainScrollView.contentSize = CGSizeMake(300, 3000);
    
    [self.mainScrollView addSubview:self.titleLabel];
    self.view.backgroundColor = [UIColor grayColor];
    
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}


- (UIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.delegate = self;
//        _mainScrollView.scrollEnabled = YES;
//        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.bounces = NO;
        _mainScrollView.backgroundColor = [UIColor purpleColor];
        if (@available(iOS 11.0, *)) {
            _mainScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _mainScrollView;
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
