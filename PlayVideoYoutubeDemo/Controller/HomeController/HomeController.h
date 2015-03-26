//
//  HomeController.h
//  LOLVideo
//
//  Created by Bui Duy Doanh on 10/10/14.
//  Copyright (c) 2014 doanhkisi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;




@property (strong, nonatomic) NSString *cate_id;

- (void)loadData:(NSString *)cate_id;
@end
