//
//  KSModel.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <Foundation/Foundation.h>

#import "KSArchivable.h"
#import "KSParsable.h"

@interface KSModel : NSObject <KSArchivable, KSParsable>

- (id)get:(NSString *)attribute;
- (void)set:(NSString *)attribute value:(NSString *)value;

@end
