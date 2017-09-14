import UIKit
import NotAutoLayout

/*
public class TabView: LayoutScrollView {
	
}

extension TabView {
	
	public func makeTabItemLayout() -> LayoutInfo {
		
		
		let layout = Layout
			.makeAbsolute(initialFrame: CGRect(origin: CGPoint(x: self.tabItemHorizontalMargin,
			                                                   y: self.tabItemHorizontalMargin),
			                                   size: self.tabItemSize),
			              margin: self.tabItemHorizontalMargin,
			              direction: .horizontal)
		
		let method = LayoutMethod(constantLayout: layout)
		
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
*/
