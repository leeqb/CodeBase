//
//  CBNetworkHelper.m
//  CodeBase
//
//  Created by leeqb on 11/6/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "CBNetworkHelper.h"
#import "CodeBase.h"

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
    NSDictionary *urls = [CodeBase shareInstance].appConfig[@"Urls"];
    NSString *serverUrl = urls[@"AppServerUrl"];
    return [NSString stringWithFormat:@"%@/%@", serverUrl, name];
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
    
    NSDictionary *finalParams = parameters;
    if(self.beforeBlock) {
        finalParams = self.beforeBlock(parameters);
    }
    
    [manager GET:url parameters:finalParams success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
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
    
    NSDictionary *finalParams = parameters;
    if(self.beforeBlock) {
        finalParams = self.beforeBlock(parameters);
    }
    
    [manager POST:url parameters:finalParams success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        success(operation, responseObject);
        finally();
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        failed(operation, error);
        finally();
    }];
}

@end
