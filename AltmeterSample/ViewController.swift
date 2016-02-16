//
//  ViewController.swift
//  AltimeterSample
//
//  Created by KawaiTakeshi on 2016/02/16.
//  Copyright © 2016年 Takeshi Kawai. All rights reserved.
//

import UIKit
import CoreMotion
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var pressureLabel: UILabel!
    
    let altimeter = CMAltimeter()
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.startAltimeter(altimeter)
        bind()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func bind() {
        viewModel.pressureValue.asObservable()
        .subscribeNext { pressureValue -> Void in
           print("pressureValue:\(pressureValue)")
           self.pressureLabel.text = "\(pressureValue)"
        }.addDisposableTo(disposeBag)
    }
}

