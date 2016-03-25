//
//  MyCell.h
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/20/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *ingred;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
