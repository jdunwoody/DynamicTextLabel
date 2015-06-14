//
// Created by James Dunwoody on 11/06/15.
// Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import "FontScale.h"

@interface FontScale ()
@property (nonatomic, readonly) NSDictionary *fontStyleToSize;
@end

@implementation FontScale

- (instancetype)init
{
    self = [super init];

    if (self) {
        _fontStyleToSize = @{
            @"UICTContentSizeCategoryXS"                : @0.4f,
            @"UICTContentSizeCategoryS"                 : @0.6f,
            @"UICTContentSizeCategoryM"                 : @0.8f,
            @"UICTContentSizeCategoryL"                 : @1.0f,
            @"UICTContentSizeCategoryXL"                : @1.2f,
            @"UICTContentSizeCategoryXXL"               : @1.4f,
            @"UICTContentSizeCategoryXXXL"              : @1.6f,
            @"UICTContentSizeCategoryAccessibilityM"    : @1.8f,
            @"UICTContentSizeCategoryAccessibilityL"    : @2.2f,
            @"UICTContentSizeCategoryAccessibilityXL"   : @2.6f,
            @"UICTContentSizeCategoryAccessibilityXXL"  : @3.0f,
            @"UICTContentSizeCategoryAccessibilityXXXL" : @3.6f,
        };
    }

    return self;
}

- (CGFloat)amount
{
    NSString *preferredContentSizeCategory = [[UIApplication sharedApplication] preferredContentSizeCategory];
    NSNumber *sizeAmount = self.fontStyleToSize[preferredContentSizeCategory];
    CGFloat amount = [sizeAmount floatValue];
    return amount;
}

@end
