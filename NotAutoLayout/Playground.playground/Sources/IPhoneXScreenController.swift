import UIKit

public final class IPhoneXScreenController: UIViewController {
	
	public enum Rotation: Int {
		case left = -1
		case right = 1
		case around = 2
	}
	
	public enum Orientation: Int {
		case portrait = 0
		case portraitUpsideDown = 2
		case landscapeLeft = 3
		case landscapeRight = 1
		
		private static let count = 4
		
		fileprivate static func value(from rawValue: Int) -> Orientation {
			
			if let orientation = Orientation(rawValue: rawValue) {
				return orientation
				
			} else {
				var rawValue = rawValue
				while rawValue > Orientation.count {
					rawValue -= Orientation.count
				}
				while rawValue < 0 {
					rawValue += Orientation.count
				}
				return value(from: rawValue)
			}
			
		}
		
		var screenOrientation: IPhoneXScreen.Orientation {
			switch self {
			case .portrait:
				return .up
				
			case .portraitUpsideDown:
				return .down
				
			case .landscapeLeft:
				return .left
				
			case .landscapeRight:
				return .right
			}
		}
		
	}
	
	private(set) var orientation: Orientation = .portrait
	
	private lazy var iPhoneXScreen: IPhoneXScreen = {
		let screen = IPhoneXScreen()
		screen.sizeToFit()
		return screen
	}()
	
}

extension IPhoneXScreenController {
	
	public override func loadView() {
		self.view = self.iPhoneXScreen
	}
	
	public override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		self.updateLayoutMargins()
		self.updateSafeAreaInsets()
	}
	
}

extension IPhoneXScreenController {
	
	public func rotate(to orientation: Orientation) {
		
		self.orientation = orientation
		self.iPhoneXScreen.rotate(to: orientation.screenOrientation)
		self.view.sizeToFit()
		
	}
	
	public func rotate(_ rotation: Rotation) {
		
		let orientation = Orientation.value(from: self.orientation.rawValue + rotation.rawValue)
		self.rotate(to: orientation)
		
	}
	
}

extension IPhoneXScreenController {
	
	private func updateLayoutMargins() {
		switch self.orientation {
		case .portrait, .portraitUpsideDown:
			self.view.layoutMargins = .init(top: 0, left: 15, bottom: 0, right: 15)
		case .landscapeLeft, .landscapeRight:
			self.view.layoutMargins = .init(top: 20, left: 15, bottom: 0, right: 15)
		}
	}
	
	private func updateSafeAreaInsets() {
		switch self.orientation {
		case .portrait:
			self.additionalSafeAreaInsets = .init(top: 44, left: 0, bottom: 34, right: 0)
			
		case .portraitUpsideDown:
			self.additionalSafeAreaInsets = .init(top: 34, left: 0, bottom: 44, right: 0)
			
		case .landscapeLeft, .landscapeRight:
			self.additionalSafeAreaInsets = .init(top: 0, left: 44, bottom: 24, right: 44)
		}
	}
	
}
