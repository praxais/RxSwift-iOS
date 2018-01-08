//
//  ViewController.swift
//  RxSwift-iOS
//
//  Created by Prajwal Maharjan on 1/4/18.
//  Copyright © 2018 Prajwal Maharjan. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        //Simple button click
//        myObservable(myValue: "My Value").subscribe(onNext: { (value) in
//            print("Xais -> \(value)")
//        }, onError: { (error) in
//            print("XaisError -> \(error.localizedDescription)")
//        }, onCompleted: {
//            print("XaisCompleted")
//        }) .disposed(by: disposeBag)
        
        //Using flatMap
        getToken().flatMap { (token) in
            self.getProfile(token: token)
            }.subscribe(onNext: { (profileString) in
                print("Xais -> \(profileString)")
            }, onError: { (error) in
                print("XaisError -> \(error.localizedDescription)")
            }, onCompleted: {
                print("XaisCompleted")
            }).disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func myObservable(myValue: String) -> Observable<String> {
        return Observable.create({ observable in
            if true {
                observable.onNext(myValue)
            } else {
                observable.onError(NSError(domain: "Prajwal", code: 1, userInfo: nil))
            }
            observable.onCompleted()
            return Disposables.create()
        })
    }
    
    private func getToken() -> Observable<String> {
        return Observable.create({ observable in
            observable.onNext("MyToken")
            observable.onCompleted()
            return Disposables.create()
        })
    }
    
    private func getProfile(token: String) -> Observable<String> {
        return Observable.create({ observable in
            observable.onNext(token)
            observable.onCompleted()
            return Disposables.create()
        })
    }
}
