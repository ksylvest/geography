//
//  NSString+KSRegex.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-12.
//
//

#import "NSString+KSRegex.h"

@implementation NSString (KSRegex)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Main

- (NSString *)ks_replace:(NSString *)pattern with:(NSString *)replacement
{
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSRange range = NSMakeRange(0, self.length);
    
    return [regex stringByReplacingMatchesInString:self options:0 range:range withTemplate:replacement];
}

- (BOOL)ks_matches:(NSString *)pattern
{
    NSRange range = [self rangeOfString:pattern options:NSRegularExpressionSearch];
    
    return range.location != NSNotFound;
}

@end
