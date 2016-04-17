//
//  AutomaticScrollView.m
//  AutomaticScrollView
//
//  Created by Tony Zhang on 16/4/17.
//  Copyright © 2016年 Tony Zhang. All rights reserved.
//

#import "AutomaticScrollView.h"
#import <UIImageView+WebCache.h>

#define Kwidth self.frame.size.width
#define Kheight self.frame.size.height

@interface AutomaticScrollView ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pager;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)BOOL addTimer;

@end

@implementation AutomaticScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.backgroundColor = [UIColor orangeColor];
        
    }
    return self;
}

-(void)configureTheViewWithData:(NSArray *)array{
    
    NSInteger count = array.count;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight)];
    [self addSubview:self.scrollView];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(Kwidth*count, Kheight);
    for (int i = 0; i < count; i ++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*Kwidth, 0, Kwidth, Kheight )];
        NSString *url = array[i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:url]];
        [self.scrollView addSubview:imageView];
    }

    self.pager = [[UIPageControl alloc]init];
    self.pager.numberOfPages = count;
    self.pager.frame = CGRectMake(Kwidth/2, Kheight*4/5, count*10, 30);
    self.pager.currentPageIndicatorTintColor = [UIColor redColor];
    self.pager.pageIndicatorTintColor = [UIColor grayColor];
    [self.pager addTarget:self action:@selector(changePicture:) forControlEvents:(UIControlEventValueChanged)];
    [self addSubview:self.pager];
    self.pager.tag = count;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(automaticAction) userInfo:nil repeats:YES];
    [self.timer fire];
    
}


-(void)changePicture:(UIPageControl *)sender{

    NSInteger count = sender.currentPage;
    self.scrollView.contentOffset = CGPointMake(Kwidth*count, 0);
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    NSInteger count = scrollView.contentOffset.x/Kwidth;
    self.pager.currentPage = count;
    
}


-(void)automaticAction{

    NSInteger count = self.pager.currentPage;
    count ++;
    if (count == self.pager.tag) {
        count = 0;
    }
    self.pager.currentPage = count;
    self.scrollView.contentOffset = CGPointMake(Kwidth*count, 0);
}


@end
