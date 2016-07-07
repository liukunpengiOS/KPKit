
#import "KPHTTPClient.h"
#import <YYCache.h>
#import "NSJSONSerialization+LYJSON.h"

static NSString * const LYHTTPClientURLString = @"http://10.1.1.110:8088/ChaosApp/api/";
NSString * const LYHTTPClientRequestCache = @"LYHTTPClientRequestCache";
static NSTimeInterval const LYHTTPClientTimeoutInterval = 30;

typedef NS_ENUM(NSUInteger, LYHTTPClientRequestType) {
    
    LYHTTPClientRequestTypeGET = 0,
    LYHTTPClientRequestTypePOST,
};

@implementation KPHTTPClient

#pragma mark - Public
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    return [self requestMethod:LYHTTPClientRequestTypeGET urlString:URLString parameters:parameters timeoutInterval:LYHTTPClientTimeoutInterval cachePolicy:LYHTTPClientReturnCacheDataThenLoad success:success failure:failure];
}

+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
              timeoutInterval:(NSTimeInterval)timeoutInterval
                  cachePolicy:(LYHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    return [self requestMethod:LYHTTPClientRequestTypeGET urlString:URLString parameters:parameters timeoutInterval:timeoutInterval cachePolicy:cachePolicy success:success failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    return [self requestMethod:LYHTTPClientRequestTypePOST urlString:URLString parameters:parameters timeoutInterval:LYHTTPClientTimeoutInterval cachePolicy:LYHTTPClientReturnCacheDataThenLoad success:success failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                   parameters:(id)parameters
              timeoutInterval:(NSTimeInterval)timeoutInterval
                  cachePolicy:(LYHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    return [self requestMethod:LYHTTPClientRequestTypePOST urlString:URLString parameters:parameters timeoutInterval:timeoutInterval cachePolicy:cachePolicy success:success failure:failure];
}

#pragma mark - Private
+ (NSURLSessionDataTask *)requestMethod:(LYHTTPClientRequestType)type
                              urlString:(NSString *)URLString
                             parameters:(id)parameters
                        timeoutInterval:(NSTimeInterval)timeoutInterval
                            cachePolicy:(LYHTTPClientRequestCachePolicy)cachePolicy
                                success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    URLString = URLString.length?URLString:@"";
    NSString *cacheKey = URLString;
    if (parameters) {
        if (![NSJSONSerialization isValidJSONObject:parameters]) return nil;//参数不是json类型
        NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
        NSString *paramStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        cacheKey = [cacheKey stringByAppendingString:paramStr];
    }
    
    YYCache *cache = [[YYCache alloc] initWithName:LYHTTPClientRequestCache];
    cache.memoryCache.shouldRemoveAllObjectsOnMemoryWarning = YES;
    cache.memoryCache.shouldRemoveAllObjectsWhenEnteringBackground = YES;
    
    id object = [cache objectForKey:cacheKey];
    
    switch (cachePolicy) {
            
        case LYHTTPClientReturnCacheDataThenLoad: {
            if (object) {
                
                success(nil,object);
            }
            break;
        }
        case LYHTTPClientReloadIgnoringLocalCacheData: {
            break;
        }
        case LYHTTPClientReturnCacheDataElseLoad: {
            if (object) {
                success(nil,object);
                return nil;
            }
            break;
        }
        case LYHTTPClientReturnCacheDataDontLoad: {
            if (object) {
                success(nil,object);
            }
            return nil;
        }
        default: {
            break;
        }
    }
    return [self requestMethod:type urlString:URLString parameters:parameters timeoutInterval:timeoutInterval cache:cache cacheKey:cacheKey success:success failure:failure];
}

+ (NSURLSessionDataTask *)requestMethod:(LYHTTPClientRequestType)type
                              urlString:(NSString *)URLString
                             parameters:(id)parameters
                        timeoutInterval:(NSTimeInterval)timeoutInterval
                                  cache:(YYCache *)cache
                               cacheKey:(NSString *)cacheKey
                                success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
     KPHTTPClient *manager = [KPHTTPClient sharedClient];
     [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html",nil]];
     [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
     manager.requestSerializer.timeoutInterval = timeoutInterval;
     [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    switch (type) {
        case LYHTTPClientRequestTypeGET:{
            
            return [manager GET:URLString parameters:parameters
                       progress:nil
                        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                            
                            if ([responseObject isKindOfClass:[NSData class]]) {
                                responseObject = [NSJSONSerialization objectWithJSONData:responseObject];
                            }
                            [cache setObject:responseObject forKey:cacheKey];//YYCache 已经做了responseObject为空处理
                            success(task,responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                failure(task, error);
            }];
            break;
        }
        case LYHTTPClientRequestTypePOST:{
            
            return [manager POST:URLString
                      parameters:parameters
                        progress:nil
                         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                             
                             if ([responseObject isKindOfClass:[NSData class]]) {
                                 responseObject = [NSJSONSerialization objectWithJSONData:responseObject];
                             }
                             [cache setObject:responseObject forKey:cacheKey];//YYCache 已经做了responseObject为空处理
                             success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                failure(task, error);
            }];
        }
        default:
            break;
    }
    
}

/**
 *  上传单个文件
 *
 *  @param URLString  上传服务端地址
 *  @param filePath   上传文件的本地路径
 *  @param parameters 上传参数
 *
 *  @return NSURLSessionUploadTask
 */

+ (NSURLSessionUploadTask *)upload:(NSString *)URLString filePath:(NSString *)filePath parameters:(id)parameters{
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    NSURLSessionUploadTask *uploadTask = [[KPHTTPClient client] uploadTaskWithRequest:request fromFile:fileUrl progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Success: %@ %@", response, responseObject);
        }
    }];
    [uploadTask resume];
    return uploadTask;
}

+ (instancetype)sharedClient{
    static KPHTTPClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [KPHTTPClient client];
    });
    return sharedClient;
}

+ (instancetype)client{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
   return [[KPHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:LYHTTPClientURLString] sessionConfiguration:configuration];
    
}
@end
