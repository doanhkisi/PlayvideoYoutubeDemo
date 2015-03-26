//
//  MySidePanelController.m
//  LOLVideo
//
//  Created by Bui Duy Doanh on 10/10/14.
//  Copyright (c) 2014 doanhkisi. All rights reserved.
//

#import "MySidePanelController.h"
#import "BookmarksController.h"
#import "LeftMenuController.h"
#import "HomeController.h"
@interface MySidePanelController ()

@end

@implementation MySidePanelController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
-(void) awakeFromNib
{
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"LeftMenuController"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"HomeController"]];
    [self setRightPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"BookmarksController"]];
}

@end
