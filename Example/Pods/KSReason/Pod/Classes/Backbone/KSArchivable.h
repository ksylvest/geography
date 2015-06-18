//
//  KSArchivable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <Foundation/Foundation.h>

@protocol KSArchivable <NSObject>

- (void)archive:(NSString *)key;
+ (instancetype)unarchive:(NSString *)key;

@end
