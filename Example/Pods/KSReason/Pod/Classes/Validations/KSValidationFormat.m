//
//  KSValidationFormat.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "KSValidationFormat.h"
#import "KSValidator.h"
#import "KSValidate.h"

@implementation KSValidationFormat

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Overrides

- (void)validate:(id)attribute callback:(void (^)(NSString *))callback
{
    NSString *with = self.options[KSValidate.with];
    NSAssert(with, @"'%@' requires '%@'", KSValidate.format, KSValidate.with);
    
    if (![KSValidator format:attribute with:with])
    {
        callback(self.options[KSValidate.message] ?:
                 [NSString stringWithFormat:NSLocalizedString(@"is invalid", NULL)]);
    }
}

@end
