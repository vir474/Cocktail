//
//  CocktailStore.h
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/19/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CocktailStore : NSObject

+ (instancetype) sharedStore;
- (NSArray *) allCocktails;

@end
