//
//  CustomFlowLayout.m
//  FlowLayout
//
//  Created by 树下 on 2020/5/9.
//  Copyright © 2020 MY. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout

/**
    UICollectionViewLayoutAttributes:确定cell的尺寸
    UICollectionViewLayoutAttributes:的一个对象就是一个cell
    拿到UICollectionViewLayoutAttributes相当于拿到cell

 */

//:什么时候调用 第一次布局 和 刷新的时候
//:此方法用于计算cell的 布局  前提是 cell的 位置固定不变
- (void)prepareLayout{
    [super prepareLayout];
}
//:返回指定区域内的的cell的尺寸
//:可以一次性返回所有cell的尺寸 也可以每隔一个距离返回 cell
- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    //1.获取当前 显示的cell的 布局
    NSArray *attrs = [super layoutAttributesForElementsInRect:self.collectionView.bounds];
    
    //2.遍历计算
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        //:计算中心点的距离
        CGFloat delta = fabs((attr.center.x - self.collectionView.contentOffset.x) - self.collectionView.bounds.size.width*0.5);
        //:根据距离中心的距离 来确定的当前cell的 缩放的大小
        CGFloat scale = 1 - delta/(self.collectionView.bounds.size.width * 0.5)*0.25;
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return attrs;
}
//:调用时机 手机松开就会调用
//:作用:确定最终的偏移量
//:定位:距离中心越近 最终决定展示到 中心
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    //:拖动较快 最终偏移量不等于 手指离开时的偏移量
    
    //:获取当前cellectionview 的宽度
    CGFloat collectionW = self.collectionView.bounds.size.width;
    
    //:最终偏移量
    
    CGPoint  tagertP = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    
    //:获取最终显示的区域
    CGRect  finalRect = CGRectMake(tagertP.x, 0, collectionW, MAXFLOAT);
    //:获取最终显示的cell
    NSArray *finalattrs = [super layoutAttributesForElementsInRect:finalRect];
    
    //:获取最小间隔
    CGFloat minDelta = MAXFLOAT;
    
    for (UICollectionViewLayoutAttributes *attr in finalattrs) {
        //:获取距离中心的点的距离 使用最终的x
        CGFloat detla = (attr.center.x - tagertP.x) - self.collectionView.bounds.size.width*0.5;
        
        if (fabs(detla) < fabs(minDelta)) {
            minDelta = detla;
        }
    }
    //:移动距离
    tagertP.x += minDelta;
    
    if (tagertP.x < 0 ) {
        tagertP.x = 0;
    }
    return tagertP;
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}


@end
