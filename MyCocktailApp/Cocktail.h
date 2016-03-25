//
//  Cocktail.h
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/20/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Cocktail : NSManagedObject

@property (nonatomic, retain) NSString * alcLevel;
@property (nonatomic, retain) NSString * calKcal;
@property (nonatomic, retain) NSString * components;
@property (nonatomic, retain) NSString * difficulty;
@property (nonatomic, retain) NSString * glassName;
@property (nonatomic, retain) NSString * glassPhotoUrl;
@property (nonatomic, retain) NSString * ingredeints;
@property (nonatomic, retain) NSString * instructions;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * prepTime;
@property (nonatomic, retain) NSString * photoUrl;
@property (nonatomic, retain) NSString * volCl;

@end
