//
//  ObservableObjectWrapper.swift
//  gocery
//
//  Created by Rezamir Rahizar on 17/10/2025.
//

import Foundation
import RxSwift
import Combine

final class ObservableObjectWrapper<Element>: ObservableObject {
    @Published var value: Element
    private let disposeBag = DisposeBag()
    
    init(_ observable: Observable<Element>, initial: Element) {
        self.value = initial
        observable
            .observe(on: MainScheduler.instance)
            .subscribe(onNext:{ [weak self] val in
                self?.value = val
            })
            .disposed(by: disposeBag)
    }
}
