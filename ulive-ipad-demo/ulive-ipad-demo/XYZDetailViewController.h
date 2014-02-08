//
//  XYZDetailViewController.h
//  ulive-ipad-demo
//
//  Created by Olivia Osby on 2/6/14.
//  Copyright (c) 2014 Olivia Osby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZvideoModel.h"

@interface XYZDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webby;
@property (nonatomic, strong) XYZvideoModel *showItemObj;
@property (strong, nonatomic) IBOutlet UILabel *videoTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *videoDescLabel;

@end
