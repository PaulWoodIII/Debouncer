/*: 
 
 #Debounce

 * Basically used here to prevent a user from spamming a button
 * Execution is made a short delay AFTER the user's last input
 * Throttle Might be preferable
 
*/

import Foundation
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

class Debouncer: NSObject {
    var callback: (() -> ())
    var delay: Double
    weak var timer: Timer?
    
    init(delay: Double, callback: @escaping (() -> ())) {
        self.delay = delay
        self.callback = callback
    }
    
    func call() {
        timer?.invalidate()
        let nextTimer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(Debouncer.fireNow), userInfo: nil, repeats: false)
        timer = nextTimer
    }
    
    func fireNow() {
        self.callback()
    }
}

let debouncedFunction = Debouncer(delay: 0.40) {
    print("delayed printing")
}

debouncedFunction.call()
debouncedFunction.call()
debouncedFunction.call()
debouncedFunction.call()
debouncedFunction.call()