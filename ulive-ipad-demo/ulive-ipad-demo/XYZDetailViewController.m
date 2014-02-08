//
//  XYZDetailViewController.m
//  ulive-ipad-demo
//
//  Created by Olivia Osby on 2/6/14.
//  Copyright (c) 2014 Olivia Osby. All rights reserved.
//

#import "XYZDetailViewController.h"

@interface XYZDetailViewController ()

@end

@implementation XYZDetailViewController

@synthesize showItemObj;
@synthesize webby;
@synthesize videoTitleLabel;
@synthesize videoDescLabel;

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
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:showItemObj.link];
    [webby loadRequest:requestObj];
    videoTitleLabel.text = showItemObj.title;
    [videoTitleLabel setNumberOfLines:0];
    [videoTitleLabel sizeToFit];
    
    [videoDescLabel setNumberOfLines:0];
    [videoDescLabel sizeToFit];
    videoDescLabel.text = showItemObj.desc;
    NSLog(@"title %@", showItemObj.title);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
