//
//  QuizViewController.m
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/19/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import "QuizViewController.h"
#import "CocktailStore.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    navLabel.backgroundColor = [UIColor clearColor];
    navLabel.textColor = [UIColor colorWithRed:0.812 green:0.0 blue:0.376 alpha:1];
    navLabel.text = NSLocalizedString(@"Quiz", @"Quiz");
    navLabel.textAlignment = UITextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    
    self.title = NSLocalizedString(@"Quiz", @"Quiz");
    self.tabBarItem.image = [UIImage imageNamed:@"tab_housebar_small_white"];
    
    return self;
}

-(void)reload
{
    NSArray *cocktails = [[CocktailStore sharedStore] allCocktails];
    int count = (int)[cocktails count]-1;
    int randomIndex = arc4random() % count;
    self.cocktail = [cocktails objectAtIndex:randomIndex];
    
    int randomIndexFalse1 = arc4random() % count;
    while(randomIndexFalse1 == randomIndex){
        randomIndexFalse1 = arc4random() % count;
    }
    Cocktail *cocktailFalse1 = [cocktails objectAtIndex:randomIndexFalse1];
    
    int randomIndexFalse2 = arc4random() % count;
    while(randomIndexFalse2 == randomIndex || randomIndexFalse2 == randomIndexFalse1){
        randomIndexFalse2 = arc4random() % count;
    }
    Cocktail *cocktailFalse2 = [cocktails objectAtIndex:randomIndexFalse2];
    
    int solutionPosition = arc4random() % 3;
    int falseAnswerPosition1 = arc4random() % 3;
    while(solutionPosition == falseAnswerPosition1){
        falseAnswerPosition1 = arc4random() % 3;
    }
    int falseAnswerPosition2 = arc4random() % 3;
    while(solutionPosition == falseAnswerPosition2 || falseAnswerPosition1 == falseAnswerPosition2){
        falseAnswerPosition2 = arc4random() % 3;
    }
    
    // ingredients
    UILabel *label = self.ingredientsLabel;
    label.text = NSLocalizedString(self.cocktail.ingredeints,nil);
    
    // solution
    UIButton *button = (UIButton *)[self.view viewWithTag:solutionPosition+2];
    [button setTitle:self.cocktail.name forState:UIControlStateNormal];
    // reset target
    [button removeTarget:self action:@selector(solution) forControlEvents:UIControlEventTouchUpInside];
    [button removeTarget:self action:@selector(falseAnswer) forControlEvents:UIControlEventTouchUpInside];
    // add new target
    [button addTarget:self action:@selector(solution) forControlEvents:UIControlEventTouchUpInside];
    
    // false answer 1
    button = (UIButton *)[self.view viewWithTag:falseAnswerPosition1+2];
    [button setTitle:cocktailFalse1.name forState:UIControlStateNormal];
    // reset target
    [button removeTarget:self action:@selector(solution) forControlEvents:UIControlEventTouchUpInside];
    [button removeTarget:self action:@selector(falseAnswer) forControlEvents:UIControlEventTouchUpInside];
    // add new target
    [button addTarget:self action:@selector(falseAnswer) forControlEvents:UIControlEventTouchUpInside];
    
    // false answer 2
    button = (UIButton *)[self.view viewWithTag:falseAnswerPosition2+2];
    [button setTitle:cocktailFalse2.name forState:UIControlStateNormal];
    // reset target
    [button removeTarget:self action:@selector(solution) forControlEvents:UIControlEventTouchUpInside];
    [button removeTarget:self action:@selector(falseAnswer) forControlEvents:UIControlEventTouchUpInside];
    // add new target
    [button addTarget:self action:@selector(falseAnswer) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self reload];
}

-(void)solution
{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"CorrectKey",nil) message:[NSString stringWithFormat:NSLocalizedString(@"CorrectAnswerKey",nil), self.cocktail.name] delegate: self cancelButtonTitle:NSLocalizedString(@"NextQuestionKey",nil) otherButtonTitles: nil] show];
    NSLog(@"solution clicked");
}

-(void)falseAnswer
{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"IncorrectKey",nil) message:[NSString stringWithFormat:NSLocalizedString(@"FalseAnswerKey",nil), self.cocktail.name] delegate: self cancelButtonTitle:NSLocalizedString(@"NextQuestionKey",nil) otherButtonTitles: nil] show];
    NSLog(@"false answer clicked");
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self reload];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
