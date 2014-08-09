//
//  ViewController.h
//  Galgje
//
//  Created by student on 17/10/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPickerViewProtocol.h"

@interface ViewController : UIViewController <MyPickerViewProtocol>
@property (weak, nonatomic) IBOutlet UIPickerView *pvFirstChar;
@property (weak, nonatomic) IBOutlet UIPickerView *pvSecondChar;
@property (weak, nonatomic) IBOutlet UIPickerView *pvThirdChar;
@property (weak, nonatomic) IBOutlet UIPickerView *pvFourthChar;
@property (weak, nonatomic) IBOutlet UIPickerView *pvFifthChar;
@property (weak, nonatomic) IBOutlet UIPickerView *pvSixthChar;
@property (weak, nonatomic) IBOutlet UIImageView *imgGalg;
@property (weak, nonatomic) IBOutlet UITextView *txtvTrial;
@property (weak, nonatomic) IBOutlet UIPickerView *pvChooseChar;
- (IBAction)btnPlay:(id)sender;
- (IBAction)btnStart:(id)sender;

@end
