//
//  XYZDetailViewController.m
//  ulive-demo
//
//  Created by Olivia Osby on 2/5/14.
//  Copyright (c) 2014 Olivia Osby. All rights reserved.
//

#import "XYZDetailViewController.h"
#import "XYZshowModel.h"

@interface XYZDetailViewController ()

@end

@implementation XYZDetailViewController

@synthesize titleLabel;
@synthesize titleText;
@synthesize showItemObj;

@synthesize descLabel;
@synthesize descText;

@synthesize thumb;

@synthesize webby;


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
    
//    titleLabel.text = showItemObj.title;
//    descLabel.text = showItemObj.desc;
//    [thumb setImage:showItemObj.img];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:showItemObj.link];
    [webby loadRequest:requestObj];
    
    NSLog(@"text %@", showItemObj);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


