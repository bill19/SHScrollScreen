//
//  SHScrollScreenView.m
//  SHScrollScreen
//
//  Created by hao sun on 2022/3/1.
//

#import "SHScrollScreenView.h"

#define MAINSCREENWIDTH CGRectGetWidth(self.bounds)

#define MAINSCREENHEIGHT CGRectGetHeight(self.bounds)

@interface SHScrollScreenView()<UIScrollViewDelegate>

/// scrollview
@property (nonatomic, strong, readwrite) UIScrollView *mainScrollView;

@end

@implementation SHScrollScreenView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubViews];
    }
    return self;
}

- (void)setSubViews {
    [self addSubview:self.mainScrollView];
}

- (UIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.delegate = self;
        _mainScrollView.scrollEnabled = YES;
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.bounces = NO;
        if (@available(iOS 11.0, *)) {
            _mainScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _mainScrollView;
}

- (void)configWithViewControllers:(NSArray <UIViewController *>*)controllers {
    
    __block NSMutableArray<UIView *> *muSource = [NSMutableArray array];
    [controllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [muSource addObject:obj.view];
    }];
    
    [self configWithViews:muSource];
}


/// 配置UIView
/// @param views 页面
- (void)configWithViews:(NSArray <UIView *>*)views {
    
    self.mainScrollView.frame = self.bounds;
    
    
    if (self.direction == HorizontalScrollIndicator) {
        
        self.mainScrollView.contentSize = CGSizeMake(MAINSCREENWIDTH * views.count, MAINSCREENHEIGHT);
        
    } else if (self.direction == VerticalScrollIndicator) {
        
        self.mainScrollView.contentSize = CGSizeMake(MAINSCREENWIDTH , MAINSCREENHEIGHT * views.count);
    }
    
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSInteger horizontalIndex = 0;
        
        NSInteger verticalIndex = 0;
        if (self.direction == HorizontalScrollIndicator) {
            horizontalIndex = idx;
        } else if (self.direction == VerticalScrollIndicator) {
            verticalIndex = idx;
        }
        
        obj.frame = CGRectMake(MAINSCREENWIDTH  * horizontalIndex, verticalIndex * MAINSCREENHEIGHT, MAINSCREENWIDTH, MAINSCREENHEIGHT);
        
        [self.mainScrollView addSubview:obj];
    }];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setCurrentPage:(NSInteger)page {
    if (page >= 0) {
        [self.mainScrollView scrollRectToVisible:CGRectMake(MAINSCREENWIDTH * page, 0, MAINSCREENWIDTH, MAINSCREENHEIGHT) animated:YES];
    }
}

- (void)setDirection:(SHScrollScreenViewScrollIndicatorDirection)direction {
    _direction = direction;
    
}
@end
