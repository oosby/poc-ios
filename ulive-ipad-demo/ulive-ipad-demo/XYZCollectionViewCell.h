//
//  XYZCollectionViewCell.h
//  ulive-ipad-demo
//
//  Created by Olivia Osby on 2/6/14.
//  Copyright (c) 2014 Olivia Osby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *thumb;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@end
