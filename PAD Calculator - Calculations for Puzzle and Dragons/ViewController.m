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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

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
    
    self.turnCount.text = [NSString stringWithFormat:@"%0.0f", self.turnCountSlider.value];
    self.teamCost.text = [NSString stringWithFormat:@"%0.0f", self.teamCostSlider.value];
    self.averageCombo.text = [NSString stringWithFormat:@"%0.1f", self.averageComboSlider.value];
    
    comboScoreValue = 20*pow(self.averageComboSlider.value,4);
    teamScoreValue = 75.83*pow(10-(self.teamCostSlider.value/6),4);
    turnScoreValue = 40000-((self.turnCountSlider.value-self.turnCountSlider.minimumValue)*2500);
    
    totalScoreValue = comboScoreValue + teamScoreValue + turnScoreValue;
    
    //setting the total score
    self.score.text = [NSString stringWithFormat:@"%0.0f", totalScoreValue];
    
    //aligning my Labels.
    self.turnCount.textAlignment = NSTextAlignmentRight;
    self.teamCost.textAlignment = NSTextAlignmentRight;
    self.averageCombo.textAlignment = NSTextAlignmentRight;
    
    //linebreak
    self.score.lineBreakMode = UILineBreakModeClip;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)turnCountDidChange:(id)sender {
    self.turnCount.text = [NSString stringWithFormat:@"%0.0f", self.turnCountSlider.value];
    turnScoreValue = 40000-((self.turnCountSlider.value-self.turnCountSlider.minimumValue)*2500);
    totalScoreValue = comboScoreValue + teamScoreValue + turnScoreValue;
    self.score.text = [NSString stringWithFormat:@"%0.0f", totalScoreValue];

    
}
- (IBAction)teamCostDidChange:(id)sender {
    self.teamCost.text = [NSString stringWithFormat:@"%0.0f", self.teamCostSlider.value];
    teamScoreValue = 75.83*pow(10-(self.teamCostSlider.value/6),4);
    totalScoreValue = comboScoreValue + teamScoreValue + turnScoreValue;
    self.score.text = [NSString stringWithFormat:@"%0.0f", totalScoreValue];

}
- (IBAction)averageComboDidChange:(id)sender {
    self.averageCombo.text = [NSString stringWithFormat:@"%0.1f", self.averageComboSlider.value];
    comboScoreValue = 20*pow(self.averageComboSlider.value,4);
    totalScoreValue = comboScoreValue + teamScoreValue + turnScoreValue;
    self.score.text = [NSString stringWithFormat:@"%0.0f", totalScoreValue];

}



@end
