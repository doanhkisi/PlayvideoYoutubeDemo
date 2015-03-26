//
//  LeftMenuController.h
//  LOLVideo
//
//  Created by Bui Duy Doanh on 10/10/14.
//  Copyright (c) 2014 doanhkisi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMenuController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
