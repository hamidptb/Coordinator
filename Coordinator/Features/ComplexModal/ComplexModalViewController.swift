import UIKit

class ComplexModalViewController: UIViewController {
    private let viewModel: ComplexModalViewModel
    
    init(viewModel: ComplexModalViewModel) {
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
        title = "Complex Modal"
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let nestedButton = UIButton(configuration: .filled())
        nestedButton.setTitle("Show Nested Modal", for: .normal)
        nestedButton.addTarget(self, action: #selector(nestedTapped), for: .touchUpInside)
        
        let dismissButton = UIButton(configuration: .filled())
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        
        [nestedButton, dismissButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func nestedTapped() {
        viewModel.showNestedModal()
    }
    
    @objc private func dismissTapped() {
        viewModel.dismiss()
    }
} 