//
//  ViewController.m
//  collectionView
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 apple. All rights reserved.
//

#define kbounds [UIScreen mainScreen].bounds
#import "ViewController.h"
#import "MFFlowLayout.h"
#import "MFCollectionViewCell.h"
#import "MFcollectionView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) MFcollectionView *mfCollectionView;

//@property (nonatomic, assign) NSInteger numItem;

@end

static NSString *reuseIdentifier = @"MFCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MFFlowLayout *layout = [[MFFlowLayout alloc] init];
    
//    self.layout = layout;
//    layout.estimatedItemSize = CGSizeMake(200, 300);
    UICollectionView *collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 100) collectionViewLayout:layout];
    [self.view addSubview:collectView];
    collectView.backgroundColor = [UIColor lightGrayColor];
    collectView.dataSource = self;
    collectView.delegate = self;
    collectView.showsHorizontalScrollIndicator = NO;
    self.collectionView = collectView;
    [collectView registerClass:[MFCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    UICollectionViewFlowLayout *layout1 = [[UICollectionViewFlowLayout alloc] init];
    layout1.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout1.minimumLineSpacing = 0;
    layout1.itemSize = CGSizeMake(50, 80);
    MFcollectionView *collectionView = [[MFcollectionView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 80) collectionViewLayout:layout1];
    collectionView.backgroundColor = [UIColor whiteColor];
    self.mfCollectionView = collectionView;
    
    [self.view addSubview:collectionView];
    
    
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}
//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
//    CGFloat maxF = MAXFLOAT;
//    CGFloat h = proposedContentOffset.x + (CGRectGetWidth(self.layout.collectionView.bounds) / 2.0);
//    return velocity;
//}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1000*1000;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    cell.center = self.view.center;
//    cell.frame = CGRectMake((kbounds.size.width - 200) / 2, (kbounds.size.height - 300) / 2, cell.bounds.size.width, cell.bounds.size.height);
//    cell.contentView.backgroundColor = [UIColor redColor];
//    NSLog(@"%ld", indexPath.item);
//    cell.item = @(indexPath.item).description;
//    NSLog(@"%ld", cell.indexPath.item);
//    NSLog(@"%ld", indexPath.item);
    
//    MFcollectionView *CV = [[MFcollectionView alloc] init];
    
    self.mfCollectionView.MyBlock = ^(NSIndexPath *indexPaths){
        NSLog(@"%ld", indexPaths.item);
        [collectionView scrollToItemAtIndexPath:indexPaths atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    };

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.bounds];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", indexPath.item % 26 + 1]];
//    NSLog(@"%ld", indexPath.item % 26);
    [cell.contentView addSubview:imageView];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeItem:) name:@"changeItem" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(move:) name:@"move" object:nil];
    
//    [collectionView scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
//    [collectionView reloadData];
//    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
    self.mfCollectionView.MyScrollBlock = ^(UIScrollView *scroll){
        NSInteger numItem = scroll.contentOffset.x / 50;
        [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:numItem inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    };
    
    return cell;
}

//-(void)move:(NSNotification *)nsnotify{
//    UIScrollView *scroll = nsnotify.object;
//    NSInteger numItem = scroll.contentOffset.x / 50;
//    self.numItem = numItem;
//    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:numItem inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
//    [self.collectionView reloadData];
//}

//-(void)changeItem:(NSNotification *)nsnotify{
//    NSIndexPath *indexPath = nsnotify.object;
//    NSLog(@"%ld", indexPath.item);
//    self.indexPath = indexPath;
//    NSLog(@"%ld-------", self.indexPath.item);
//    [self.collectionView scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
//}

@end
