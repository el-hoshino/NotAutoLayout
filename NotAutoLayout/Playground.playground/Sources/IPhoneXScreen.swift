import UIKit

public final class IPhoneXScreen: UIView {
	
	private let notch = Notch()
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
		self.initialize()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.initialize()
	}
	
	public convenience init() {
		self.init(frame: .zero)
	}
	
}

extension IPhoneXScreen {
	
	public override func sizeThatFits(_ size: CGSize) -> CGSize {
		return CGSize(width: 375, height: 812)
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		
		self.nal.layout(self.notch) { $0
			.pinTopCenter(to: self, s: .topCenter)
			.fitSize()
		}
	}
	
	public override func addSubview(_ view: UIView) {
		super.addSubview(view)
		assertNotch(with: view)
		super.addSubview(self.notch)
	}
	
	public override func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView) {
		super.insertSubview(view, aboveSubview: siblingSubview)
		assertNotch(with: view)
		super.addSubview(self.notch)
	}
	
	public override func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView) {
		super.insertSubview(view, belowSubview: siblingSubview)
		assertNotch(with: view)
		super.addSubview(self.notch)
	}
	
	public override func insertSubview(_ view: UIView, at index: Int) {
		super.insertSubview(view, at: index)
		assertNotch(with: view)
		super.addSubview(self.notch)
	}
	
}

extension IPhoneXScreen {
	
	private func assertNotch(with view: UIView) {
		assert((view == self.notch) == false)
	}
	
	private func setupVisual() {
		
		self.backgroundColor = .white
		self.contentScaleFactor = 3
		
		self.layer.cornerRadius = 40
		self.clipsToBounds = true
		
	}
	
	private func setupNotch() {
		
		self.notch.sizeToFit()
		self.addSubview(self.notch)
		
	}
	
	private func initialize() {
		
		self.setupVisual()
		self.setupNotch()
		
	}
	
}

private final class Notch: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.initialize()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.initialize()
	}
	
	convenience init() {
		self.init(frame: .zero)
	}
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		self.drawNotch(topRadius: 6, bottomRadius: 20)
	}
	
	override func sizeThatFits(_ size: CGSize) -> CGSize {
		return CGSize(width: 215, height: 30)
	}
	
	private func initialize() {
		
		self.backgroundColor = .clear
		
	}
	
	private func drawNotch(topRadius: CGFloat, bottomRadius: CGFloat) {
		
		let leftTopArcCenter = CGPoint(x: 0, y: topRadius)
		let rightTopArcCenter = CGPoint(x: self.bounds.width, y: leftTopArcCenter.y)
		let leftBottomArcCenter = CGPoint(x: topRadius + bottomRadius, y: self.bounds.height - bottomRadius)
		let rightBottomArcCenter = CGPoint(x: self.bounds.width - leftBottomArcCenter.x, y: leftBottomArcCenter.y)
		
		let leftBottomArcLeftPoint = CGPoint(x: topRadius, y: leftBottomArcCenter.y)
		let rightBottomArcBottomPoint = CGPoint(x: self.bounds.width - topRadius - bottomRadius, y: self.bounds.height)
		let rightTopArcLeftPoint = CGPoint(x: self.bounds.width - topRadius, y: topRadius)
		
		let path = UIBezierPath()
		path.addArc(withCenter: leftTopArcCenter, radius: topRadius, startAngle: .pi * 0.5, endAngle: 0, clockwise: true)
		path.addLine(to: leftBottomArcLeftPoint)
		path.addArc(withCenter: leftBottomArcCenter, radius: bottomRadius, startAngle: .pi, endAngle: .pi * 0.5, clockwise: false)
		path.addLine(to: rightBottomArcBottomPoint)
		path.addArc(withCenter: rightBottomArcCenter, radius: bottomRadius, startAngle: .pi * 0.5, endAngle: 0, clockwise: false)
		path.addLine(to: rightTopArcLeftPoint)
		path.addArc(withCenter: rightTopArcCenter, radius: topRadius, startAngle: .pi, endAngle: .pi * 1.5, clockwise: true)
		path.addLine(to: .zero)
		
		let fillColor = UIColor.black
		fillColor.setFill()
		
		path.close()
		path.fill()
		
	}
	
}
