//
//  CGTypeConvertible.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

/// A protocol that shows the type defiend is able to convert from/to a specific CGXxx type.
///
/// You can call `.cgValue` to get the CGXxx type value of CGTypeConvertible type value, or call `.init(CGType)` to get CGTypeConvertible type value from CGXxx type value.
///
/// Types defined in NotAutoLayout those conform `CGTypeConvertible` are:
/// - `Float` (`NotAutoLayout.Float`, not `Swift.Float`) <-> `CGFloat`
/// - `Point` <-> `CGPoint`
/// - `Size` <-> `CGSize`
/// - `Rect` <-> `CGRect`
/// - `Insets` <-> `UIEdgeInsets`
public protocol CGTypeConvertible {
	
	/// Associated CGXxx type of the `CGTypeConvertible` type.
	///
	/// e.g.: `CGRect` is the `CGType` of `Rect`.
	associatedtype CGType
	
	/// Get the `CGType` type value of current `CGTypeConvertible` type value.
	///
	/// e.g.: `let rect = Rect(x: 0, y: 0, width: 100, height: 100); let cgRect = rect.cgValue` will get `CGRect(x:0, y:0, width: 100, height: 100)`
	var cgValue: CGType { get }
	
	/// Make the `CGTypeConvertible` type value from the specific `CGType` value.
	///
	/// e.g.: `let cgRect = CGRect(x: 0, y: 0, width: 100, height: 100); let rect = Rect(rect)` will get `Rect(x: 0, y: 0, width: 100, height: 100)`
	init(_ cgValue: CGType)
	
}
