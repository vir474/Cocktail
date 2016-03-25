//
//  CocktailsTableViewController.m
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/19/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import "CocktailsTableViewController.h"
#import "CocktailStore.h"
#import "Cocktail.h"
#import "CocktailCell.h"
#import "CocktailDetailViewController.h"
#import "MyCell.h"

@interface CocktailsTableViewController ()

@end

@implementation CocktailsTableViewController

-(instancetype)init {
    
    self = [super initWithStyle:UITableViewStylePlain];
    if ( self ) {
        UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        navLabel.backgroundColor = [UIColor clearColor];
        navLabel.textColor = [UIColor colorWithRed:0.812 green:0.0 blue:0.376 alpha:1];
        navLabel.text = NSLocalizedString(@"Cocktails", @"Cocktails");
        navLabel.textAlignment = UITextAlignmentCenter;
        self.navigationItem.titleView = navLabel;
        self.title = NSLocalizedString(@"Cocktails", @"Cocktails");
        self.tabBarItem.image = [UIImage imageNamed:@"tab_cocktails_small_white"];
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:style];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    return [[[CocktailStore sharedStore] allCocktails] count];
}

- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CocktailTableViewCell" forIndexPath: indexPath];
    NSArray *cocktails = [[CocktailStore sharedStore] allCocktails];
    Cocktail *cocktail = cocktails[indexPath.row];

    //Configure the cell with the Cocktail
    cell.image.image = [UIImage imageNamed:cocktail.photoUrl];
    cell.name.font = [UIFont fontWithName:@"STHeitiSC-Light" size:17.0];
    cell.name.text = NSLocalizedString(cocktail.name, nil);
//    cell.ingred.font = [UIFont systemFontOfSize:12.0];
    cell.ingred.font = [UIFont fontWithName:@"STHeitiSC-Light" size:12.0];
    cell.ingred.text = NSLocalizedString(cocktail.ingredeints, nil);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
 
    return cell;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    // Load the NIB file
    UINib *nib = [UINib nibWithNibName:@"MyCell" bundle: nil];
    
    // Register this NIB, which contains the cell
    [self.tableView registerNib: nib forCellReuseIdentifier:@"CocktailTableViewCell"];
    
 //   [self.tableView registerClass: [CocktailCell class] forCellReuseIdentifier:@"CocktailCell"];
}

- (void) viewWillAppear:( BOOL) animated
{
    [super viewWillAppear: animated];
    [self.tableView setRowHeight:78.0];
    [self.tableView reloadData];
    self.tableView.scrollEnabled = YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        CocktailDetailViewController *detailViewController;
        detailViewController = [[CocktailDetailViewController alloc] init];
    
        NSArray *cocktails = [[CocktailStore sharedStore] allCocktails];
        detailViewController.cocktail = [cocktails objectAtIndex:indexPath.row];
 
        [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
