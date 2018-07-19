//
//  ViewController.m
//  Box
//
//  Created by 李丝思 on 2018/6/28.
//  Copyright © 2018年 思. All rights reserved.
//
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#import "ViewController.h"
#import "SDAutoLayoutModel+extendSDAutoLayout.h"
#import <SDAutoLayout/SDAutoLayout.h>
#import "LuggageTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 233/2 * SCALE_WIDTH;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.tableView registerClass:[LuggageTableViewCell class] forCellReuseIdentifier:@"LuggageTableViewCell"];
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    LuggageTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"LuggageTableViewCell" forIndexPath:indexPath];
    cell.cellTag = indexPath.section;
    cell.sliderLBlock = ^(CGFloat sdValue, NSInteger tag) {
        
    };
    cell.sliderWBlock = ^(CGFloat sdValue, NSInteger tag) {
        
    };
    cell.sliderHBlock = ^(CGFloat sdValue, NSInteger tag) {
        
    };
    cell.sliderKGBlock = ^(CGFloat sdValue, NSInteger tag) {
       
    };
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 233 * SCALE_WIDTH;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
