//
//  NSString+KSRegex.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-12.
//
//

#import <Foundation/Foundation.h>

/**
 A category for doing basic regex operations on a string.
 */
@interface NSString (KSRegex)

/**
 Replace a specified regex pattern with a replacement.
 @param pattern a regex.
 @param replacement a replacement.
 @return the resulting string from the replacement.
 */
- (NSString *)ks_replace:(NSString *)pattern with:(NSString *)replacement;

/**
 Match a regex against a string.
 @param pattern a regex.
 @return a boolean indicating a match.
 */
- (BOOL)ks_matches:(NSString *)pattern;

@end
