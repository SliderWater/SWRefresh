//
//  SWTestMenuViewController.m
//  SWRefresh
//
//  Created by 国诚信 on 16/3/24.
//  Copyright © 2016年 SliderWater. All rights reserved.
//

#import "SWExampleViewController.h"
#import "SWTableViewController.h"
#import "SWExample.h"

static NSString *const SWExample00 = @"UITableView + 下拉刷新";
static NSString *const SWExample10 = @"UITableView + 上拉刷新";
static NSString *const SWExample20 = @"UICollectionView";
static NSString *const SWExample30 = @"UIWebView";

@interface SWExampleViewController ()

@property (strong, nonatomic) NSArray *examples;

@end

@implementation SWExampleViewController

- (NSArray *)examples {
    
    if (!_examples) {
        
        SWExample *exam0 = [[SWExample alloc] init];
        exam0.header = SWExample00;
        exam0.vcClass = [SWTableViewController class];
        exam0.titles = @[@"默认", @"动画图片", @"隐藏时间", @"隐藏状态和时间", @"自定义文字", @"自定义刷新控件"];
        exam0.methods = @[@"example01", @"example02", @"example03", @"example04", @"example05", @"example06"];
        
        SWExample *exam1 = [[SWExample alloc] init];
        exam1.header = SWExample10;
        exam1.vcClass = [UIViewController class];
        exam1.titles = @[@"默认", @"动画图片", @"隐藏刷新状态的文字", @"全部加载完毕", @"禁止自动加载", @"自定义文字", @"加载后隐藏", @"自动回弹的上拉01", @"自动回弹的上拉02", @"自定义刷新控件(自动刷新)", @"自定义刷新控件(自动回弹)"];
        exam1.methods = @[@"example11", @"example12", @"example13", @"example14", @"example15", @"example16", @"example17", @"example18", @"example19", @"example20", @"example21"];
        
        SWExample *exam2 = [[SWExample alloc] init];
        exam2.header = SWExample20;
        exam2.vcClass = [UIViewController class];
        exam2.titles = @[@"上下拉刷新"];
        exam2.methods = @[@"example21"];
        
        SWExample *exam3 = [[SWExample alloc] init];
        exam3.header = SWExample30;
        exam3.vcClass = [UIViewController class];
        exam3.titles = @[@"下拉刷新"];
        exam3.methods = @[@"example31"];
        
        _examples = @[exam0, exam1, exam2, exam3];
    }
    return _examples;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.examples.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SWExample *example = self.examples[section];
    return example.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"example";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    SWExample *example = self.examples[indexPath.section];
    cell.textLabel.text = example.titles[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", example.vcClass, example.methods[indexPath.row]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    SWExample *example = self.examples[section];
    return example.header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SWExample *example = self.examples[indexPath.section];
    UIViewController *vc = [[example.vcClass alloc] init];
    vc.title = example.titles[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
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
