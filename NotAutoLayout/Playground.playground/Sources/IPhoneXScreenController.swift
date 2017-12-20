import UIKit

public final class IPhoneXScreenController: UIViewController {
	
	private lazy var iPhoneXScreen: IPhoneXScreen = {
		let screen = IPhoneXScreen()
		screen.sizeToFit()
		return screen
	}()
	
	public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.initialize()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.initialize()
	}
	
	public convenience init() {
		self.init(nibName: nil, bundle: nil)
	}
	
}

extension IPhoneXScreenController {
	
	public override func loadView() {
		self.view = self.iPhoneXScreen
	}
	
}

extension IPhoneXScreenController {
	
	private func initialize() {
		self.additionalSafeAreaInsets = .init(top: 44, left: 0, bottom: 34, right: 0)
	}
	
}
