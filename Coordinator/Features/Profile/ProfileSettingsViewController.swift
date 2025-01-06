import UIKit

class ProfileSettingsViewController: UIViewController {
    private let viewModel: ProfileSettingsViewModel
    
    init(viewModel: ProfileSettingsViewModel) {
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
        title = "Profile Settings"
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let advancedButton = UIButton(configuration: .filled())
        advancedButton.setTitle("Advanced Settings", for: .normal)
        advancedButton.addTarget(self, action: #selector(advancedTapped), for: .touchUpInside)
        
        stackView.addArrangedSubview(advancedButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func advancedTapped() {
        viewModel.showAdvancedSettings()
    }
} 