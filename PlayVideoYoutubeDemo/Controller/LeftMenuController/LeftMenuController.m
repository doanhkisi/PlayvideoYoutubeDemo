//
//  LeftMenuController.m
//  LOLVideo
//
//  Created by Bui Duy Doanh on 10/10/14.
//  Copyright (c) 2014 doanhkisi. All rights reserved.
//

#import "LeftMenuController.h"
#import "LeftMenuCell.h"
#import "RequestManager.h"

@interface LeftMenuController () {
    NSMutableArray *dataSource;
}

@end

@implementation LeftMenuController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLayoutForView];
    dataSource = [NSMutableArray new];
    NSMutableDictionary *params = [NSMutableDictionary new];
    [RequestManager startRequest:[NSString stringWithFormat:@"%@%@",kBASE_URL,kAPI_LEFT_MENU_LOAD_CATEGORY] params:params method_type:kGET progressInView:self.view successBlock:^(id respone) {
        dataSource = [respone objectForKey:@"data"];
        [self.tableView reloadData];
    } failBlock:^(id respone) {
        
    }];
}

- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"%s",__func__);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setLayoutForView {
    self.view.backgroundColor = kGlobalColor;
    self.tableView.backgroundColor = [UIColor clearColor];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataSource.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSDictionary *dict = [dataSource objectAtIndex:section];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    view.backgroundColor = [UIColor greenColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, view.frame.size.width - 10, 40)];
    titleLabel.text = [dict objectForKey:@"name"];
    titleLabel.textColor = [UIColor whiteColor];
    [view addSubview:titleLabel];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[dataSource objectAtIndex:section] objectForKey:@"subcategory"] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeftMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[LeftMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSArray *array = [[dataSource objectAtIndex:indexPath.section] objectForKey:@"subcategory"];
    NSDictionary *dict = [array objectAtIndex:indexPath.row];
    cell.titleLabel.text = [dict objectForKey:@"name"];
    cell.contentView.backgroundColor = [UIColor brownColor];
    if (indexPath.row %2 == 1) {
        cell.iconImageView.image = [UIImage imageNamed:@"menu_music.png"];
    } else {
        cell.iconImageView.image = [UIImage imageNamed:@"livetv_TV.png"];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = [[dataSource objectAtIndex:indexPath.section] objectForKey:@"subcategory"];
    NSDictionary *dict = [array objectAtIndex:indexPath.row];
    HomeController *home = (HomeController *)self.sidePanelController.centerPanel;
    [home loadData:[dict objectForKey:@"id"]];
    [self.sidePanelController showCenterPanelAnimated:YES];
}
@end
