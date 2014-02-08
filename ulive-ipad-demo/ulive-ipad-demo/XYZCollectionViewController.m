//
//  XYZCollectionViewController.m
//  ulive-ipad-demo
//
//  Created by Olivia Osby on 2/6/14.
//  Copyright (c) 2014 Olivia Osby. All rights reserved.
//

#import "XYZCollectionViewController.h"
#import "XYZvideoModel.h"
#import "XYZCollectionViewCell.h"
#import "XYZDetailViewController.h"

@interface XYZCollectionViewController ()

@property NSMutableArray *showList;

@end

@implementation XYZCollectionViewController


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
    
    self.showList = [[NSMutableArray alloc] init];
    
    NSString *urlString = @"http://localhost:8000/json/ulive.json";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    [self parseJSONData:data];
}

#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.showList count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Item" forIndexPath:indexPath];
    long row = [indexPath row];
    XYZvideoModel *item = [self.showList objectAtIndex:indexPath.row];
    
    
    cell.thumb.image = item.img;
    
    cell.titleLabel.text = item.title;
    cell.titleLabel.frame = CGRectMake(0, 0, 256, 10);
    cell.titleLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:.8];
    
    cell.descLabel.text = item.desc;
    cell.descLabel.frame = CGRectMake(0, 0, 256, 20);
    cell.descLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:.8];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)parseJSONData:(NSData *)data {
    NSError *error;
    NSDictionary *parsedJSONData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    for (NSDictionary *dict in parsedJSONData[@"videos"]) {
        
        [self makeModels:dict];
    }
}

- (void)makeModels:(NSDictionary *)dict {
    NSString *weburl = [[NSString alloc] initWithFormat:@"%@",[dict objectForKey:@"hdImg"]];
    NSString *weburlparam = [weburl componentsSeparatedByString:@"?url="][1];
    NSString *urlstring = [weburlparam stringByReplacingOccurrencesOfString:@"\"" withString:@""];

    NSURL *url = [[NSURL alloc] initWithString:[urlstring stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    NSURL *link = [NSURL URLWithString:[dict objectForKey:@"streamUrls"]];
    
    XYZvideoModel *mod = [[XYZvideoModel alloc] init];
    
    mod.title = [dict objectForKey:@"title"];
    mod.desc = [dict objectForKey:@"description"];
    mod.img = [[UIImage alloc] initWithData:data];
    mod.link = link;
    
    [self.showList addObject:mod];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"videoItem"]) {
        NSIndexPath *indexPath = [[self.cView indexPathsForSelectedItems] objectAtIndex:0];
        XYZvideoModel *item = [self.showList objectAtIndex:indexPath.row];
        XYZDetailViewController *destView = segue.destinationViewController;
        destView.showItemObj = item;
    }
}

@end
