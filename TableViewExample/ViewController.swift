//
//  ViewController.swift
//  TableViewExample
//
//  Created by Islam Temirbek on 05.03.2024.
//

import UIKit
import SnapKit

struct Setting {
    var name: String
    var image: String
}

final class ViewController: UIViewController {
    
    // MARK: - State
    
    var settings: [[Setting]] = [
        [
            Setting(name: "Rustem", image: "eraser.line.dashed"),
            Setting(name: "Asylbek", image: "eraser.line.dashed"),
        ],
        [
            Setting(name: "Arai", image: "eraser.line.dashed"),
            Setting(name: "Aidana", image: "eraser.line.dashed"),
            Setting(name: "Sait", image: "eraser.line.dashed"),
        ],
        [
            Setting(name: "Ivan", image: "eraser.line.dashed"),
            Setting(name: "Andrei", image: "eraser.line.dashed")
        ]
    ]

    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell_id_1")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell_id")
        tableView.backgroundColor = .white
        tableView.rowHeight = 100
        tableView.sectionHeaderHeight = 100
        tableView.sectionFooterHeight = 50

        tableView.delegate = self
        tableView.tableHeaderView = TableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200))
        tableView.tableFooterView = TableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200))

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
        setupConstraints()
    }
    
    
    // MARK: - Setup Navigation Bar
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Settings"
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.backgroundColor = .red
        
        view.addSubview(tableView)
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id_1", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let name = settings[indexPath.section][indexPath.row].name
        let image = settings[indexPath.section][indexPath.row].image

        cell.configreCell(name: name, imageName: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .orange
        
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

