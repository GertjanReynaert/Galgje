//
//  MyPickervViewDataSource.m
//  Galgje
//
//  Created by student on 24/10/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "MyPickerViewDataSource.h"
@interface MyPickerViewDataSource(){
    NSArray *_letterArray;
}
@end

@implementation MyPickerViewDataSource

-(id)init{
    self = [super init];
    if(self){
        _letterArray = @[@"-",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_letterArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_letterArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (self.myResponsibleViewController != nil){
        [self.myResponsibleViewController updateScreen:[self pickerView:pickerView titleForRow:row forComponent:component]];
        
    }
    
}

-(int)indexOfElement:(NSString *)element
{
    for(int i=0;i<_letterArray.count;i++)
    {
        if([_letterArray[i] isEqualToString:element])
        {
            return i;
        }
    }
    //default return;
    return -1;
}
@end
