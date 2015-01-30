//
//  ViewController.m
//  TestKVO
//
//  Created by gfan on 15/1/29.
//  Copyright (c) 2015年 gfan. All rights reserved.
//

#import "ViewController.h"
#import "TestUITableViewTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];

    [btn setTitle:@"clickMe" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(openTestTableView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)openTestTableView
{
    TestUITableViewTableViewController *tmpVC = [[TestUITableViewTableViewController alloc] init];
    [self.navigationController pushViewController:tmpVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
