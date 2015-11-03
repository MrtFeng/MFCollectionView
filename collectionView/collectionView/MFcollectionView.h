//
//  MFcollectionView.h
//  collectionView
//
//  Created by apple on 15/10/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFcollectionView : UICollectionView

@property (nonatomic, copy) void (^MyBlock)(NSIndexPath *indexPaths);

@property (nonatomic, copy) void (^MyScrollBlock)(UIScrollView *scrollView);

@end
