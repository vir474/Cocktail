//
//  RandomCoaktailViewController.h
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/19/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cocktail.h"

@interface RandomCocktailViewController : UIViewController<NSFetchedResultsControllerDelegate, UINavigationBarDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property(nonatomic, assign) Cocktail *cocktail;
@end
