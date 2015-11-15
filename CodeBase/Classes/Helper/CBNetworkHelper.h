//
//  CBNetworkHelper.h
//  CodeBase
//
//  Created by leeqb on 11/6/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "AFNetworking.h"

typedef NSDictionary*(^BeforeRequestBlock)(NSDictionary*);
typedef NSDictionary*(^AfterRequestBlock)(NSDictionary*);

@interface CBNetworkHelper : NSObject

@property (nonatomic, strong) BeforeRequestBlock beforeBlock;
@property (nonatomic, strong) AfterRequestBlock afterBlock;

+ (CBNetworkHelper *)shareInstance;
+ (NSString *)getUrl:(NSString *)name;
+ (NSString *)getModuleUrl:(NSString *)module name:(NSString *)name;

// 发起get请求
- (void)get:(NSString *)url parameters:(NSDictionary *)parameters
    success:(void(^)(AFHTTPRequestOperation *operation, id responseObject))success
     failed:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failed
    finally:(void(^)())finally;

// 发起post请求
- (void)post:(NSString *)url parameters:(NSDictionary *)parameters
    success:(void(^)(AFHTTPRequestOperation *operation, id responseObject))success
     failed:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failed
    finally:(void(^)())finally;

- (void)postWithBody:(NSString *)url body:(id)bdoy success:(void (^)(AFHTTPRequestOperation *, id))success failed:(void (^)(AFHTTPRequestOperation *, NSError *))failed finally:(void (^)())finally;

@end
