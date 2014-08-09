//
//  MyPickervViewDataSource.h
//  Galgje
//
//  Created by student on 24/10/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyPickerViewProtocol.h"

@interface MyPickerViewDataSource : NSObject <UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic)id <MyPickerViewProtocol> myResponsibleViewController;
-(int)indexOfElement:(NSString*)element;

@end
