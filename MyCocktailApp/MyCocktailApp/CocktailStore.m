//
//  CocktailStore.m
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/19/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import "CocktailStore.h"
#import <CoreData/CoreData.h>

@interface CocktailStore ()

@property (nonatomic) NSMutableArray *privateCocktails;
@property (nonatomic, strong) NSMutableArray *allAssetTypes;
@property (nonatomic, strong) NSMutableArray *allAssetLocations;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;

@end

@implementation CocktailStore

+ (instancetype) sharedStore
{
    // A static variable is not destroyed when the method is done executing.
    // Like a global variable, it is not kept on the stack.
    // Thus, it gets initialized only once
    
    static CocktailStore *sharedStore;
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[ self alloc] initPrivate];
    }
    return sharedStore;
}

// If a programmer calls [[INIItemStore alloc] init], let him
// know the error of his ways

- (instancetype) init
{
    [ NSException raise:@" Singleton" format:@" Use +[ CocktailStore sharedStore]"];
    return nil;
}

// Here is the real (secret) initializer
- (instancetype) initPrivate
{
    self = [super init];
    if ( self) {
        //Read in core data model
        _model = [NSManagedObjectModel mergedModelFromBundles: nil];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
        //Where does the SQLite file go?
        NSString *path = self.itemArchivePath;
        NSURL *storeURL = [NSURL fileURLWithPath: path];
        NSError *error;
        if (![psc addPersistentStoreWithType: NSSQLiteStoreType
                               configuration: nil
                                         URL: storeURL
                                     options: nil
                                       error:&error]) {
            [NSException raise:@"Open Failure"
                        format:@"Reason: %@",[error localizedDescription]];
        }
        //Create the managed object context
        _context = [[NSManagedObjectContext alloc] init];
        _context.persistentStoreCoordinator = psc;
        [self loadAllCocktails];
    }
    return self;
}

-(void)loadAllCocktails
{
    if (!self.privateCocktails){
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [NSEntityDescription entityForName:@"Cocktail"inManagedObjectContext: self.context];
        request.entity = e;

        NSError *error;
        NSArray *result = [self.context executeFetchRequest: request error:& error];
        if (! result){
            [NSException raise:@"Fetch failed"
                        format:@"Reason:%@",[error localizedDescription]];
        }
        self.privateCocktails = [[NSMutableArray alloc] initWithArray: result];
        
        // Is this the first time the program is being run?
        if ([_privateCocktails count] == 0) {
            NSManagedObject *cocktail;
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Cairo Cocktail" forKey:@"name"];
            [cocktail setValue:@"Cocktail17InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail17IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail17ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"beginner" forKey:@"difficulty"];
            [cocktail setValue:@"2" forKey:@"prepTime"];
            [cocktail setValue:@"9.1" forKey:@"alcLevel"];
            [cocktail setValue:@"243" forKey:@"calKcal"];
            [cocktail setValue:@"29" forKey:@"volCl"];
            [cocktail setValue: @"großer Tumbler" forKey:@"glassName"];
            [cocktail setValue:@"tumbler_gross.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"17.jpg" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Aperol Sour" forKey:@"name"];
            [cocktail setValue:@"Cocktail37InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail37IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail37ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"beginner" forKey:@"difficulty"];
            [cocktail setValue:@"2" forKey:@"prepTime"];
            [cocktail setValue:@"6.7" forKey:@"alcLevel"];
            [cocktail setValue:@"157" forKey:@"calKcal"];
            [cocktail setValue:@"16" forKey:@"volCl"];
            [cocktail setValue: @"Longdrinkglas" forKey:@"glassName"];
            [cocktail setValue:@"longdrink.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"longdrink_big.png" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];

            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Apricot Fizz" forKey:@"name"];
            [cocktail setValue:@"Cocktail38InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail38IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail38ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"beginner" forKey:@"difficulty"];
            [cocktail setValue:@"3" forKey:@"prepTime"];
            [cocktail setValue:@"7.1" forKey:@"alcLevel"];
            [cocktail setValue:@"173" forKey:@"calKcal"];
            [cocktail setValue:@"24" forKey:@"volCl"];
            [cocktail setValue: @"Hurricaneglas" forKey:@"glassName"];
            [cocktail setValue:@"hurricane.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"hurricane_big.png" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"B 52" forKey:@"name"];
            [cocktail setValue:@"Cocktail27InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail27IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail27ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"profi" forKey:@"difficulty"];
            [cocktail setValue:@"2" forKey:@"prepTime"];
            [cocktail setValue:@"30.5" forKey:@"alcLevel"];
            [cocktail setValue:@"153" forKey:@"calKcal"];
            [cocktail setValue:@"5" forKey:@"volCl"];
            [cocktail setValue: @"Shooter Glass" forKey:@"glassName"];
            [cocktail setValue:@"shooter.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"B52_iba_small.jpg" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Bahama Mama" forKey:@"name"];
            [cocktail setValue:@"Cocktail15InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail15IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail15ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"beginner" forKey:@"difficulty"];
            [cocktail setValue:@"2" forKey:@"prepTime"];
            [cocktail setValue:@"16.5" forKey:@"alcLevel"];
            [cocktail setValue:@"258" forKey:@"calKcal"];
            [cocktail setValue:@"25" forKey:@"volCl"];
            [cocktail setValue: @"Hurricaneglas" forKey:@"glassName"];
            [cocktail setValue:@"hurricane.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"15.jpg" forKey:@"photoUrl"];

            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Batida Kirsch" forKey:@"name"];
            [cocktail setValue:@"Cocktail16InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail16IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail16ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"beginner" forKey:@"difficulty"];
            [cocktail setValue:@"2" forKey:@"prepTime"];
            [cocktail setValue:@"4.3" forKey:@"alcLevel"];
            [cocktail setValue:@"315" forKey:@"calKcal"];
            [cocktail setValue:@"27" forKey:@"volCl"];
            [cocktail setValue: @"großer Tumbler" forKey:@"glassName"];
            [cocktail setValue:@"tumbler_gross.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"dreamstime_8945972-batida-kirsch.jpg" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];

            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Black Russian" forKey:@"name"];
            [cocktail setValue:@"Cocktail84InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail84IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail84ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"beginner" forKey:@"difficulty"];
            [cocktail setValue:@"2" forKey:@"prepTime"];
            [cocktail setValue:@"33.6" forKey:@"alcLevel"];
            [cocktail setValue:@"205" forKey:@"calKcal"];
            [cocktail setValue:@"14" forKey:@"volCl"];
            [cocktail setValue: @"kleiner Tumbler" forKey:@"glassName"];
            [cocktail setValue:@"tumbler_klein.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"black_russian_dreamstime_12849334_small.jpg" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Bloody Mary" forKey:@"name"];
            [cocktail setValue:@"Cocktail86InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail86IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail86ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"advanced" forKey:@"difficulty"];
            [cocktail setValue:@"3" forKey:@"prepTime"];
            [cocktail setValue:@"9.5" forKey:@"alcLevel"];
            [cocktail setValue:@"123" forKey:@"calKcal"];
            [cocktail setValue:@"18" forKey:@"volCl"];
            [cocktail setValue: @"Wineglas" forKey:@"glassName"];
            [cocktail setValue:@"wine.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"bloodymary_small.jpg" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Blue Hawaiian" forKey:@"name"];
            [cocktail setValue:@"Cocktail20InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail20IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail20ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"beginner" forKey:@"difficulty"];
            [cocktail setValue:@"4" forKey:@"prepTime"];
            [cocktail setValue:@"9.8" forKey:@"alcLevel"];
            [cocktail setValue:@"185" forKey:@"calKcal"];
            [cocktail setValue:@"32" forKey:@"volCl"];
            [cocktail setValue: @"Hurricaneglas" forKey:@"glassName"];
            [cocktail setValue:@"hurricane.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"20.jpg" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Blue Lagoon" forKey:@"name"];
            [cocktail setValue:@"Cocktail70InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail70IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail70ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"beginner" forKey:@"difficulty"];
            [cocktail setValue:@"2" forKey:@"prepTime"];
            [cocktail setValue:@"10.6" forKey:@"alcLevel"];
            [cocktail setValue:@"211" forKey:@"calKcal"];
            [cocktail setValue:@"28" forKey:@"volCl"];
            [cocktail setValue: @"Longdrinkglas" forKey:@"glassName"];
            [cocktail setValue:@"longdrink.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"IStock_000005989817XSmall-zorro_klein.jpg" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Brasilian Sunrise" forKey:@"name"];
            [cocktail setValue:@"Cocktail22InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail22IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail22ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"beginner" forKey:@"difficulty"];
            [cocktail setValue:@"4" forKey:@"prepTime"];
            [cocktail setValue:@"9.4" forKey:@"alcLevel"];
            [cocktail setValue:@"230" forKey:@"calKcal"];
            [cocktail setValue:@"24" forKey:@"volCl"];
            [cocktail setValue: @"großer Tumbler" forKey:@"glassName"];
            [cocktail setValue:@"tumbler_gross.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"22.jpg" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Caipirinha" forKey:@"name"];
            [cocktail setValue:@"Cocktail52InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail52IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail52ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"advanced" forKey:@"difficulty"];
            [cocktail setValue:@"3" forKey:@"prepTime"];
            [cocktail setValue:@"40" forKey:@"alcLevel"];
            [cocktail setValue:@"180" forKey:@"calKcal"];
            [cocktail setValue:@"26" forKey:@"volCl"];
            [cocktail setValue: @"kleiner Tumbler" forKey:@"glassName"];
            [cocktail setValue:@"tumbler_klein.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"21.jpg" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Caribbean Cruise" forKey:@"name"];
            [cocktail setValue:@"Cocktail13InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail13IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail13ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"profi" forKey:@"difficulty"];
            [cocktail setValue:@"2" forKey:@"prepTime"];
            [cocktail setValue:@"13.7" forKey:@"alcLevel"];
            [cocktail setValue:@"205" forKey:@"calKcal"];
            [cocktail setValue:@"16" forKey:@"volCl"];
            [cocktail setValue: @"großer Tumbler" forKey:@"glassName"];
            [cocktail setValue:@"tumbler_gross.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"tumbler_gross_big.png" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];
            
            cocktail = [NSEntityDescription insertNewObjectForEntityForName:@"Cocktail" inManagedObjectContext:self.context];
            [cocktail setValue:@"Chicago Freestyle" forKey:@"name"];
            [cocktail setValue:@"Cocktail32InstructionsKey" forKey:@"instructions"];
            [cocktail setValue:@"Cocktail32IngredientsKey" forKey:@"ingredeints"];
            [cocktail setValue:@"Cocktail32ComponentsKey" forKey:@"components"];
            [cocktail setValue:@"beginner" forKey:@"difficulty"];
            [cocktail setValue:@"2" forKey:@"prepTime"];
            [cocktail setValue:@"17" forKey:@"alcLevel"];
            [cocktail setValue:@"317" forKey:@"calKcal"];
            [cocktail setValue:@"27" forKey:@"volCl"];
            [cocktail setValue: @"großer Tumbler" forKey:@"glassName"];
            [cocktail setValue:@"tumbler_gross.png" forKey:@"glassPhotoUrl"];
            [cocktail setValue:@"tumbler_gross_big.png" forKey:@"photoUrl"];
            
            [_privateCocktails addObject:cocktail];

        }

    }
}

- (NSArray *) allCocktails
{
    return [self.privateCocktails copy];
}


-(NSString *)itemArchivePath
{
    
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                       NSUserDomainMask,
                                                                       YES);
    
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"store.data"];
}

- (BOOL) saveChanges
{
    NSError *error;
    BOOL successful = [self.context save:&error];
    if (!successful){
        NSLog(@"Error saving: %@", [error localizedDescription]);
    }
    return successful;
}

@end
