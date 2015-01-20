//
//  main.m
//  ObjC-ArraySorting
//
//  Created by Renato Camilio on 1/20/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSComparisonResult (^alphabeticalComparator)(id, id) = ^(id obj1, id obj2) {
            static NSStringCompareOptions comparisonOptions = (NSCaseInsensitiveSearch | NSNumericSearch);
            return [(NSString *)obj1 compare:(NSString *)obj2 options:comparisonOptions];
        };
        
        NSComparisonResult (^stringLengthComparator)(id, id) = ^(id obj1, id obj2) {
            if ([obj1 length] > [obj2 length]) {
                return NSOrderedAscending;
            } else if ([obj1 length] < [obj2 length]) {
                return NSOrderedDescending;
            }
            
            return NSOrderedSame;
        };
        
        NSComparisonResult (^alphabeticalByLastCharacterComparator)(id, id) = ^(id obj1, id obj2) {
            if ([obj1 characterAtIndex:[obj1 length] - 1] < [obj2 characterAtIndex:[obj2 length] - 1]) {
                return NSOrderedAscending;
            } else if ([obj1 characterAtIndex:[obj1 length] - 1] > [obj2 characterAtIndex:[obj2 length] - 1]) {
                return NSOrderedDescending;
            }
            
            return NSOrderedSame;
        };
        
        NSComparisonResult (^ocurrencesOfELetterComparator)(id, id) = ^(id obj1, id obj2) {
            NSArray *obj1OcurrenciesOfELetter = [obj1 componentsSeparatedByString:@"e"];
            NSArray *obj2OcurrenciesOfELetter = [obj2 componentsSeparatedByString:@"e"];
            
            if ([obj1OcurrenciesOfELetter count] > [obj2OcurrenciesOfELetter count]) {
                return NSOrderedAscending;
            } else if ([obj1OcurrenciesOfELetter count] < [obj2OcurrenciesOfELetter count]) {
                return NSOrderedDescending;
            }
            
            return NSOrderedSame;
        };
        
        NSArray *myArray = @[@"eeeeeAAbfdf",
                             @"Everything",
                             @"news to me",
                             @"timepiece",
                             @"egg",
                             @"eggs",
                             @"paper",
                             @"e",
                             @"facebook",
                             @"painting",
                             @"231 thurlow st",
                             @"99 bottles"];
        
        // Messy array
        NSLog(@"%@", myArray);
        

        //1 - Alphabetical
        //A block that sorts alphabetically and not caring about case, with numbers coming before letters
        NSLog(@"%@", [myArray sortedArrayUsingComparator:alphabeticalComparator]);

        //2 - Length
        //A block that sorts by length of the string with the longest first.
        NSLog(@"%@", [myArray sortedArrayUsingComparator:stringLengthComparator]);
        
        //3 - Alphabetical by Last Character
        //A block that sorts alphabetically (again, not caring about case) by the last character of the string.
        NSLog(@"%@", [myArray sortedArrayUsingComparator:alphabeticalByLastCharacterComparator]);
        
        //4 - Occurrences of 'e'
        //A block that will sort by the number of times the letter 'e' appears in the string, with the most matched strings coming first.
        NSLog(@"%@", [myArray sortedArrayUsingComparator:ocurrencesOfELetterComparator]);
    }
    return 0;
}
