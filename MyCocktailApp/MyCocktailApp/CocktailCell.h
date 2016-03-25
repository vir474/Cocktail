//
//  CocktailCell.h
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/20/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CocktailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cocktailImage;
@property (weak, nonatomic) IBOutlet UILabel *cocktailIngredients;
@property (weak, nonatomic) IBOutlet UILabel *cocktailName;


@end
