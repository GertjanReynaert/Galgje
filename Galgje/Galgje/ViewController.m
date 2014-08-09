//
//  ViewController.m
//  Galgje
//
//  Created by student on 17/10/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "ViewController.h"
#import "MyPickerViewDataSource.h"
#import "GalgjeEngine.h"

@interface ViewController (){
    NSString *_letter;
    GalgjeEngine *_engine;
    }

@end

@implementation ViewController 

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood.png"]];
    MyPickerViewDataSource *mpvDelegate = (MyPickerViewDataSource *) self.pvChooseChar.delegate;
    mpvDelegate.myResponsibleViewController = self;
    
    _engine = [[GalgjeEngine alloc]init];
    [self updateImage];
    [_engine startSpelMetWoord:@"galgje"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPlay:(id)sender {
    
    BOOL fail = [_engine speelMetLetter:_letter];
    BOOL finish = [_engine didGameFinishWithSuccess];
    [self updateImage];
    [self updateTextView];
    for(NSNumber *nr in [_engine indexForLetter:_letter])
    {
    [self updatePickerViewByIndex:[nr intValue] letter:_letter];
    }
    if(fail){
        UIAlertView *uav = [[UIAlertView alloc]
                            initWithTitle:@"O-ow"
                            message:@"U hebt verloren!"
                            delegate: nil
                            cancelButtonTitle:@"Ok"
                            otherButtonTitles: nil];
        [uav show];
    }
    if(finish)
    {
        UIAlertView *uav = [[UIAlertView alloc]
                            initWithTitle:@"Proficiat"
                            message:@"U hebt gewonnen!"
                            delegate: nil
                            cancelButtonTitle:@"Ok"
                            otherButtonTitles: nil];
        [uav show];
    }
}

- (IBAction)btnStart:(id)sender {
    
    UIAlertView *startDialog;
    startDialog = [[UIAlertView alloc]initWithTitle:@"Geef het te raden woord hier op:"
                                            message:@"Een woord van 6 letters"
                                           delegate:self
                                  cancelButtonTitle:@"Annuleer"
                                  otherButtonTitles:@"Ok", nil];
    startDialog.alertViewStyle=UIAlertViewStylePlainTextInput;
    [startDialog show];
    [self resetAllPickers];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)btnIndex
{
    if(btnIndex != 0)
    {
        NSString *woord = [alertView textFieldAtIndex:0].text;
        if(woord.length <= 6)
        {
            [_engine startSpelMetWoord:woord];
            [self updateImage];
            self.txtvTrial.text = nil;
        }
        else
        {
            UIAlertView *uav = [[UIAlertView alloc]
                                initWithTitle:@"Bericht"
                                message:@"U gaf een te lang woord in!"
                                delegate: nil
                                cancelButtonTitle:@"Ok"
                                otherButtonTitles: nil];
            [uav show];
        }
    }
}
- (void) updateScreen:(NSString*)text
{
    _letter = text;
}
-(void) updateImage
{
    self.imgGalg.image = _engine.galgjeImage;
}
-(void) updateTextView{
    NSString *stringToAppend = [@"\n" stringByAppendingString:_engine.letterString];
    self.txtvTrial.text = [stringToAppend stringByAppendingString:self.txtvTrial.text];
}
-(void)updatePickerViewByIndex:(int)index letter: (NSString*) letter
{
    // andere oplossing (mooier) is om de pickerviews dynamisch op te vragen, zoals de imageviews bij de vorige oefening
    switch (index) {
        case 0:
            [self.pvFirstChar selectRow:[(MyPickerViewDataSource*)self.pvFirstChar.dataSource indexOfElement:letter] inComponent:0 animated:true];
            break;
        case 1:
            [self.pvSecondChar selectRow:[(MyPickerViewDataSource*)self.pvFirstChar.dataSource indexOfElement:letter] inComponent:0 animated:true];
            break;
        case 2:
            [self.pvThirdChar selectRow:[(MyPickerViewDataSource*)self.pvFirstChar.dataSource indexOfElement:letter] inComponent:0 animated:true];
            break;
        case 3:
            [self.pvFourthChar selectRow:[(MyPickerViewDataSource*)self.pvFirstChar.dataSource indexOfElement:letter] inComponent:0 animated:true];
            break;
        case 4:
            [self.pvFifthChar selectRow:[(MyPickerViewDataSource*)self.pvFirstChar.dataSource indexOfElement:letter] inComponent:0 animated:true];
            break;
        case 5:
            [self.pvSixthChar selectRow:[(MyPickerViewDataSource*)self.pvFirstChar.dataSource indexOfElement:letter] inComponent:0 animated:true];
            break;
        default:
            break;
    }
}
-(void)resetAllPickers
{
    [self.pvFirstChar selectRow:0 inComponent:0 animated:true];
    [self.pvSecondChar selectRow:0 inComponent:0 animated:true];
    [self.pvThirdChar selectRow:0 inComponent:0 animated:true];
    [self.pvFourthChar selectRow:0 inComponent:0 animated:true];
    [self.pvFifthChar selectRow:0 inComponent:0 animated:true];
    [self.pvSixthChar selectRow:0 inComponent:0 animated:true];
    [self.pvChooseChar selectRow:0 inComponent:0 animated:true];
}
@end
