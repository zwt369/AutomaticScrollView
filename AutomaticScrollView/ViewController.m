//
//  ViewController.m
//  AutomaticScrollView
//
//  Created by Tony Zhang on 16/4/17.
//  Copyright © 2016年 Tony Zhang. All rights reserved.
//

#import "ViewController.h"
#import "AutomaticScrollView.h"

@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation ViewController

-(NSMutableArray *)dataArray{

    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataArray addObject:@"http://img.hotyq.com/user/39/809/180939/3ad29f02977f415596e5df5412c0f30c.jpg"];
    [self.dataArray addObject:@"http://img.hotyq.com/user/39/809/180939/319e38ed1fea4d6482e9a26e8e65c5c9.jpg"];
    [self.dataArray addObject:@"http://img.hotyq.com/user/39/809/180939/3ca256d487ec4460aba0a7406c43c299.jpg"];
    [self.dataArray addObject:@"http://img.hotyq.com/user/39/809/180939/d90618ab7521484c804a0e91a405b49d.jpg"];
    [self.dataArray addObject:@"http://img.hotyq.com/user/39/809/180939/bb67fcc14bbb493fba4181c6c4062daa.jpg"];
    AutomaticScrollView *automaticView = [[AutomaticScrollView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    [automaticView configureTheViewWithData:self.dataArray];
    [self.view addSubview:automaticView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
