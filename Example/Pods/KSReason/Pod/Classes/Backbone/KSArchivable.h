//
//  KSArchivable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <Foundation/Foundation.h>

/**
 Archivable is a protocol that exposes `archive:` and `unarchive:`. The protocol leaves the storage to the implementor.
 */
@protocol KSArchivable <NSObject>

/**
 Archive an object to a key.
 @param key A key to unarchive from.
 @return An instance of the archivable.
 */
- (void)archive:(NSString *)key;

/**
 Unarchiving an object from a key.
 @param key A key to unarchive from.
 @return An instance of the archivable.
 */
+ (instancetype)unarchive:(NSString *)key;

@end
