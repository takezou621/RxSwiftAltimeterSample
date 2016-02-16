//
//  ViewModel.swift
//  AltimeterSample
//
//  Created by KawaiTakeshi on 2016/02/16.
//  Copyright © 2016年 Takeshi Kawai. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import CoreMotion

class ViewModel: NSObject {
    let disposeBag = DisposeBag()
    
    var pressureValue = Variable<Double>(0)
    
    func startAltimeter(altimeter:CMAltimeter) {
      //  CMAltimeter.rx_response(altimeter)
        CMAltimeter.rx_response(altimeter)
        .asObservable()
        .subscribeNext { data in
            print(data.pressure)
            self.pressureValue.value = Double(data.pressure.doubleValue)
        }.addDisposableTo(disposeBag)
    }
}
