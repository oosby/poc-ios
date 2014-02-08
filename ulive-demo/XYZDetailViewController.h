//
//  XYZDetailViewController.h
//  ulive-demo
//
//  Created by Olivia Osby on 2/5/14.
//  Copyright (c) 2014 Olivia Osby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZshowModel.h"

@interface XYZDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) XYZshowModel *showItemObj;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) NSString *descText;

@property (weak, nonatomic) IBOutlet UIImageView *thumb;

@property (weak, nonatomic) IBOutlet UIWebView *webby;

@end
