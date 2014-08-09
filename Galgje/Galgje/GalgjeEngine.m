//
//  GalgjeEngine.m
//  Galgje
//
//  Created by student on 24/10/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "GalgjeEngine.h"

@interface GalgjeEngine(){
    
    NSArray *_imgArray;
}

@property (nonatomic) NSArray* letterArray;
@property (nonatomic) int numberOfWrongAttemps;
@property (nonatomic) UIImage* galgjeImage;
@property (nonatomic) NSString* letterString;
@end

@implementation GalgjeEngine
-(id)init
{
    self = [super init];
    if(self)
    {
        _imgArray = @[
                      [UIImage imageNamed:@"galgje1.png"],
                      [UIImage imageNamed:@"galgje2.png"],
                      [UIImage imageNamed:@"galgje3.png"],
                      [UIImage imageNamed:@"galgje4.png"],
                      [UIImage imageNamed:@"galgje5.png"],
                      [UIImage imageNamed:@"galgje6.png"],
                      [UIImage imageNamed:@"galgje7.png"],
                      [UIImage imageNamed:@"galgje8.png"],
                      [UIImage imageNamed:@"galgje9.png"],
                      [UIImage imageNamed:@"galgje10.png"],
                      [UIImage imageNamed:@"galgje11.png"]
                      ];
        [self startSpelMetWoord:@"galgje"]; //default game
    }
    return self;
}
- (void) startSpelMetWoord: (NSString*) woord
{
    
    //eerst alles in lowercase zetten!
    if([woord length]<=6)
    {
        NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[woord length]];
        for (int i=0; i < [woord length]; i++) {
            NSString *ichar  = [NSString stringWithFormat:@"%c", [woord characterAtIndex:i]];
            [characters addObject:ichar];
        }
        _letterArray = characters;
    }
    
    self.numberOfWrongAttemps = 0;
    [self updateImage];
    [self initLetterString];
}
- (BOOL) speelMetLetter: (NSString*) letter
{
        BOOL test = [self.letterArray containsObject:letter];
        if(!test)
        {
            self.numberOfWrongAttemps++;
            [self updateImage];
            if(self.numberOfWrongAttemps == _imgArray.count-1)
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
        else
        {
            [self createLetterString:letter];
            return NO;
        }
}

-(BOOL) didGameFinishWithSuccess
{
    if([self.letterString rangeOfString:@"_"].location == NSNotFound)
    {
        //no underscores left
        if(self.numberOfWrongAttemps < _imgArray.count-1)
        {
            return YES;
        }
        else return NO;
    }
    else return NO;
}
-(NSArray*)indexForLetter:(NSString *)letter
{
    NSMutableArray *allIndexes = [[NSMutableArray alloc]init];
    for(int i=0;i<_letterArray.count;i++)
    {
        if([_letterArray[i] isEqualToString:letter])
        {
            [allIndexes addObject:[NSNumber numberWithInt:i]];
        }
    }
    return allIndexes;
}
-(void)updateImage
{
    self.galgjeImage = [_imgArray objectAtIndex:self.numberOfWrongAttemps];
}
-(void)createLetterString:(NSString*)editedLetter
{
    for (int i = 0;i<self.letterArray.count;i++)
    {
     if([self.letterArray[i] isEqualToString:editedLetter])
     {
         NSRange range = NSMakeRange(i,1);
         self.letterString = [self.letterString stringByReplacingCharactersInRange:range withString:editedLetter];
     }
    }
}
-(void)initLetterString
{
    self.letterString = @"";
    for(int i=0;i<self.letterArray.count;i++)
    {
        self.letterString = [self.letterString stringByAppendingString:@"_"];
    }
}
@end


