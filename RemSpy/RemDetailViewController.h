//
//  RemDetailViewController.h
//  RemSpy
//
//  Created by Zhang on 15/10/12.
//  Copyright (c) 2012 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RemDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
