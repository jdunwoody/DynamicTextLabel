//
//  DynamicSizeLabel.m
//  DynamicTextLabel
//
//  Created by James Dunwoody on 11/06/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import "DynamicSizeLabel.h"
#import "FontScale.h"

@interface DynamicSizeLabel ()
@property (nonatomic, readonly) CGFloat originalPointSize;
@property (nonatomic, readonly) FontScale *fontScale;
@end

@implementation DynamicSizeLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self configure];
        return self;
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self configure];
        return self;
    }

    return self;
}

- (void)configure
{
    _fontScale = [[FontScale alloc] init];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangePreferredContentSize:) name:UIContentSizeCategoryDidChangeNotification object:nil];

    _originalPointSize = self.font.pointSize;

    [self configureView];
}

- (void)didChangePreferredContentSize:(id)didChangePreferredContentSize
{
    [self configureView];
}

- (void)configureView
{
    CGFloat fontScale = self.fontScale.amount;
    NSAssert(fontScale, @"No font scale found for %f", fontScale);

    CGFloat newFontSize = self.originalPointSize * fontScale;
    self.font = [UIFont fontWithDescriptor:self.font.fontDescriptor size:newFontSize];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
