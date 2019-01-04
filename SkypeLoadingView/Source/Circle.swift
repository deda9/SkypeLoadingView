import UIKit

struct Circle: Shape {
    var fillColor: UIColor
    var strokeColor: UIColor
    var strokeWidth: CGFloat
    var cornerRadius: CGFloat
    var size: CGSize
    
    init(size: CGSize, cornerRadius: CGFloat, fillColor: UIColor, strokeColor: UIColor, strokeWidth: CGFloat) {
        self.size = size
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
        self.cornerRadius = cornerRadius
    }
}

extension Circle {
    static var `default`: Circle {
        return Circle(size: CGSize(width: 30.0, height: 30.0),
                      cornerRadius: 15.0,
                      fillColor: UIColor.white,
                      strokeColor: UIColor.white,
                      strokeWidth: 8.0)
    }
}
