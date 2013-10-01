//
//  CocoaMite.m
//
//  Created by Heiko Dreyer on 09/30/13.
//  Copyright (c) 2013 boxedfolder.com. All rights reserved.
//

#import "CocoaMite.h"

#define DEFAULT_AGENT_NAME @"CocoaMite"

@interface CocoaMite ()

-(void)_callMethod: (NSString *)method
          withPath: (NSString *)path
        parameters: (NSDictionary *)parameters
              data: (NSDictionary *)data
          callback: (void (^)(NSError *error, NSDictionary *result))callback;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation CocoaMite
{
    NSOperationQueue *_queue;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Setup

-(id)initWithApiKey: (NSString *)apiKey subdomain: (NSString *)subdomain
{
    if(self = [super init])
    {
        _apiKey = apiKey;
        _subdomain = subdomain;
    }
    
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(id)initWithUsername: (NSString *)username password: (NSString *)password subdomain: (NSString *)subdomain
{
    if(self = [super init])
    {
        _username = username;
        _password = password;
        _subdomain = subdomain;
    }
    
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Retrieve

-(void)currentAccountWithCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)currentUserWithCallback: (void (^)(NSError *error, NSDictionary *result))callback;
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)customers: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)projects: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)services: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)timeEntries: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)timeEntryBookmarks: (NSDictionary *)parameters withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)currentTrackerWithCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Create

-(void)addCustomer: (NSDictionary *)data withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addProject: (NSDictionary *)data withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addService: (NSDictionary *)data withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)addTimeEntry: (NSDictionary *)data withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)startTrackerOnEntry: (NSInteger)timeEntryId withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Update

-(void)updateCustomer: (NSInteger)customerId withData: (NSDictionary *)data callback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)updateProject: (NSInteger)projectId withData: (NSDictionary *)data callback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)updateService: (NSInteger)serviceId withData: (NSDictionary *)data callback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)updateTimeEntry: (NSInteger)timeEntryId withData: (NSDictionary *)data callback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Destroy

-(void)removeCustomer: (NSInteger)customerId withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)removeProject: (NSInteger)projectId withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)removeService: (NSInteger)serviceId withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)removeTimeEntry: (NSInteger)timeEntryId withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)stopTracker: (NSInteger)trackerId withCallback: (void (^)(NSError *error, NSDictionary *result))callback
{
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Private

-(void)_callMethod: (NSString *)method
          withPath: (NSString *)path
        parameters: (NSDictionary *)parameters
              data: (NSDictionary *)data
          callback: (void (^)(NSError *error, NSDictionary *result))callback
{
    NSURL *url = nil;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url
                                                           cachePolicy: NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval: 60.0];
    
    NSString *string = @"";
    NSData *requestData = [NSData dataWithBytes: [string UTF8String] length: [string length]];
    
    [request setHTTPMethod: method];
    [request setValue: @"application/json" forHTTPHeaderField: @"Accept"];
    [request setValue: @"application/json" forHTTPHeaderField: @"Content-Type"];
    [request setValue: [NSString stringWithFormat: @"%d", [requestData length]] forHTTPHeaderField: @"Content-Length"];
    [request setHTTPBody: requestData];
    
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [self _operationQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                               NSDictionary *result = nil;
                               callback(error, result);
    }];

}

///////////////////////////////////////////////////////////////////////////////////////////////////

-(NSOperationQueue *)_operationQueue
{
    if(!_queue)
        _queue = [[NSOperationQueue alloc] init], _queue.maxConcurrentOperationCount = 1;
    
    return _queue;
}

@end
