
#import "H5WebViewController.h"


@class NBLoadRequestEvent;


@interface H5WebViewController ()

@end

@implementation H5WebViewController


+(NSString*)getNumberRandom:(int)count
{
    NSString *strRandom = @"";
    
    for(int i=0; i<count; i++)
    {
        strRandom = [ strRandom stringByAppendingFormat:@"%i",(arc4random() % 9)];
    }
    return strRandom;
}

//获取能量排行榜
+(void)getListRankingWithStartPoint:(int)startpoint
{
    
    APListData *jdata=[APListData sharedInstance];
    
    long timems=[[NSDate  date] timeIntervalSince1970]*1000;
    
    NSString *timeStamp = [NSString stringWithFormat:@"%ld", timems];
    
    NSString *randNum=[H5WebViewController getNumberRandom:16];
    
    NSString * pointStr = startpoint<=1?@"":[NSString stringWithFormat:@"%d",startpoint];
    
    NSString * arg0 = [NSString stringWithFormat:@"[{\"handlerName\":\"rpc\",\"data\":{\"operationType\":\"alipay.antmember.forest.h5.queryEnergyRanking\",\"requestData\":[{\"startPoint\":\"%@\",\"pageSize\":20,\"av\":\"5\",\"ct\":\"ios\"}],\"disableLimitView\":true},\"callbackId\":\"rpc_15368300951600.%@\"}]",pointStr,randNum];
    
    NSString *arg2=[NSString stringWithFormat:@"https://60000002.h5app.alipay.com/app/src/listRank.html"];
    
    PSDJsBridge *jsB=jdata.jsBridge;
    
    NSLog(@"jsb=(%@)",jsB);
    
    [jsB _doFlushMessageQueue:arg0 url:arg2];
    
    
}

//帮助他人收取能量
+(void)helpCollectBubbles:(id)mbrige bubbleId:(NSString*)bID userId :(NSString*)userID
{
    NSLog(@"help--(%@)--collect--(%@)",userID,bID);
    
    long timems=[[NSDate  date] timeIntervalSince1970]*1000;
    NSString *timeStamp = [NSString stringWithFormat:@"%ld", timems];
    NSString *randNum=[H5WebViewController getNumberRandom:16];
    
    
    NSString *arg1 = [NSString stringWithFormat:@"[{\"handlerName\":\"rpc\",\"data\":{\"operationType\":\"alipay.antmember.forest.h5.forFriendCollectEnergy\",\"requestData\":[{\"targetUserId\":%@,\"bubbleIds\":[%@],\"av\":\"5\",\"ct\":\"ios\"}],\"disableLimitView\":true},\"callbackId\":\"rpc_15371070827940.%@\"},{\"handlerName\":\"remoteLog\",\"data\":{\"seedId\":\"ANTFOREST-BEHAVIOR-CLICK-COLLECT\",\"param1\":\"shareBiz=none^bubbleId=%@^actionUserId=%@^type=behavior^currentTimestamp=%@\",\"param2\":\"monitor_type=clicked^remoteType=info^pageName=home.html^pageState=friend%@_enterhomeOff\",\"bizType\":\"antForest\"},\"callbackId\":\"remoteLog_15371070827960.%@\"}]",userID,bID,randNum,bID,userID,timeStamp,userID,randNum];
    
    
    NSString *arg2=[NSString stringWithFormat:@"https://60000002.h5app.alipay.com/app/src/home.html?userId=%@",userID];
    PSDJsBridge *jsB=mbrige;
    [jsB _doFlushMessageQueue:arg1 url:arg2];
    
}



+(void)collectBubbles:(id)mbrige bubbleId:(NSString*)bID userId :(NSString*)userID
{
    
    long timems=[[NSDate  date] timeIntervalSince1970]*1000;
    NSString *timeStamp = [NSString stringWithFormat:@"%ld", timems];
    NSString *randNum=[H5WebViewController getNumberRandom:16];
    NSString *arg1=[NSString stringWithFormat:@"[{\"handlerName\":\"remoteLog\",\"data\":{\"seedId\":\"ANTFOREST-BEHAVIOR-CLICK-COLLECT\",\"param1\":\"shareBiz=none^bubbleId=%@^actionUserId=%@^type=behavior^currentTimestamp=%@\",\"param2\":\"monitor_type=clicked^remoteType=info^pageName=home.html^pageState=friend%@_enterhomeOff\",\"bizType\":\"antForest\"},\"callbackId\":\"remoteLog_15105601282940.%@\"},{\"handlerName\":\"rpc\",\"data\":{\"operationType\":\"alipay.antmember.forest.h5.collectEnergy\",\"requestData\":[{\"userId\":%@,\"bubbleIds\":[%@],\"av\":\"5\",\"ct\":\"ios\"}],\"disableLimitView\":true},\"callbackId\":\"rpc_15105601282960.%@\"}] ",bID,userID,timeStamp,userID,randNum,userID,bID,randNum];
    NSString *arg2=[NSString stringWithFormat:@"https://60000002.h5app.alipay.com/app/src/home.html?userId=%@",userID];
    PSDJsBridge *jsB=mbrige;
    [jsB _doFlushMessageQueue:arg1 url:arg2];
    
}


+(void)getTopUserBubbles:(id)mbrige userId:(NSString*)userID
{
    
    
    long timems=[[NSDate  date] timeIntervalSince1970]*1000;
    NSString *timeStamp = [NSString stringWithFormat:@"%ld", timems];
    NSString *randNum=[H5WebViewController getNumberRandom:16];
    NSString *arg1=[NSString stringWithFormat:@"[{\"handlerName\":\"remoteLog\",\"data\":{\"seedId\":\"ANTFOREST-PAGE-READY-home\",\"param1\":\"shareBiz=none^type=behavior^currentTimestamp=1510628822616\",\"param2\":\"monitor_type=openPage^remoteType=info\",\"bizType\":\"antForest\"},\"callbackId\":\"remoteLog_15106288226220.36025243042968214\"},{\"handlerName\":\"getSystemInfo\",\"data\":{},\"callbackId\":\"getSystemInfo_15106288226230.7224089596420527\"},{\"handlerName\":\"hideOptionMenu\",\"data\":{},\"callbackId\":\"hideOptionMenu_15106288226230.7351219072006643\"},{\"handlerName\":\"setToolbarMenu\",\"data\":{\"menus\":[],\"override\":true},\"callbackId\":\"setToolbarMenu_15106288226230.6259752095211297\"},{\"handlerName\":\"setGestureBack\",\"data\":{\"val\":true},\"callbackId\":\"setGestureBack_15106288226230.2139696276281029\"},{\"handlerName\":\"remoteLog\",\"data\":{\"seedId\":\"ANTFOREST-H5_PAGE_SET_PAGE_NAME\",\"param1\":\"shareBiz=none^type=behavior^currentTimestamp=%@\",\"param2\":\"monitor_type=clicked^remoteType=info^pageName=home.html\",\"bizType\":\"antForest\"},\"callbackId\":\"remoteLog_15106288226260.2301180271897465\"},{\"handlerName\":\"addNotifyListener\",\"data\":{\"name\":\"NEBULANOTIFY_AFRefresh\"},\"callbackId\":\"addNotifyListener_15106288226260.7617499728221446\"},{\"handlerName\":\"rpc\",\"data\":{\"operationType\":\"alipay.antmember.forest.h5.queryNextAction\",\"requestData\":[{\"userId\":\"%@\",\"av\":\"5\",\"ct\":\"ios\"}],\"disableLimitView\":true},\"callbackId\":\"rpc_15106288226260.%@\"}]",timeStamp,userID,randNum];
    
    NSString *arg2=[NSString stringWithFormat:@"https://60000002.h5app.alipay.com/app/src/home.html?userId=%@",userID];
    PSDJsBridge *jsB=mbrige;
    //查询当前用户的能量
    [jsB _doFlushMessageQueue:arg1 url:arg2];
}


+(void)collectTopBub
{
    APListData *jdata=[APListData sharedInstance];
    
    NSMutableDictionary *copyDic=[jdata.topBubblesDic mutableCopy];
    
    NSLog(@"收集top10用户OK,开始一个个采集:%@",copyDic);
    
    
    for (id key in copyDic) {
        id obj = [copyDic objectForKey:key];
        
        NSLog(@"=========:%@=====:%@",key,obj);
        for(NSDictionary *eachbubble in obj){
            NSString *collectStatus=[eachbubble objectForKey:@"collectStatus"];
            int canHelpCollect = [eachbubble[@"canHelpCollect"] intValue];
            //可收集的 或 可帮助收取的
            if([collectStatus isEqualToString:@"AVAILABLE"])
            {
                NSString *bID=[eachbubble objectForKey:@"id"];
                NSString *uID=[eachbubble objectForKey:@"userId"];
                [H5WebViewController collectBubbles:jdata.jsBridge bubbleId:bID userId:uID];
                NSLog(@"我开始收能量了--:%@",bID);
                
            }
            else if(canHelpCollect==1)
            {

                NSString *bID=[eachbubble objectForKey:@"id"];
                NSString *uID=[eachbubble objectForKey:@"userId"];
                [H5WebViewController helpCollectBubbles:jdata.jsBridge bubbleId:bID userId:uID];
                NSLog(@"我开始帮他收能量了--:%@",bID);

            }
        }
    }
}

//浇水
+(void)waterTreeWithUserId:(NSString*)userID
{
    APListData *jdata=[APListData sharedInstance];

    //浇水三次
    for(int i=0; i<3; i++)
    {
        long timems=[[NSDate  date] timeIntervalSince1970]*1000;
        NSString *timeStamp = [NSString stringWithFormat:@"%ld", timems];
        NSString *randNum=[H5WebViewController getNumberRandom:16];
        
        NSString *arg1=[NSString stringWithFormat:@"[{\"handlerName\":\"remoteLog\",\"data\":{\"seedId\":\"ANTFOREST-BEHAVIOR-CLICK-WATER\",\"param1\":\"shareBiz=none^type=behavior^currentTimestamp=%@\",\"param2\":\"monitor_type=clicked^remoteType=info^pageName=home.html^pageState=friend%@_enterhomeOff\",\"bizType\":\"antForest\"},\"callbackId\":\"remoteLog_15386245793000.%@\"}]",timeStamp,userID,randNum];
        
        NSString *url_1=[NSString stringWithFormat:@"https://60000002.h5app.alipay.com/app/src/home.html?userId=%@",userID];
        
        PSDJsBridge *jsB=jdata.jsBridge;
        
        NSLog(@"waterTreeWithUserId---jsbB = (%@)",jsB);
        
        long timems2=[[NSDate  date] timeIntervalSince1970]*1000;
        NSString *timeStamp2 = [NSString stringWithFormat:@"%ld", timems2];
        NSString *randNum2 = [H5WebViewController getNumberRandom:16];
        //
        NSString *arg2=[NSString stringWithFormat:@"[{\"handlerName\":\"rpc\",\"data\":{\"operationType\":\"alipay.antmember.forest.h5.transferEnergy\",\"requestData\":[{\"targetUser\":\"%@\",\"transferType\":\"WATERING\",\"bizNo\":\"2b05624b-330d-47ac-a22c-0713a204567a-%@\",\"av\":\"5\",\"ct\":\"ios\"}],\"disableLimitView\":true},\"callbackId\":\"rpc_15386245793050.%@\"}]",userID,timeStamp2,randNum2];
        
        [jsB _doFlushMessageQueue:arg2 url:url_1];
        
        [NSThread sleepForTimeInterval:0.1];
        
        [jsB _doFlushMessageQueue:arg1 url:url_1];
        
        [NSThread sleepForTimeInterval:0.2];

    }
    
    
    
    
}


@end
