//
//  KSValidationLength.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import <KSReason/KSParser.h>

#import "KSValidationLength.h"
#import "KSValidator.h"
#import "KSValidate.h"

@implementation KSValidationLength

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Accessors

- (NSNumber *)is
{
    return self.options[KSValidate.is];
}

- (NSNumber *)maximum
{
    return self.options[KSValidate.maximum];
}

- (NSNumber *)minimum
{
    return self.options[KSValidate.minimum];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Overrides

- (void)validate:(id)attribute callback:(void (^)(NSString *))callback
{
    NSAssert(self.is || self.minimum || self.maximum, @"'length' requires '%@' or '%@' or '%@'",
             KSValidate.is, KSValidate.minimum, KSValidate.maximum);
    NSAssert(!self.is || (self.is && !(self.maximum || self.minimum)), @"'length' cannot have '%@' or '%@' with '%@'",
             KSValidate.minimum, KSValidate.maximum, KSValidate.is);
    
    BOOL is = !self.is || [KSValidator length:attribute is:[NSNumber ks_integer:self.is]];
    BOOL minimum = !self.minimum || [KSValidator length:attribute minimum:[NSNumber ks_integer:self.minimum]];
    BOOL maximum = !self.maximum || [KSValidator length:attribute minimum:[NSNumber ks_integer:self.minimum]];
    
    if (!is)
    {
        callback(self.options[KSValidate.message] ?:
                 [NSString stringWithFormat:NSLocalizedString(@"must be exactly %@ characters", NULL),
                  self.is]);
    }
    else if (!(minimum && maximum))
    {
        callback(self.options[KSValidate.message] ?:
                 [NSString stringWithFormat:NSLocalizedString(@"must be between %@ and %@ characters", NULL),
                  self.minimum, self.maximum]);
    }
    else if (!minimum)
    {
        callback(self.options[KSValidate.message] ?:
                 [NSString stringWithFormat:NSLocalizedString(@"must be a minimum of %@ characters", NULL),
                  self.minimum]);
    }
    else if (!maximum)
    {
        callback(self.options[KSValidate.message] ?:
                 [NSString stringWithFormat:NSLocalizedString(@"must be a maximum of %@ characters", NULL),
                  self.minimum]);
    }
}

@end
