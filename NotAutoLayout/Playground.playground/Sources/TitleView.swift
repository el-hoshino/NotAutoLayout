import Foundation
import NotAutoLayout

public class TitleView: LayoutView {
	
	public let titleLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		return label
	}()
	
	override public init(frame: CGRect) {
		
		super.init(frame: frame)
		
		self.addSubview(self.titleLabel, layoutMethods: self.makeTitleLabelLayoutMethods())
		
	}
	
	convenience public init() {
		self.init(frame: .zero)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func makeTitleLabelLayoutMethods() -> [LayoutMethod] {
		
		let layout = Layout.makeCustom { (boundSize) -> CGRect in
			let reference = ReferencePoint.middleCenter
			let origin = CGPoint.zero
			let size = CGSize(width: 200, height: 40)
			return CGRect(reference: reference, origin: origin, size: size)
		}
		
		let method = LayoutMethod(constantLayout: layout)
		return [method]
		
	}
	
}

extension TitleView {
	
	public func setTitle(_ title: String) {
		self.titleLabel.text = title
	}
	
}
