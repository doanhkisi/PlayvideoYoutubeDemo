//
//  HomeController.m
//  LOLVideo
//
//  Created by Bui Duy Doanh on 10/10/14.
//  Copyright (c) 2014 doanhkisi. All rights reserved.
//

#import "HomeController.h"
#import "ListVideoCell.h"
#import <JASidePanelController.h>
#import <UIViewController+JASidePanel.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface HomeController () {
    NSMutableArray *dataSource;
}

@end

@implementation HomeController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        [self.headerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    dataSource = [NSMutableArray new];
    [self fakeData];
    [self.tableView reloadData];
    [self setLayoutForView];
}
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s",__func__);
}
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setLayoutForView {
    self.headerView.backgroundColor = kGlobalColor;
}
- (void)loadData:(NSString *)cate_id {
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:cate_id forKey:@"cate_id"];
    [RequestManager startRequest:[NSString stringWithFormat:@"%@%@",kBASE_URL,kAPI_LEFT_MENU_LOAD_CATEGORY] params:params method_type:kGET progressInView:nil successBlock:^(id respone) {
        NSLog(@"Repone %@",respone);
    } failBlock:^(id respone) {
        NSLog(@"Repone %@",respone);
    }];

}
- (void)fakeData {
    NSDictionary *dict1 =@{@"id":@1,@"name":@"Để tmai tính 2 - BTS Lên nóc nhà, nhảy qua phà", @"view":@100000, @"image":@"http://ssisoft.com/Client/upload/News/User_1/2014/6/30/viral-real-estate-video.png",@"link":@"", @"time":@1000};
    NSDictionary *dict2 =@{@"id":@2,@"name":@"One direction - Night changes (Behind)", @"view":@30000, @"image":@"http://www.thesaleslion.com/wp-content/uploads/2013/03/video.jpg", @"link":@"",@"time":@300};
    NSDictionary *dict3 =@{@"id":@1,@"name":@"iPhone 6 và những thông tin mới được hé lộ trước giờ G", @"view":@100000, @"image":@"http://didongthongminh.vn/images/image-1409898897-image-1408812027-825A7412-1160x773.jpg",@"link":@""};
    NSDictionary *dict4 =@{@"id":@2,@"name":@"Lộ diện thiết kế đầy đủ của iPhone 6", @"view":@30000, @"image":@"http://didongthongminh.vn/images/tintuc/ADR_Iphone6_011_1.jpg", @"link":@"",@"time":@1000};
    NSDictionary *dict5 =@{@"id":@1,@"name":@"ĐThêm vào đó, nguồn tin trên cũng cho hay, mới đây, đội ngũ chăm sóc khách hàng ", @"view":@100000, @"image":@"http://ssisoft.com/Client/upload/News/User_1/2014/6/30/viral-real-estate-video.png",@"link":@"",@"time":@700};
    NSDictionary *dict6 =@{@"id":@2,@"name":@"ORumani đã tuyên bố hủy tất cả kỳ nghỉ phép của nhân viên", @"view":@30000, @"image":@"http://www.thesaleslion.com/wp-content/uploads/2013/03/video.jpg", @"link":@"",@"time":@1023};
    NSDictionary *dict7 =@{@"id":@1,@"name":@"Sau đây là loạt ảnh mới về model iPhone 6 sắp ra mắt:", @"view":@100000, @"image":@"http://didongthongminh.vn/images/image-1409898897-image-1408812027-825A7412-1160x773.jpg",@"link":@"",@"time":@2434};
    NSDictionary *dict8 =@{@"id":@2,@"name":@"Mới đây, xuất hiện 1 loạt ảnh về iPhone 6 sắp ra mắt, được đăng tải với đầy đủ thông tin", @"view":@30000, @"image":@"http://didongthongminh.vn/images/tintuc/ADR_Iphone6_011_1.jpg", @"link":@"",@"time":@1760};
    [dataSource addObject:dict1];
    [dataSource addObject:dict2];
    [dataSource addObject:dict3];
    [dataSource addObject:dict4];
    [dataSource addObject:dict5];
    [dataSource addObject:dict6];
    [dataSource addObject:dict7];
    [dataSource addObject:dict8];
}

- (IBAction)buttonAction:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSLog(@"x%f y %f",button.frame.origin.x,button.frame.origin.y);
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
- (IBAction)leftMenuAction:(id)sender {
    [self.sidePanelController showLeftPanelAnimated:YES];
    [self.sidePanelController setCenterPanelHidden:YES animated:YES duration:0.25];

}
- (IBAction)rightMenuAction:(id)sender {
    [self.sidePanelController showRightPanelAnimated:YES];
    [RequestManager startRequest:@"http://dev-vn.magestore.com/simicart/1800/index.php/connector/index/testIOS/offset/0/limit/10" params:nil method_type:kGET progressInView:self.view successBlock:^(id respone) {
        dataSource = [respone objectForKey:@"data"];
        //        [self.tableView reloadData];
    } failBlock:^(id respone) {
        
    }];
}

#pragma mark UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifer = @"Cell";
    ListVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[ListVideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    NSDictionary *dict = [dataSource objectAtIndex:indexPath.row];
    [cell.videoImageView sd_setImageWithURL:[NSURL URLWithString:[dict objectForKey:@"image"]] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    cell.videoNameLabel.text = [dict objectForKey:@"name"];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    cell.countViewsLabel.text = [NSString stringWithFormat:@"%@ views",[formatter stringFromNumber:[dict objectForKey:@"view"]]];
    NSInteger totalTime = [[dict objectForKey:@"time"] integerValue];;
    NSInteger hour = totalTime/3600;
    NSInteger minute = totalTime/60;
    NSInteger second = totalTime%60;
    cell.timeLabel.text =[NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hour, (long)minute, (long)second];
    cell.contentView.backgroundColor = [UIColor brownColor];
     return cell;
}

@end
