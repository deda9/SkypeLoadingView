import UIKit

class ShapeView: UIView {
    
    private var shape: Shape!
    
    init(_ shape: Shape) {
        super.init(frame: .zero)
        self.shape = shape
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        self.frame.size = self.shape.size
        self.layer.cornerRadius = self.shape.cornerRadius
        self.backgroundColor = self.shape.fillColor
        self.layer.borderWidth = self.shape.strokeWidth
        self.layer.borderColor = self.shape.strokeColor.cgColor
    }
}
