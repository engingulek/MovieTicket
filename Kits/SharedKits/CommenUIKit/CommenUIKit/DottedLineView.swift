import UIKit

public class DottedLineView: UIView {
    public override func draw(_ rect: CGRect) {
        super.draw(rect)

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [20, 4]

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: rect.size.height / 2))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height / 2))

        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
    }
}
