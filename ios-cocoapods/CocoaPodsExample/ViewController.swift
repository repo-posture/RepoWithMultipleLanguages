import UIKit
import Alamofire
import SDWebImage
import SnapKit
import SwiftyJSON
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .systemGray6
        return iv
    }()
    
    private let fetchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fetch Image", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        return button
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        view.addSubview(fetchButton)
        view.addSubview(statusLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(300)
        }
        
        fetchButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(fetchButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setupBindings() {
        fetchButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.fetchRandomImage()
            })
            .disposed(by: disposeBag)
    }
    
    private func fetchRandomImage() {
        statusLabel.text = "Fetching image..."
        
        let url = "https://picsum.photos/400/300"
        
        AF.request(url).response { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let data):
                if let data = data, let image = UIImage(data: data) {
                    self.imageView.image = image
                    self.statusLabel.text = "Image loaded successfully! ✓"
                } else {
                    self.statusLabel.text = "Failed to decode image"
                }
            case .failure(let error):
                self.statusLabel.text = "Error: \(error.localizedDescription)"
            }
        }
    }
}
