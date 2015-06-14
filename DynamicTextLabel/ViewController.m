//
//  ViewController.m
//  DynamicTextLabel
//
//  Created by James Dunwoody on 11/06/2015.
//  Copyright (c) 2015 James Dunwoody. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, readonly) NSDictionary *fontStyleToSize;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangePreferredContentSize:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self configureView];
}

- (void)didChangePreferredContentSize:(id)didChangePreferredContentSize
{
    [self configureView];
}

- (void)configureView
{
    NSString *preferredContentSizeCategory = [UIApplication sharedApplication].preferredContentSizeCategory;
    self.currentTextStyleLabel.text = preferredContentSizeCategory;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
