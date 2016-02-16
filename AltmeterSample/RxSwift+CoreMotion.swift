//
//  RxSwift+CoreMotion.swift
//  AltimeterSample
//
//  Created by KawaiTakeshi on 2016/02/16.
//  Copyright © 2016年 Takeshi Kawai. All rights reserved.
//

import Foundation
import CoreMotion
import RxSwift

extension CMAltimeter {
    public static func rx_response(altimeter:CMAltimeter) -> Observable<CMAltitudeData> {
        return Observable.create{ observer in
            altimeter.startRelativeAltitudeUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler:{ data , error in
                if (error == nil) {
                    print("success")
                    observer.onNext(data!)
                    //observer.onCompleted()
                }else{
                    observer.onError(error!)
                }
            })
            
            return AnonymousDisposable {
            }
        }
    }
}