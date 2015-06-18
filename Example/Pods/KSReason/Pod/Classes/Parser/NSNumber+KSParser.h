//
//  NSNumber+KSParser.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-08.
//
//

#import <Foundation/Foundation.h>

@interface NSNumber (KSParser)

+ (NSNumber *)KS_parse:(id)object;

+ (NSInteger)KS_integer:(id)object;
+ (BOOL)KS_bool:(id)object;

+ (float)KS_float:(id)object;
+ (double)KS_double:(id)object;
+ (long)KS_long:(id)object;

@end
