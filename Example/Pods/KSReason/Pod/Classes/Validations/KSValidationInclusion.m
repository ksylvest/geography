//
//  KSValidationInclusion.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "KSValidationInclusion.h"
#import "KSValidator.h"
#import "KSValidate.h"

@implementation KSValidationInclusion

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Overrides

- (void)validate:(id)attribute callback:(void (^)(NSString *))callback
{
    id of = self.options[KSValidate.of];
    NSAssert(of, @"'%@' requires '%@'", KSValidate.inclusion, KSValidate.of);
    
    if (![KSValidator exclusion:attribute collection:of])
    {
        callback(self.options[KSValidate.message] ?:
                 [NSString stringWithFormat:NSLocalizedString(@"is invalid", NULL)]);
    }
}

@end
