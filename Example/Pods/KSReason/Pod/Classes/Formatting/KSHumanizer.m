//
//  KSHumanizer.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import <KSReason/KSEnumerable.h>

#import "KSHumanizer.h"

@implementation KSHumanizer

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

+ (NSString *)sentence:(NSArray *)collection
{
    NSInteger trailer = collection.count;
    trailer--;

    return [collection ks_reducei:^id(NSString *memo, NSString *object, NSUInteger index) {
        if (!memo) return object;
        NSString *separator = (index != trailer) ? @", " : @" and ";
        return [NSString stringWithFormat:@"%@%@%@", memo, separator, object];
    } memo:NULL];
}

@end
