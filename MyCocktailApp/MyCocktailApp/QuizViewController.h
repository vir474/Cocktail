//
//  QuizViewController.h
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/19/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cocktail.h"

@interface QuizViewController : UIViewController
@property(nonatomic, assign) Cocktail *cocktail;
@property (weak, nonatomic) IBOutlet UILabel *ingredientsLabel;
@property (weak, nonatomic) IBOutlet UIButton *solution1Label;
@property (weak, nonatomic) IBOutlet UIButton *solution2Label;
@property (weak, nonatomic) IBOutlet UIButton *solution3Label;
@end
