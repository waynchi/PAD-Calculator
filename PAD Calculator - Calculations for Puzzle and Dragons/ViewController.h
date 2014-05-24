//
//  ViewController.h
//  PAD Calculator - Calculations for Puzzle and Dragons
//
//  Created by Wayne Chi on 4/25/14.
//  Copyright (c) 2014 Wayne Chi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>
{
    float totalScoreValue;
    float comboScoreValue;
    float turnScoreValue;
    float teamScoreValue;
    
}

@property (strong, nonatomic) IBOutlet UIPickerView *dungeonPicker;
@property (strong, nonatomic)          NSArray *dungeonArray;

@property (strong, nonatomic) IBOutlet UILabel *turnCount;
@property (strong, nonatomic) IBOutlet UILabel *teamCost;
@property (strong, nonatomic) IBOutlet UILabel *averageCombo;
@property (strong, nonatomic) IBOutlet UISlider *turnCountSlider;
@property (strong, nonatomic) IBOutlet UISlider *teamCostSlider;
@property (strong, nonatomic) IBOutlet UISlider *averageComboSlider;
@property (strong, nonatomic) IBOutlet UILabel *score;


@end
