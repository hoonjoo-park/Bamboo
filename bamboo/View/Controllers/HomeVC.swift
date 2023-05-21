import UIKit
import SnapKit

class HomeVC: UIViewController {
    var userVM: UserViewModel!
    let homeHeaderView = HomeHeaderView(frame: .zero)
    
    init(userVM: UserViewModel!) {
        super.init(nibName: nil, bundle: nil)
        self.userVM = userVM
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = BambooColors.black
        navigationController?.isNavigationBarHidden = true
    }
    
    
    private func configureUI() {
        [homeHeaderView].forEach { view.addSubview($0) }
        
        homeHeaderView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
}
