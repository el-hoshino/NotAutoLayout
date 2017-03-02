import Foundation
import NotAutoLayout

public class TabView: UIScrollView, LayoutControllable {
	
	public var layoutInfo: [LayoutControllable.Hash: [LayoutMethod]] = [:]
	public var zIndexInfo: [LayoutControllable.Hash: Int] = [:]
	
	fileprivate let tabItemSize = CGSize(width: 48, height: 48)
	fileprivate let tabItemHorizontalMargin: CGFloat = 16
	
	override public func layoutSubviews() {
		super.layoutSubviews()
		self.layoutControl()
	}
	
}

extension TabView {
	
	public func makeTabItemLayoutMethods(at index: Int) -> [LayoutMethod] {
		
		let position = LayoutPosition.customByFrame { [unowned self] (boundSize) -> CGRect in
			let index = CGFloat(index)
			let originX = (self.tabItemSize.width * index) + (self.tabItemHorizontalMargin * (index + 1))
			let originY = (boundSize.height - self.tabItemSize.height) / 2
			let origin = CGPoint(x: originX, y: originY)
			return CGRect(origin: origin, size: self.tabItemSize)
		}
		let method = LayoutMethod(constantPosition: position)
		
		return [method]
		
	}
	
}

extension TabView {
	
	public func updateContentSize() {
		
		let height = self.bounds.height
		let width = self.subviews.reduce(0) { (width, view) -> CGFloat in
			let viewRightPosition = view.frame.origin.x + view.frame.width
			return max(width, viewRightPosition)
		} + self.tabItemHorizontalMargin
		
		self.contentSize = CGSize(width: width, height: height)
		
	}
	
}
