//
//  ViewController.m
//  MYPickerViewDome
//
//  Created by 梅洋 on 2017/11/6.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "ViewController.h"

#define MainScreenWidth  [UIScreen mainScreen].bounds.size.width
#define MainScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

// 列表页
@property (nonatomic, strong) UITableView *myListView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)my_buildUpThisViews {
    [self.view addSubview:self.myListView];
    
}


#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = @"测试";
    
    return cell;
}

#pragma mark - tableView DataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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





@end
