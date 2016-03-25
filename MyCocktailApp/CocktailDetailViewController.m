//
//  CocktailDetailViewController.m
//  MyCocktailApp
//
//  Created by Vir474-MAC on 7/20/15.
//  Copyright (c) 2015 Vir474-MAC. All rights reserved.
//

#import "CocktailDetailViewController.h"

@interface CocktailDetailViewController ()

@end

@implementation CocktailDetailViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [((UIScrollView *)self.view)setDelegate:self];
        [((UIScrollView *)self.view)setScrollEnabled:YES];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [(UIScrollView *)self.view setContentSize: CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    navLabel.backgroundColor = [UIColor clearColor];
    navLabel.textColor = [UIColor colorWithRed:0.812 green:0.0 blue:0.376 alpha:1];
    navLabel.text = self.cocktail.name;
    navLabel.textAlignment = UITextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    CGSize maximumLabelSize;
    if(UIInterfaceOrientationIsLandscape(deviceOrientation)){
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            maximumLabelSize = CGSizeMake(440,9999);
        } else {
            maximumLabelSize = CGSizeMake(600,9999);
        }
    } else {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            maximumLabelSize = CGSizeMake(280,9999);
        } else {
            maximumLabelSize = CGSizeMake(353,9999);
        }
    }
   
    int yPosition = 8;
 
    // photo
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:1];
    imageView.image = [UIImage imageNamed:self.cocktail.photoUrl];
    CGRect newFrame = imageView.frame;
    newFrame.origin.y = yPosition;
    int imageHeight = newFrame.size.height;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        yPosition += imageHeight;
    }
  
    // ingredientsLabel
    UILabel *label = (UILabel *)[self.view viewWithTag:2];
    CGSize expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = yPosition + 15;
    label.frame = newFrame;
    int ingredientLabelHeight = expectedLabelSize.height;
    yPosition += ingredientLabelHeight + 15;

    
    // ingredients
    label = (UILabel *)[self.view viewWithTag:3];
    label.text = NSLocalizedString(self.cocktail.components,nil);
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = yPosition + 5;
    label.frame = newFrame;
    int ingredientHeight = expectedLabelSize.height;
    yPosition += ingredientHeight + 5;
    
    // instructionsLabel
    label = (UILabel *)[self.view viewWithTag:4];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = yPosition + 15;
    label.frame = newFrame;
    int instructionsLabelHeight = expectedLabelSize.height;
    yPosition += instructionsLabelHeight + 15;
    
    // instructions
    label = (UILabel *)[self.view viewWithTag:5];
    label.text = NSLocalizedString(self.cocktail.instructions,nil);
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = yPosition + 5;
    label.frame = newFrame;
    int instructionsHeight = expectedLabelSize.height;
    yPosition += instructionsHeight + 5;
    
    int firstRowDetails = yPosition + 5;
    
    // icon: alcohol level
    imageView = (UIImageView *)[self.view viewWithTag:6];
    newFrame = imageView.frame;
    newFrame.origin.y = firstRowDetails + 20;
    imageView.frame = newFrame;
    int iconAlcLevelHeight = newFrame.size.height;
    yPosition += iconAlcLevelHeight + 20;
    
    // heading: alcohol level
    label = (UILabel *)[self.view viewWithTag:7];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = firstRowDetails + 20;
    label.frame = newFrame;
    int headingAlcLevelHeight = expectedLabelSize.height;
    
    // value: alcohol level
    label = (UILabel *)[self.view viewWithTag:8];
    label.text = [NSString stringWithFormat:@"%@ %%", self.cocktail.alcLevel];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = firstRowDetails + 20 + headingAlcLevelHeight;
    label.frame = newFrame;
    
    // icon: calories
    imageView = (UIImageView *)[self.view viewWithTag:11];
    newFrame = imageView.frame;
    newFrame.origin.y = firstRowDetails + 20;
    imageView.frame = newFrame;
    int iconCaloriesHeight = newFrame.size.height;
    yPosition = firstRowDetails + iconCaloriesHeight + 20;
    
    // heading: calories
    label = (UILabel *)[self.view viewWithTag:9];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = firstRowDetails + 20;
    label.frame = newFrame;
    int headingCaloriesHeight = expectedLabelSize.height;
    
    // value: calories
    label = (UILabel *)[self.view viewWithTag:10];
    label.text = [NSString stringWithFormat:@"%@ kcal", self.cocktail.calKcal];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = firstRowDetails + 20 + headingCaloriesHeight;
    label.frame = newFrame;
    int secondRowDetails = yPosition;
    
    // icon: glass
    imageView = (UIImageView *)[self.view viewWithTag:12];
    imageView.image = [UIImage imageNamed:self.cocktail.glassPhotoUrl];
    newFrame = imageView.frame;
    newFrame.origin.y = secondRowDetails + 20;
    imageView.frame = newFrame;
    int iconGlassHeight = newFrame.size.height;
    yPosition = secondRowDetails + iconGlassHeight + 20;
    
    // heading: glass
    label = (UILabel *)[self.view viewWithTag:13];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = secondRowDetails + 20;
    label.frame = newFrame;
    int headingGlassHeight = expectedLabelSize.height;
    
    // value: glass
    label = (UILabel *)[self.view viewWithTag:14];
    label.text = NSLocalizedString(self.cocktail.glassName,nil);
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = secondRowDetails + 20 + headingGlassHeight;
    label.frame = newFrame;
    
    // icon: volume
    imageView = (UIImageView *)[self.view viewWithTag:17];
    newFrame = imageView.frame;
    newFrame.origin.y = secondRowDetails + 20;
    imageView.frame = newFrame;
    int iconVolumeHeight = newFrame.size.height;
    yPosition = secondRowDetails + iconVolumeHeight + 20;
    
    // heading: volume
    label = (UILabel *)[self.view viewWithTag:15];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = secondRowDetails + 20;
    label.frame = newFrame;
    int headingVolumeHeight = expectedLabelSize.height;
    
    // value: volume
    label = (UILabel *)[self.view viewWithTag:16];
    label.text = [NSString stringWithFormat:@"%@ cl", self.cocktail.volCl];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = secondRowDetails + 20 + headingVolumeHeight;
    label.frame = newFrame;
    int thirdRowDetails = yPosition;
    
    // icon: difficulty level
    imageView = (UIImageView *)[self.view viewWithTag:18];
    newFrame = imageView.frame;
    newFrame.origin.y = thirdRowDetails + 20;
    imageView.frame = newFrame;
    int iconDiffucultyHeight = newFrame.size.height;
    yPosition = thirdRowDetails + iconDiffucultyHeight + 20;
    
    // heading: difficulty level
    label = (UILabel *)[self.view viewWithTag:19];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = thirdRowDetails + 20;
    label.frame = newFrame;
    int headingDiffucultyHeight = expectedLabelSize.height;
    
    // value: difficulty level
    label = (UILabel *)[self.view viewWithTag:20];
    label.text = NSLocalizedString(self.cocktail.difficulty,nil);
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = thirdRowDetails + 20 + headingDiffucultyHeight;
    label.frame = newFrame;
    
    // icon: preparation time
    imageView = (UIImageView *)[self.view viewWithTag:23];
    newFrame = imageView.frame;
    newFrame.origin.y = thirdRowDetails + 20;
    imageView.frame = newFrame;
    int iconPrepTimeHeight = newFrame.size.height;
    yPosition = thirdRowDetails + iconPrepTimeHeight + 20;
    
    // heading: preparation time
    label = (UILabel *)[self.view viewWithTag:21];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = thirdRowDetails + 20;
    label.frame = newFrame;
    int headingPrepTimeHeight = expectedLabelSize.height;
    
    // value: preparation time
    label = (UILabel *)[self.view viewWithTag:22];
    label.text = [NSString stringWithFormat:@"%@ min", self.cocktail.prepTime];
    expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.origin.y = thirdRowDetails + 20 + headingPrepTimeHeight;
    label.frame = newFrame;
    
    // difficulty image
    imageView = (UIImageView *) [self.view viewWithTag:18];
    if([self.cocktail.difficulty isEqual: @"beginner"]){
        imageView.image = [UIImage imageNamed:@"leicht.png"];
    } else if([self.cocktail.difficulty isEqual: @"advanced"]){
        imageView.image = [UIImage imageNamed:@"mittel.png"];
    } else if([self.cocktail.difficulty isEqual: @"profi"]){
        imageView.image = [UIImage imageNamed:@"professional.png"];
    }
    // setup scroll view container
    if(UIInterfaceOrientationIsLandscape(deviceOrientation)){
        ((UIScrollView *)self.view).contentSize = CGSizeMake(460, yPosition + 20);
    } else {
        ((UIScrollView *)self.view).contentSize = CGSizeMake(320, yPosition + 20);
    }
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
