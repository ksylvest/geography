//
//  NSNumber+KSParser.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-08.
//
//

#import <Foundation/Foundation.h>

@interface NSNumber (KSParser)

+ (NSNumber *)ks_parse:(id)object;

+ (NSInteger)ks_integer:(id)object;
+ (BOOL)ks_bool:(id)object;

+ (float)ks_float:(id)object;
+ (double)ks_double:(id)object;
+ (long)ks_long:(id)object;

@end
