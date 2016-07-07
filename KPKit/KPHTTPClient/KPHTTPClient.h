
#import "AFNetworking.h"

typedef NS_ENUM(NSUInteger, LYHTTPClientRequestCachePolicy){

    /**
     *  有缓存就先返回缓存，同步请求数据
     */
    LYHTTPClientReturnCacheDataThenLoad = 0,
    
    /**
     *  忽略缓存，重新请求
     */
    LYHTTPClientReloadIgnoringLocalCacheData,
    
    /**
     *  有缓存就用缓存，没有缓存就重新请求(用于数据不变时)
     */
    LYHTTPClientReturnCacheDataElseLoad,
    
    /**
     *  有缓存就用缓存，没有缓存就不发请求，当做请求出错处理（用于离线模式）
     */
    LYHTTPClientReturnCacheDataDontLoad,
};

/**
 *  缓存的名称
 */
extern  NSString * const LYHTTPClientRequestCache;

@interface KPHTTPClient : AFHTTPSessionManager

/**
 *  GET
 *  默认返回缓存,同步请求数据.超时30s。
 *  @param URLString  链接地址
 *  @param parameters 所需参数，可以为空
 *  @param success    成功回调
 *  @param failure    失败回调
 *
 *  @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  GET
 *  可以自由设置超时时间，缓存方式
 *  @param URLString       链接地址
 *  @param parameters      所需参数，可以为空
 *  @param timeoutInterval 超时时间
 *  @param cachePolicy     缓存方式
 *  @param success         成功回调
 *  @param failure         失败回调
 *
 *  @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
              timeoutInterval:(NSTimeInterval)timeoutInterval
                  cachePolicy:(LYHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  POST
 *  默认返回缓存,同步请求数据.超时30s。
 *  @param URLString  链接地址
 *  @param parameters 所需参数，可以为空
 *  @param success    成功回调
 *  @param failure    失败回调
 *
 *  @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  POST
 *  可以自由设置超时时间，缓存方式
 *  @param URLString       链接地址
 *  @param parameters      所需参数，可以为空
 *  @param timeoutInterval 超时时间
 *  @param cachePolicy     缓存方式
 *  @param success         成功回调
 *  @param failure         失败回调
 *
 *  @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
               timeoutInterval:(NSTimeInterval)timeoutInterval
                   cachePolicy:(LYHTTPClientRequestCachePolicy)cachePolicy
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
