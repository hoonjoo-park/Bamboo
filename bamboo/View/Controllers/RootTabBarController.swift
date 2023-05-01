import UIKit
import RxSwift

class RootTabBarController: UITabBarController {
    let userVM = UserViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchUser()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] user in
                self?.userVM.updateUser(user)
            }, onError: { error in
                print("[Fetch User Error], \(error)")
            }).disposed(by: disposeBag)
        
        UITabBar.appearance().tintColor = BambooColors.white
        UITabBar.appearance().unselectedItemTintColor = BambooColors.gray
        UITabBar.appearance().backgroundColor = BambooColors.navy
        
        viewControllers = [createHomeVC(), createWritePostVC(), createMyPageVC()]
    }
    
    
    private func createHomeVC() -> UINavigationController {
        let homeVC = HomeVC()
        let tabBarImage: UIImage!
        
        tabBarImage = UIImage(systemName: "house")?.withBaselineOffset(fromBottom: 15)
        homeVC.tabBarItem = UITabBarItem(title: "", image: tabBarImage, tag: 0)
        
        return UINavigationController(rootViewController: homeVC)
    }
    
    
    private func createWritePostVC() -> UINavigationController {
        let writePostVC = WritePostVC()
        let tabBarImage: UIImage!

        tabBarImage = UIImage(systemName: "plus.circle")?.withTintColor(BambooColors.green, renderingMode: .alwaysOriginal)
                                                        .withBaselineOffset(fromBottom: 15)
        writePostVC.tabBarItem = UITabBarItem(title: "", image: tabBarImage, tag: 1)
        
        return UINavigationController(rootViewController: writePostVC)
    }
    
    
    private func createMyPageVC() -> UINavigationController {
        let myPageVC = MyPageVC(userVM: userVM)
        let tabBarImage: UIImage!
        
        tabBarImage = UIImage(systemName: "person")?.withBaselineOffset(fromBottom: 15)
        myPageVC.tabBarItem = UITabBarItem(title: "", image: tabBarImage, tag: 2)
        
        return UINavigationController(rootViewController: myPageVC)
    }
}
