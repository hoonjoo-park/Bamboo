import UIKit

class ChatVC: UIViewController {
    var chatRoomId: Int!
    
    init(chatRoomId: Int) {
        super.init(nibName: nil, bundle: nil)
        
        self.chatRoomId = chatRoomId
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ChatRoomViewModel.shared.createdChatRoomSubject.accept(nil)
        configureViewController()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func configureViewController() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        title = "채팅"
        view.backgroundColor = BambooColors.black
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = BambooColors.white
        navigationController?.navigationBar.backgroundColor = BambooColors.black
    }
}
