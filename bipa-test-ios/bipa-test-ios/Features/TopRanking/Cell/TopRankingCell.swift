//
//  TopRankingCell.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 23/06/24.
//

import UIKit

class TopRankingCell: UITableViewCell {

    let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 10.0
        return stack
    }()

    let publicKeyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let aliasLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let channelsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let capacityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstSeenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let updatedAtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addSubview(cellView)
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        cellView.addSubview(stackView)
        stackView.addArrangedSubview(publicKeyLabel)
        stackView.addArrangedSubview(aliasLabel)
        stackView.addArrangedSubview(channelsLabel)
        stackView.addArrangedSubview(capacityLabel)
        stackView.addArrangedSubview(firstSeenLabel)
        stackView.addArrangedSubview(updatedAtLabel)
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(countryLabel)
    }
    
    func didDisplay(node: TopRankingModel) {
        publicKeyLabel.text = node.publicKey
        aliasLabel.text = node.alias
        channelsLabel.text = node.channels
        capacityLabel.text = node.capacity
        firstSeenLabel.text = node.firstSeen
        updatedAtLabel.text = node.updatedAt
        cityLabel.text = node.city
        countryLabel.text = node.country
    }
}
