//
//  CocktailDetailViewController.h
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/20/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cocktail.h"

@interface CocktailDetailViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) Cocktail *cocktail;
@end
