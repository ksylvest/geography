//
//  KSCollection.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <Foundation/Foundation.h>

#import "KSArchivable.h"
#import "KSParsable.h"

@interface KSCollection : NSObject <KSArchivable, KSParsable, NSFastEnumeration>

- (Class)kind;
- (NSArray *)models;

- (BOOL)empty;
- (NSUInteger)count;

@end
