import UIKit

class SkypeLoadingView: UIView {
    
    var duration: Double = 1.5
    private var shape: Shape!
    private var numOfShapes: Int = 4
    private var animationGroup: CAAnimationGroup!
    
    init(with shape: Shape) {
        let factor = numOfShapes.toCGFloat - 1
        let width = factor * shape.size.width
        let height = factor * shape.size.height
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        super.init(frame: frame)
        self.shape = shape
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    private func setupUI() {
        self.createShapes()
    }
    
    private func createShapes() {
        let x = self.bounds.size.width / 2
        let y = self.bounds.size.height / 2
        let size = self.frame.size
        
        for i in 0..<numOfShapes {
            let shapeView = ShapeView(shape)
            let rate = Float(i) / Float(numOfShapes)
            let animation = rotateAnimation(rate, x: x, y: y, size: size)
            shapeView.frame = CGRect(origin: .zero, size: self.shape.size)
            shapeView.layer.add(animation, forKey: "animation")
            self.addSubview(shapeView)
        }
    }
    
    private func rotateAnimation(_ rate: Float, x: CGFloat, y: CGFloat, size: CGSize) -> CAAnimationGroup {
        let fromScale = 0.9 - rate
        let toScale = 0.1 + rate
        let timeFunc = CAMediaTimingFunction(controlPoints: 0.5, 0.15 + rate, 0.25, 1)
        
        let scaleAnimation = Init(CABasicAnimation(keyPath: "transform.scale")) {
            $0.duration = duration
            $0.repeatCount = HUGE
            $0.fromValue = fromScale
            $0.toValue = toScale
        }
        
        let positionAnimation = Init(CAKeyframeAnimation(keyPath: "position")) {
            $0.duration = duration
            $0.repeatCount = HUGE
            $0.path = UIBezierPath(arcCenter: CGPoint(x: x, y: y),
                                   radius: size.width / 2,
                                   startAngle: 3 * CGFloat.pi * 0.5,
                                   endAngle: 3 * CGFloat.pi * 0.5 + 2 * CGFloat.pi,
                                   clockwise: true).cgPath
        }
        
        let animation = Init(CAAnimationGroup()) {
            $0.animations = [scaleAnimation, positionAnimation]
            $0.timingFunction = timeFunc
            $0.duration = duration
            $0.repeatCount = HUGE
            $0.isRemovedOnCompletion = false
        }
        
        return animation
    }
}

extension SkypeLoadingView {
    static var `default`: SkypeLoadingView {
        return SkypeLoadingView(with: Circle.default)
    }
}

