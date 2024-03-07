//
//  TableViewHeader.swift
//  TableViewExample
//
//  Created by Islam Temirbek on 07.03.2024.
//

import UIKit
import SnapKit

final class TableViewHeader: UIView {
    // MARK: - UI
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Lifeycycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        backgroundColor = .systemPink
        addSubview(label)
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}
