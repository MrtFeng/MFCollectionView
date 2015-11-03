//
//  MFcollectionView.m
//  collectionView
//
//  Created by apple on 15/10/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "MFcollectionView.h"

@interface MFcollectionView () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

static NSString *MFID = @"MFCellIndent";
@implementation MFcollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    UICollectionViewFlowLayout *layout1 = [[UICollectionViewFlowLayout alloc] init];
    layout1.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout1.minimumLineSpacing = 0;
    layout1.itemSize = CGSizeMake(50, 80);
    self = [super initWithFrame:frame collectionViewLayout:layout1];
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:MFID];
    self.delegate = self;
    self.dataSource = self;
    self.showsHorizontalScrollIndicator = NO;
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1000 * 1000;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MFID forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.bounds];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", indexPath.item % 26 + 1]];
    [cell.contentView addSubview:imageView];
    
//    if (self.MyBlock) {
//        self.MyBlock(indexPath);
//    }
    
    return cell;
}

//- (NSIndexPath *)collectionView:(UICollectionView *)collectionView targetIndexPathForMoveFromItemAtIndexPath:(NSIndexPath *)originalIndexPath toProposedIndexPath:(NSIndexPath *)proposedIndexPath {
//    NSLog(@"%@--%@", originalIndexPath, proposedIndexPath);
//    
//    return proposedIndexPath;
//}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.MyBlock) {
        self.MyBlock(indexPath);
    }
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeItem" object:indexPath];
    NSLog(@"上cell已被点击");
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll-- %f", scrollView.contentOffset.x);
//    NSString *moveItem = @(scrollView.contentOffset.x / 50).description;
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"move" object:scrollView];
    if (self.MyScrollBlock) {
        self.MyScrollBlock(scrollView);
    }
}

//-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewWillBeginDecelerating");
//}
//
//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewWillBeginDragging");
//}

@end
