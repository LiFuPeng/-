//
//  ViewController.m
//  定位
//
//  Created by 蜗牛 on 2016/11/18.
//  Copyright © 2016年 关于蜗牛：一枚九零后码农  蜗牛-----QQ:3197857495-----李富棚  个人微信：woniu1308822159  微信公众号：woniuxueios  简书：蜗牛学IOS  地址：http://www.jianshu.com/users/a664a9fcb096/latest_articles  简书专题：蜗牛学IOS  地址：http://www.jianshu.com/collection/bfcf49bf5d27    GitHub:https://github.com/LiFuPeng       蜗牛. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>{
    
    CLLocationManager *locationManager;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([CLLocationManager locationServicesEnabled]) {
        
        NSLog(@"用户开了定位功能");
        
        
        locationManager=[[CLLocationManager alloc] init];
        locationManager.desiredAccuracy=10;
        [locationManager requestWhenInUseAuthorization];
        locationManager.delegate=self;
        [locationManager startUpdatingLocation];
        
    }else{
        
        NSLog(@"用户没有开定位功能");
    
    
    }
    
    
    
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    
    CLLocation *curLor=[locations firstObject];
    CLLocationCoordinate2D cooreinat=curLor.coordinate;
    
    NSLog(@"经度:%f,纬度:%f",cooreinat.longitude,cooreinat.latitude);
    
    
    [locationManager stopUpdatingLocation];
    CLGeocoder *geo=[[CLGeocoder alloc]init];
    [geo reverseGeocodeLocation:curLor completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        for (CLPlacemark *place in placemarks) {
            NSDictionary *location=[place addressDictionary];
            
//            NSLog(@"国家:%@",[location objectForKey:@"Country"]);
//            NSLog(@":%@",[location objectForKey:@"Country"]);
//            NSLog(@"国家:%@",[location objectForKey:@"Country"]);
            
            
            NSLog(@"国家:%@",location);
        }
        
        
        
    }];
    


}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
