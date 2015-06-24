//
//  KSHumanizer.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import <Foundation/Foundation.h>

@interface KSHumanizer : NSObject

/**
 Converts a collection into a sentence (i.e. `@[@"apple", @"lemon", @"peach"]` to `@"apple, lemon and peach"`).
 @param collection The collection to be converted.
 @return A converted collection.
 */
+ (NSString *)sentence:(NSArray *)collection;

@end
