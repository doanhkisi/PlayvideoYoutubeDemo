//
//  ListVideoCell.h
//  LOLVideo
//
//  Created by Bui Duy Doanh on 12/3/14.
//  Copyright (c) 2014 doanhkisi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListVideoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;
@property (weak, nonatomic) IBOutlet UILabel *videoNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countViewsLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
