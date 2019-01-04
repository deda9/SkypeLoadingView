import UIKit

protocol Shape {
    var fillColor: UIColor { get }
    var strokeColor: UIColor { get }
    var strokeWidth: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var size: CGSize { get }
}
