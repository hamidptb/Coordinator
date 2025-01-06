import UIKit

class SettingsViewController: UIViewController {
    private let viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Settings"
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let profileButton = UIButton(configuration: .filled())
        profileButton.setTitle("Go to Profile Advanced Settings", for: .normal)
        profileButton.addTarget(self, action: #selector(profileAdvancedTapped), for: .touchUpInside)
        
        stackView.addArrangedSubview(profileButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func profileAdvancedTapped() {
        viewModel.navigateToProfileAdvancedSettings()
    }
} 