import Foundation

@objc public class SwiftClass: NSObject {
    @objc public func callObjcMethod() {
        let objcInstance = ObjcClass()
        objcInstance.objcMethod()
    }
}
