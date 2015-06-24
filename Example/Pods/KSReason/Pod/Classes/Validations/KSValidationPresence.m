//
//  KSValidationPresence.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "KSValidationPresence.h"
#import "KSValidator.h"
#import "KSValidate.h"

@implementation KSValidationPresence

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Overrides

- (void)validate:(id)attribute callback:(void (^)(NSString *))callback
{
    if (![KSValidator presence:attribute])
    {
        callback(self.options[KSValidate.message] ?:
                 NSLocalizedString(@"can't be blank", NULL));
    }
}

@end
