//
//  SHScrollScreenView.h
//  SHScrollScreen
//
//  Created by hao sun on 2022/3/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, SHScrollScreenViewScrollIndicatorDirection) {
    //水平指示器
    HorizontalScrollIndicator = 0,
    ///竖直指示器
    VerticalScrollIndicator = 1,
};

@interface SHScrollScreenView : UIView

/// scrollview
@property (nonatomic, strong, readonly) UIScrollView *mainScrollView;

/// 配置控制器
/// @param controllers 控制器
- (void)configWithViewControllers:(NSArray <UIViewController *>*)controllers;

/// 配置UIView
/// @param views 页面
- (void)configWithViews:(NSArray <UIView *>*)views;

/// 设置当前展示的页面
/// @param page 页面
- (void)setCurrentPage:(NSInteger)page;

/// 指向方向 需要先设置再 配置数据源
@property (nonatomic, assign) SHScrollScreenViewScrollIndicatorDirection direction;

@end

NS_ASSUME_NONNULL_END
