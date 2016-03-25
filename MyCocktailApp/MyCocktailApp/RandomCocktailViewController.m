//
//  RandomCoaktailViewController.m
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/19/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import "RandomCocktailViewController.h"
#import "CocktailDetailViewController.h"
#import "AppDelegate.h"
#import "CocktailStore.h"

@interface RandomCocktailViewController ()

@end

@implementation RandomCocktailViewController

@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize cocktail = _cocktail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Random Cocktail", @"Random Cocktail");
        self.tabBarItem.image = [UIImage imageNamed:@"tab_shaker_small_white"];
        
        UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        navLabel.backgroundColor = [UIColor clearColor];
        navLabel.textColor = [UIColor colorWithRed:0.812 green:0.0 blue:0.376 alpha:1];
        navLabel.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        navLabel.text = NSLocalizedString(@"Random Cocktail", @"Random Cocktail");
        navLabel.textAlignment = UITextAlignmentCenter;
        self.navigationItem.titleView = navLabel;        self.navigationItem.titleView = navLabel;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // show navigation bar
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark shaking
-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    int count = (int)[[[CocktailStore sharedStore] allCocktails] count];
    int randomIndex = arc4random() % count;
    self.cocktail = [[[CocktailStore sharedStore] allCocktails] objectAtIndex:randomIndex];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake){
        CocktailDetailViewController *detailViewController;
        detailViewController = [[CocktailDetailViewController alloc] initWithNibName:@"CocktailDetailViewController" bundle:nil];
        detailViewController.cocktail = self.cocktail;
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
}

@end
