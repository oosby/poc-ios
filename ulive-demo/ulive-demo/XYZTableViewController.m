//
//  XYZTableViewController.m
//  ulive-demo
//
//  Created by Olivia Osby on 2/4/14.
//  Copyright (c) 2014 Olivia Osby. All rights reserved.
//

#import "XYZTableViewController.h"
#import "XYZshowModel.h"
#import "XYZDetailViewController.h"

@interface XYZTableViewController ()

@property NSMutableArray *showList;

@end

@implementation XYZTableViewController

@synthesize tView;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.showList = [[NSMutableArray alloc] init];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSString *urlString = @"http://localhost:8000/json/ulive.json";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSLog(@"urlstring: %@", urlString);
    [self parseJSONData:data];
}

- (void)parseJSONData:(NSData *)data {
    NSError *error;
    NSDictionary *parsedJSONData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    NSLog(@"data: %@", parsedJSONData[@"videos"]);
    
    for (NSDictionary *dict in parsedJSONData[@"videos"]) {
        [self makeModels:dict];
    }
}

- (void)makeModels:(NSDictionary *)dict {
    
    NSURL *url = [NSURL URLWithString:[dict objectForKey:@"hdImg"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSURL *link = [NSURL URLWithString:[dict objectForKey:@"streamUrls"]];
    
    
    XYZshowModel *mod = [[XYZshowModel alloc] init];
    mod.title = [dict objectForKey:@"title"];
    mod.desc = [dict objectForKey:@"description"];
    mod.img = [[UIImage alloc] initWithData:data];
    mod.link = link;

//    NSLog(@"item title: %@", [dict objectForKey:@"description"]);
    [self.showList addObject:mod];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.showList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Item";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    CGRect rect = CGRectMake(30, 5, 256, 35);
    
    // Configure the cell...
    XYZshowModel *item = [self.showList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.desc;
    cell.imageView.image = item.img;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"dest view %@", segue.identifier);
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tView indexPathForSelectedRow];
        XYZshowModel *item = [self.showList objectAtIndex:indexPath.row];
        XYZDetailViewController *destView = segue.destinationViewController;
        destView.showItemObj = [self.showList objectAtIndex:indexPath.row];
        
    }
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
