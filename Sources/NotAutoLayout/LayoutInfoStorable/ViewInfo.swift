//
//  ViewInfo.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/02.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public struct ViewInfo<InfoType> {
	
	typealias InfoValue = [UIView.NAL.Hash: () -> InfoType]
	typealias ViewClosureInfoValue = [UIView: () -> InfoType]
	typealias HashInfoTypeInfoValue = [UIView.NAL.Hash: InfoType]
	typealias SimplifiedInfoValue = [UIView: InfoType]
	
	private var value: InfoValue
	
}

extension ViewInfo {
	
	subscript (_ viewHash: UIView.NAL.Hash) -> InfoType? {
		
		guard let result = self.value[viewHash] else {
			return nil
		}
		
		return result()
		
	}
	
	public subscript (_ view: UIView) -> InfoType? {
		
		return self[view.nal.hash]
		
	}
	
	subscript (_ viewHash: UIView.NAL.Hash, `default` defaultValue: InfoType) -> InfoType {
		
		return self[viewHash] ?? defaultValue
		
	}
	
	public subscript (_ view: UIView, `default` defaultValue: InfoType) -> InfoType {
		
		return self[view] ?? defaultValue
		
	}
	
}

extension ViewInfo {
	
	mutating func set(_ info: InfoType, for view: UIView) {
		
		self.value[view.nal.hash] = { info }
		
	}
	
	mutating func set(_ info: @escaping () -> InfoType, for view: UIView) {
		
		self.value[view.nal.hash] = info
		
	}
	
}

extension ViewInfo {
	
	func containsInfo(for view: UIView) -> Bool {
		
		return self.value.containsKey(view.nal.hash)
		
	}
	
}

extension ViewInfo: ExpressibleByDictionaryLiteral {
	
	public init(dictionaryLiteral elements: (UIView, InfoType)...) {
		
		self.value = [UIView.NAL.Hash: () -> InfoType].init(minimumCapacity: elements.count)
		
		for element in elements {
			self.value[element.0.nal.hash] = { element.1 }
		}
		
	}
	
}

public typealias LayoutInfo = ViewInfo<IndividualProperty.Layout>

public typealias OrderInfo = ViewInfo<Int>

public typealias ZIndexInfo = ViewInfo<Int>
