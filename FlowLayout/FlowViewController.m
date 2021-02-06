//
//  FlowViewController.m
//  FlowLayout
//
//  Created by 树下 on 2020/5/9.
//  Copyright © 2020 MY. All rights reserved.
//

#import "FlowViewController.h"
#import "ImageCollectionViewCell.h"
#import "CustomFlowLayout.h"

@interface FlowViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation FlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor yellowColor];
    self.view.backgroundColor = [UIColor blackColor];

    [self makeCollectionView];
    
    /**
     fasdhfdsa 
     <#condition#>
     */

}
- (void) makeCollectionView{
    
    CustomFlowLayout *fl = [[CustomFlowLayout alloc]init];
    fl.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:fl];
    collectView.delegate = self;
    collectView.dataSource = self;
    collectView.backgroundColor = [UIColor orangeColor];
    [collectView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:collectView];
    collectView.frame = CGRectMake(0,200, self.view.bounds.size.width, 200);
    
    [collectView scrollToItemAtIndexPath:[NSIndexPath indexPathWithIndex:1] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(300, 100);
}

@end
