//
//  CBNetworkHelper.m
//  CodeBase
//
//  Created by leeqb on 11/6/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBNetworkHelper.h"

@implementation CBNetworkHelper

+ (CBNetworkHelper *)shareInstance
{
    static CBNetworkHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [CBNetworkHelper new];
    });
    return instance;
}

+ (NSString *)getUrl:(NSString *)name
{
    return @"";
}

+ (NSString *)getModuleUrl:(NSString *)module name:(NSString *)name
{
    return @"";
}

- (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failed:(void (^)(AFHTTPRequestOperation *, NSError *))failed finally:(void (^)())finally
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        success(operation, responseObject);
        finally();
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        failed(operation, error);
        finally();
    }];
}

- (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failed:(void (^)(AFHTTPRequestOperation *, NSError *))failed finally:(void (^)())finally
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        success(operation, responseObject);
        finally();
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        failed(operation, error);
        finally();
    }];
}

@end
