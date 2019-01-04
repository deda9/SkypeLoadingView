import UIKit

extension Int {
    var toDouble: Double {
        return Double(self)
    }
    
    var toCGFloat: CGFloat {
        return CGFloat(self)
    }
}

func Init<Type>(_ object: Type, block: (Type) -> ()) -> Type {
    block(object)
    return object
}
