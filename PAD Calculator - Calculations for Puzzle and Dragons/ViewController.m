//
//  ViewController.m
//  PAD Calculator - Calculations for Puzzle and Dragons
//
//  Created by Wayne Chi on 4/25/14.
//  Copyright (c) 2014 Wayne Chi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize dungeonPicker;
@synthesize dungeonArray;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    //Setting the PickerView
    //Setting up all the dungeons
    UIImage *image = [UIImage imageNamed:@"Tamadra.png"];
    [self.sRankImage setImage:image];
    self.dungeonArray = [[NSArray alloc] initWithObjects:@"Angelic Dragon of Light", @"Angels Invade",@"Armor-Breaking Sword",@"Blackgate Prison",@"Buddha Statue Descended", @"Dark Green Desert Isle",@"Dream Labyrinth",@"Epic Battles",@"Isle of Underworld",@"Red Backwater",@"Shining Island",@"Shore Maiden",@"Supreme Jewel", nil];
    //Setting up the Dungeon turn counts
    self.dungeonTurn = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:7],[NSNumber numberWithInt:5],[NSNumber numberWithInt:7],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:7],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:5],[NSNumber numberWithInt:5], nil];
    
    //Setting up the Dungeon Score values
    self.dungeonScore = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:200000],[NSNumber numberWithInt:140000],[NSNumber numberWithInt:200000],[NSNumber numberWithInt:80000],[NSNumber numberWithInt:180000],[NSNumber numberWithInt:170000],[NSNumber numberWithInt:150000],[NSNumber numberWithInt:80000],[NSNumber numberWithInt:200000],[NSNumber numberWithInt:100000],[NSNumber numberWithInt:200000],[NSNumber numberWithInt:200000],[NSNumber numberWithInt:200000], nil];
    
    
    //self.dungeonArray = [[NSArray alloc] initWithObjects:@"blue", nil];
    [self.dungeonPicker setDelegate:self];
    [self.dungeonPicker setDataSource:self];
    [self.dungeonPicker reloadAllComponents];

    
    //setting all of the sliders.
    self.turnCountSlider.maximumValue = 26; //This will be changed per dungeon
    self.turnCountSlider.minimumValue = 5; //This will be changed per dungeon
    self.teamCostSlider.maximumValue = 48; //changed per dungeon
    self.teamCostSlider.minimumValue = 6; //changed per dungeon
    self.averageComboSlider.maximumValue = 11;
    self.averageComboSlider.minimumValue = 0;
    self.turnCountSlider.value = (self.turnCountSlider.maximumValue + self.turnCountSlider.minimumValue)/2;
    self.teamCostSlider.value = (self.teamCostSlider.maximumValue + self.teamCostSlider.minimumValue)/2;
    self.averageComboSlider.value = (self.averageComboSlider.maximumValue + self.averageComboSlider.minimumValue)/2;
    
    //setting all of the Labels
    
    self.turnCount.text = [NSString stringWithFormat:@"%0.0f", roundf(self.turnCountSlider.value)];
    self.teamCost.text = [NSString stringWithFormat:@"%0.0f", roundf(self.teamCostSlider.value)];
    self.averageCombo.text = [NSString stringWithFormat:@"%0.1f", self.averageComboSlider.value];
    
    comboScoreValue = 20*pow(roundf(self.averageComboSlider.value),4);
    teamScoreValue = 75.83*pow(10-(roundf(self.teamCostSlider.value)/6),4);
    turnScoreValue = 40000-((roundf(self.turnCountSlider.value*10)/10-self.turnCountSlider.minimumValue)*2500);
    
    totalScoreValue = comboScoreValue + teamScoreValue + turnScoreValue;
    
    //setting the total score
    self.score.text = [NSString stringWithFormat:@"%0.0f", totalScoreValue];
    
    //aligning my Labels.
    self.turnCount.textAlignment = NSTextAlignmentRight;
    self.teamCost.textAlignment = NSTextAlignmentRight;
    self.averageCombo.textAlignment = NSTextAlignmentRight;
    NSLog(@"%@",[self.dungeonArray objectAtIndex:0]);
    //linebreak
 //   self.score.lineBreakMode = UILineBreakModeClip;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)turnCountDidChange:(id)sender {
    self.turnCount.text = [NSString stringWithFormat:@"%0.0f", self.turnCountSlider.value];
    turnScoreValue = 40000-((roundf(self.turnCountSlider.value)-minimumTurn)*2500);
    if(turnScoreValue <= 0)
    {
        turnScoreValue = 0;
    }
    if(turnScoreValue >= 40000)
    {
        turnScoreValue = 40000;
    }
    totalScoreValue = comboScoreValue + teamScoreValue + turnScoreValue;
    self.score.text = [NSString stringWithFormat:@"%0.0f", totalScoreValue];
    if(totalScoreValue >= sRankValue)
    {
        NSLog(@"S-Rank Achieved");
    }
    if(totalScoreValue <= sRankValue)
    {
        NSLog(@"Failed To Achieve S-Rank");
    }
}

- (IBAction)teamCostDidChange:(id)sender {
    self.teamCost.text = [NSString stringWithFormat:@"%0.0f", self.teamCostSlider.value];
    teamScoreValue = 75.83*pow(10-(roundf(self.teamCostSlider.value)/6),4);
    totalScoreValue = comboScoreValue + teamScoreValue + turnScoreValue;
    self.score.text = [NSString stringWithFormat:@"%0.0f", totalScoreValue];
    if(totalScoreValue >= sRankValue)
    {
        NSLog(@"S-Rank Achieved");
    }
    if(totalScoreValue <= sRankValue)
    {
        NSLog(@"Failed To Achieve S-Rank");
    }
}

- (IBAction)averageComboDidChange:(id)sender {
    self.averageCombo.text = [NSString stringWithFormat:@"%0.1f", self.averageComboSlider.value];
    comboScoreValue = 20*pow(roundf(self.averageComboSlider.value*10)/10,4);
    totalScoreValue = comboScoreValue + teamScoreValue + turnScoreValue;
    self.score.text = [NSString stringWithFormat:@"%0.0f", totalScoreValue];
    if(totalScoreValue >= sRankValue)
    {
        NSLog(@"S-Rank Achieved");
    }
    if(totalScoreValue <= sRankValue)
    {
        NSLog(@"Failed To Achieve S-Rank");
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.dungeonArray count];
}

//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component;

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [self.dungeonArray objectAtIndex:row];
}

//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0); // attributed title is favored if both methods are implemented
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Selected Row %d", row);
    sRankValue = [[self.dungeonScore objectAtIndex:row] intValue];
    minimumTurn = [[self.dungeonTurn objectAtIndex:row] intValue];
    if(self.turnCountSlider.value <= minimumTurn)
    {
        self.turnCountSlider.value = minimumTurn;
    }
    self.turnCount.text = [NSString stringWithFormat:@"%0.0f", self.turnCountSlider.value];
    turnScoreValue = 40000-((roundf(self.turnCountSlider.value)-minimumTurn)*2500);
    if(turnScoreValue <= 0)
    {
        turnScoreValue = 0;
    }
    if(turnScoreValue >= 40000)
    {
        turnScoreValue = 40000;
    }
    totalScoreValue = comboScoreValue + teamScoreValue + turnScoreValue;
    self.score.text = [NSString stringWithFormat:@"%0.0f", totalScoreValue];
    
    if(totalScoreValue >= sRankValue)
    {
        NSLog(@"S-Rank Achieved");
    }
    if(totalScoreValue <= sRankValue)
    {
        NSLog(@"Failed To Achieve S-Rank");
    }
    NSLog(@"Dungeon is: %@", [self.dungeonArray objectAtIndex:row]);
   // NSLog(@"%d", sRankValue);
   // NSLog(@"%d", minimumTurn);
}



@end
