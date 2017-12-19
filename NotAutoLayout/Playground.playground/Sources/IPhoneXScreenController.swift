import UIKit

class IPhoneXScreenController: UIViewController {
	
	private lazy var iPhoneXScreen: IPhoneXScreen = {
		let screen = IPhoneXScreen()
		screen.sizeToFit()
		return screen
	}()
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.initialize()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.initialize()
	}
	
}

extension IPhoneXScreenController {
	
	override func loadView() {
		self.view = self.iPhoneXScreen
	}
	
}

extension IPhoneXScreenController {
	
	private func initialize() {
		self.additionalSafeAreaInsets = .init(top: 44, left: 0, bottom: 0, right: 34)
	}
	
}
