//
//  LayoutIndividualAdditions.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/07/11.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, renamed: "LayoutEditor.AdditionalFloatEvaluation")
	public typealias AdditionalFloatEvaluation = LayoutEditor.AdditionalFloatEvaluation
	
	@available(*, introduced: 2.0, deprecated: 2.1, renamed: "LayoutEditor.AdditionalPointEvaluation")
	public typealias AdditionalPointEvaluation = LayoutEditor.AdditionalPointEvaluation
	
	@available(*, introduced: 2.0, deprecated: 2.1, renamed: "LayoutEditor.AdditionalSizeEvaluation")
	public typealias AdditionalSizeEvaluation = LayoutEditor.AdditionalSizeEvaluation
	
	@available(*, introduced: 2.0, deprecated: 2.1, renamed: "LayoutEditor.AdditionalProcess")
	public typealias AdditionalProcess = LayoutEditor.AdditionalProcess
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public var resettingAdditionalEvaluations: Layout {
		return self.editing { $0.resettingAdditionalEvaluations }
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingLeft(to left: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.movingLeft(to: left) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingLeft(to left: CGFloat) -> Layout {
		
		return self.editing { $0.movingLeft(to: left) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingCenter(to center: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.movingCenter(to: center) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingCenter(to center: CGFloat) -> Layout {
		
		return self.editing { $0.movingCenter(to: center) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingRight(to right: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.movingRight(to: right) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingRight(to right: CGFloat) -> Layout {
		
		return self.editing { $0.movingRight(to: right) }
		
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingTop(to top: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.movingTop(to: top) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingTop(to top: CGFloat) -> Layout {
		
		return self.editing { $0.movingTop(to: top) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingMiddle(to middle: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.movingMiddle(to: middle) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingMiddle(to middle: CGFloat) -> Layout {
		
		return self.editing { $0.movingMiddle(to: middle) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingBottom(to bottom: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.movingBottom(to: bottom) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingBottom(to bottom: CGFloat) -> Layout {
		
		return self.editing { $0.movingBottom(to: bottom) }
		
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingX(by offset: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.movingX(by: offset) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingX(by offset: CGFloat) -> Layout {
		
		return self.editing { $0.movingX(by: offset) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingY(by offset: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.movingY(by: offset) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingY(by offset: CGFloat) -> Layout {
		
		return self.editing { $0.movingY(by: offset) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingOrigin(by offset: @escaping AdditionalPointEvaluation) -> Layout {
		
		return self.editing { $0.movingOrigin(by: offset) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func movingOrigin(by offset: CGPoint) -> Layout {
		
		return self.editing { $0.movingOrigin(by: offset) }
		
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingLeft(to left: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.pinchingLeft(to: left) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingLeft(to left: CGFloat) -> Layout {
		
		return self.editing { $0.pinchingLeft(to: left) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingLeft(by left: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.pinchingLeft(by: left) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingLeft(by left: CGFloat) -> Layout {
		
		return self.editing { $0.pinchingLeft(by: left) }
		
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingRight(to right: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.pinchingRight(to: right) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingRight(to right: CGFloat) -> Layout {
		
		return self.editing { $0.pinchingRight(to: right) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingRight(by right: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.pinchingRight(by: right) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingRight(by right: CGFloat) -> Layout {
		
		return self.editing { $0.pinchingRight(by: right) }
		
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingTop(to top: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.pinchingTop(to: top) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingTop(to top: CGFloat) -> Layout {
		
		return self.editing { $0.pinchingTop(to: top) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingTop(by top: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.pinchingTop(by: top) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingTop(by top: CGFloat) -> Layout {
		
		return self.editing { $0.pinchingTop(by: top) }
		
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingBottom(to bottom: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.pinchingBottom(to: bottom) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingBottom(to bottom: CGFloat) -> Layout {
		
		return self.editing { $0.pinchingBottom(to: bottom) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingBottom(by bottom: @escaping AdditionalFloatEvaluation) -> Layout {
		
		return self.editing { $0.pinchingBottom(by: bottom) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func pinchingBottom(by bottom: CGFloat) -> Layout {
		
		return self.editing { $0.pinchingBottom(by: bottom) }
		
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingWidth(to width: @escaping AdditionalFloatEvaluation, from reference: CGRect.HorizontalBaseLine) -> Layout {
		
		return self.editing { $0.expandingWidth(to: width, from: reference) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingWidth(to width: CGFloat, from reference: CGRect.HorizontalBaseLine) -> Layout {
		
		return self.editing { $0.expandingWidth(to: width, from: reference) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingWidth(by diff: @escaping AdditionalFloatEvaluation, from reference: CGRect.HorizontalBaseLine) -> Layout {
		
		return self.editing { $0.expandingWidth(by: diff, from: reference) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingWidth(by diff: CGFloat, from reference: CGRect.HorizontalBaseLine) -> Layout {
		
		return self.editing { $0.expandingWidth(by: diff, from: reference) }
		
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingHeight(to height: @escaping AdditionalFloatEvaluation, from reference: CGRect.VerticalBaseLine) -> Layout {
		
		return self.editing { $0.expandingHeight(to: height, from: reference) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingHeight(to height: CGFloat, from reference: CGRect.VerticalBaseLine) -> Layout {
		
		return self.editing { $0.expandingHeight(to: height, from: reference) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingHeight(by diff: @escaping AdditionalFloatEvaluation, from reference: CGRect.VerticalBaseLine) -> Layout {
		
		return self.editing { $0.expandingHeight(by: diff, from: reference) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingHeight(by diff: CGFloat, from reference: CGRect.VerticalBaseLine) -> Layout {
		
		return self.editing { $0.expandingHeight(by: diff, from: reference) }
		
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingSize(to size: @escaping AdditionalSizeEvaluation, from reference: CGRect.PlaneBasePoint) -> Layout {
		
		return self.editing { $0.expandingSize(to: size, from: reference) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingSize(to size: CGSize, from reference: CGRect.PlaneBasePoint) -> Layout {
		
		return self.editing { $0.expandingSize(to: size, from: reference) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingSize(by diff: @escaping AdditionalSizeEvaluation, from reference: CGRect.PlaneBasePoint) -> Layout {
		
		return self.editing { $0.expandingSize(by: diff, from: reference) }
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func expandingSize(by diff: CGSize, from reference: CGRect.PlaneBasePoint) -> Layout {
		
		return self.editing { $0.expandingSize(by: diff, from: reference) }
		
	}
	
}

extension Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, message: "Chaining methods in Layout are moved into LayoutEditor. Please use Layout.editing method to use these chaining methods.")
	public func addingProcess(by process: @escaping AdditionalProcess) -> Layout {
		
		return self.editing { $0.addingProcess(by: process) }
		
	}
	
}
