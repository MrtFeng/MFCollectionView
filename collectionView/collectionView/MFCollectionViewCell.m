//
//  MFCollectionViewCell.m
//  collectionView
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "MFCollectionViewCell.h"

@implementation MFCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.contentView.backgroundColor = [UIColor redColor];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
//    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", self.item.intValue + 1]];
//    [self.contentView addSubview:imageView];
//    NSLog(@"%d", self.item);
    return self;
}

@end
