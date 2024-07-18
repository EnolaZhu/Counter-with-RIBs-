//
//  Presentable.swift
//  Counter with RIBs
//
//  Created by enola.zhu on 2024/7/18.
//

import Foundation
import RIBs
import RxSwift

// part of the View layer
// 1. define what the View can do
// 2. what it needs to notify its listener about
protocol CounterPresentable: Presentable {
    var listener: CounterPresentableListener? { get set }
}



//  defines the actions that the View can trigger and the Interactor must implement
//  and handle events
// 本質上允許 view to communicate user interactions to the Interactor.
protocol CounterPresentableListener: AnyObject {
    // 當使用者在視圖中執行應增加計數器的操作時，將呼叫該函數。 Interactor 實作此方法來處理遞增計數器的 business logic
    func increaseCounter()

    // This function will be called when the user wants to close the counter view. The Interactor implements this method to handle the business logic for closing the view or any cleanup required.
    func closeCounter()
}
// 使用時機: user 通過 viewController 交互的時候，inform Interactor 這些操作






// Called when the counter process is finished and the parent RIB needs to handle the cleanup or transition.
// 當Interactor完成其任務或需要通知 parent RIB有關重要事件時，例如流程完成或需要處理的錯誤。

protocol CounterListener: AnyObject {
    func counterDidFinish()
}

