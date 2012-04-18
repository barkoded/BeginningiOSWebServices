#import <Foundation/Foundation.h>

@interface UIApplication (BKDNetworkActivity)

@property (nonatomic, assign, readonly) NSUInteger bkd_networkActivityCount;

- (void)bkd_pushNetworkActivity;

- (void)bkd_popNetworkActivity;

- (void)bkd_resetNetworkActivity;

@end
