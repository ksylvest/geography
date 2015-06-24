//
//  KSValidationAbsence.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "KSValidationAbsence.h"
#import "KSValidator.h"
#import "KSValidate.h"

@implementation KSValidationAbsence

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Overrides

- (void)validate:(id)attribute callback:(void (^)(NSString *))callback
{
    if (![KSValidator absence:attribute])
    {
        callback(self.options[KSValidate.message] ?:
                 NSLocalizedString(@"can't be present", NULL));
    }
}

@end
