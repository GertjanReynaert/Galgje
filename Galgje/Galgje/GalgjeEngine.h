//
//  GalgjeEngine.h
//  Galgje
//
//  Created by student on 24/10/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GalgjeEngine : NSObject

- (void) startSpelMetWoord: (NSString*) woord;
- (BOOL) speelMetLetter: (NSString*) letter;
- (BOOL) didGameFinishWithSuccess;
-(NSArray*)indexForLetter:(NSString*)letter;
@property (readonly) int numberOfWrongAttemps;
@property (readonly) UIImage* galgjeImage;
@property (readonly) NSString* letterString;
@property (readonly) NSArray* letterArray;


@end
