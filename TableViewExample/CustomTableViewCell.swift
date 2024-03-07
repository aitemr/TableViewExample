//
//  CustomTableViewCell.swift
//  TableViewExample
//
//  Created by Islam Temirbek on 05.03.2024.
//

import UIKit
import SnapKit

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let avaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "eraser.fill")
        return imageView
    }()
    
    // MARK: - Lifecyle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        contentView.addSubview(avaImageView)
        contentView.addSubview(label)
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        avaImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(40)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(avaImageView.snp.trailing).offset(10)
        }
    }
    
    public func configreCell(name: String, imageName: String) {
        self.label.text = name
        self.avaImageView.image = UIImage(systemName: imageName)
    }
    
}
