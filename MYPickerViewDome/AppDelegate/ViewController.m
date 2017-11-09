//
//  ViewController.m
//  MYPickerViewDome
//
//  Created by 梅洋 on 2017/11/6.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "ViewController.h"
#import "MYDatePickerView.h"

#define MainScreenWidth  [UIScreen mainScreen].bounds.size.width
#define MainScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

// 列表页
@property (nonatomic, strong) UITableView *myListView;

@property (nonatomic, strong) UIView *tableViewHeardView;

@property (nonatomic, assign) float a;
@property (nonatomic, assign) float newIx;
@property (nonatomic, assign) float oldIx;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeTop;
    if (@available(iOS 11.0, *)) {
        self.myListView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[self.navigationController.navigationBar.subviews objectAtIndex:0]setAlpha:0];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    // 改变导航栏颜色
//    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    // 设置背景图片
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[UIColor brownColor] size:CGSizeMake(1, 1)] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self my_buildUpThisViews];
}

- (void)my_buildUpThisViews {
    self.title = @"测试列表";
    [self.view addSubview:self.myListView];
    self.myListView.tableHeaderView = self.tableViewHeardView;
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];\
    
    _a - 0;
    _newIx = 0;
    _oldIx = 0;
}


#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = @"测试";
    
    return cell;
}

#pragma mark - tableView DataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"偏移量-----  %f",scrollView.contentOffset.y);
    // Selected index's color changed.
    
    _newIx = scrollView.contentOffset.y ;
    if (_newIx != _oldIx ) {
        // Left-YES,Right-NO
        if (_newIx > _oldIx) {
            NSLog(@"--上滑");
            if (_newIx <= 64) {
                _a = 64 / scrollView.contentOffset.y;
            }
        } else if(_newIx < _oldIx){
            NSLog(@"--下滑");
            if (_newIx <= 64) {
                _a = 64 / scrollView.contentOffset.y;
            }
        }
        _oldIx = _newIx;
    }
    if (_a == 0) {
    }
    
    [[self.navigationController.navigationBar.subviews objectAtIndex:0] setAlpha:_a];
}


- (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - lazy
- (UITableView *)myListView {
    if (!_myListView) {
        _myListView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _myListView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _myListView.delegate   = self;
        _myListView.dataSource = self;
        [_myListView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _myListView;
}

- (UIView *)tableViewHeardView {
    if (!_tableViewHeardView) {
        _tableViewHeardView = [[UIView alloc] init];
        _tableViewHeardView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
        _tableViewHeardView.backgroundColor = [UIColor redColor];
    }
    return _tableViewHeardView;
}



@end
