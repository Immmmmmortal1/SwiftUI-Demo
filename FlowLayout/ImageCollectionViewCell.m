//
//  ImageCollectionViewCell.m
//  FlowLayout
//
//  Created by 树下 on 2020/5/9.
//  Copyright © 2020 MY. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeUI];
    }
    return self;
}
- (void) makeUI{
    self.imageV = [[UIImageView alloc]init];
    self.imageV.image = [UIImage imageNamed:@"header.jpeg"];
    self.imageV.contentMode = UIViewContentModeScaleAspectFill;
    self.imageV.clipsToBounds = YES;
    [self addSubview:self.imageV];
}
-(void)drawRect:(CGRect)rect{
    self.imageV.frame = self.bounds;
}
@end
