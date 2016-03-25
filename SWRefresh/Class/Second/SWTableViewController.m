//
//  SWTableViewController.m
//  SWRefresh
//
//  Created by 国诚信 on 16/3/24.
//  Copyright © 2016年 SliderWater. All rights reserved.
//

#import "SWTableViewController.h"
#import "UIViewController+Example.h"
#import "SWTestViewController.h"

//static const CGFloat SWDuration = 2.0;
/**<生成随机数据*/
#define SWRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface SWTableViewController ()

/**<用来显示的假数据 */
@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation SWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    do {
        _Pragma("clang diagnostic push")
        _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
//        [self performSelector:NSSelectorFromString(self.method) withObject:nil];
        _Pragma("clang diagnostic pop")
    } while (0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter function
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        for (NSInteger i = 0; i < 5; ++i) {
            [self.dataSource addObject:SWRandomData];
        }
    }
    return _dataSource;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", indexPath.row % 2 == 0 ? @"push" : @"modal", self.dataSource[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SWTestViewController *tvc = [[SWTestViewController alloc] init];
    if (indexPath.row % 2 == 0) {
        [self.navigationController pushViewController:tvc animated:YES];
    } else {
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tvc];
        [self presentViewController:nc animated:YES completion:nil];
    }
    
}

@end
