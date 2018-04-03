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
			.setTopCenter(by: { $0.topCenter })
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
		super.addSubview(self.notch)
		
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
		self.drawNotch(in: rect, topRadius: 6, bottomRadius: 20)
	}
	
	override func sizeThatFits(_ size: CGSize) -> CGSize {
		return CGSize(width: 215, height: 30)
	}
	
	private func initialize() {
		
		self.backgroundColor = .clear
		
	}
	
	private func drawNotch(in rect: CGRect, topRadius: CGFloat, bottomRadius: CGFloat) {
		
		let topArcCenterXMargin: CGFloat = 0
		let topArcCenterY = rect.minY + topRadius
		let bottomArcCenterXMargin = topRadius + bottomRadius
		let bottomArcCenterY = rect.maxY - bottomRadius
		
		let leftTopArcCenter = CGPoint(x: rect.minX + topArcCenterXMargin, y: topArcCenterY)
		let rightTopArcCenter = CGPoint(x: rect.maxX - topArcCenterXMargin, y: topArcCenterY)
		let leftBottomArcCenter = CGPoint(x: rect.minX + bottomArcCenterXMargin, y: bottomArcCenterY)
		let rightBottomArcCenter = CGPoint(x: rect.maxX - bottomArcCenterXMargin, y: bottomArcCenterY)
		
		let leftBottomArcLeftPoint = CGPoint(x: leftBottomArcCenter.x - bottomRadius, y: leftBottomArcCenter.y)
		let rightBottomArcBottomPoint = CGPoint(x: rightBottomArcCenter.x, y: rightBottomArcCenter.y + bottomRadius)
		let rightTopArcLeftPoint = CGPoint(x: rightTopArcCenter.x - topRadius, y: rightTopArcCenter.y)
		
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
