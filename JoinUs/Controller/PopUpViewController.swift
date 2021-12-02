//
//  PopUpViewController.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/30.
//

import UIKit

class PopUpViewController: UIViewController {
    
    // MARK: - Properies
    let seasonCollectionViewModel = SeasonCollectionViewModel()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    let seasonCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        
        return collectionView
    }()
    
    let selectionButton: UIButton = {
        let button = UIButton()
        button.setTitle("선택", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.titleLabel?.textAlignment = .center
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.darkGray.cgColor
        
        button.addTarget(self, action: #selector(clickSelectionButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.post(
            name: Notification.Name(Strings.didDismissPopUpViewNotification),
            object: nil,
            userInfo: ["urlString": RequestSeason.urlPath]
        )
    }
    
    func configureUI() {
        view.backgroundColor = .black.withAlphaComponent(0.6)
        view.addSubview(containerView)
        containerView.addSubview(seasonCollectionView)
        containerView.addSubview(selectionButton)
        
        seasonCollectionView.register(SeasonCollectionViewCell.self, forCellWithReuseIdentifier: SeasonCollectionViewCell.identifier)
        
        seasonCollectionView.dataSource = self
        seasonCollectionView.delegate = self
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        seasonCollectionView.translatesAutoresizingMaskIntoConstraints = false
        selectionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 210),
            containerView.heightAnchor.constraint(equalToConstant: 210),
            
            seasonCollectionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            seasonCollectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            seasonCollectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            seasonCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            selectionButton.topAnchor.constraint(equalTo: seasonCollectionView.bottomAnchor, constant: 10),
            selectionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            selectionButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            selectionButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func clickSelectionButton() {
        dismiss(animated: false, completion: nil)
    }
}

// MARK: - UICollectionViewDataSource
extension PopUpViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return seasonCollectionViewModel.countSeasonList
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SeasonCollectionViewCell.identifier,
            for: indexPath
        ) as? SeasonCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch StandingsViewController.selectedSeasonIndex {
        case indexPath.row:
            cell.layer.borderWidth = 2.0
            cell.layer.borderColor = UIColor.green.cgColor
            
        default:
            cell.layer.borderWidth = 1.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        cell.layer.cornerRadius = 8
        
        let seasonInfo = seasonCollectionViewModel.seasonInfo(at: indexPath.row)
        
        cell.configureCell()
        cell.update(seasonInfo: seasonInfo)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension PopUpViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        switch StandingsViewController.selectedSeasonIndex {
        case indexPath.row:
            break
            
        default:
            RequestSeason.year = seasonCollectionViewModel.seasonInfo(at: indexPath.row).year
            RequestSeason.seasonName = seasonCollectionViewModel.seasonInfo(at: indexPath.row).seasonName
            StandingsViewController.selectedSeasonIndex = indexPath.row
            
            collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PopUpViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 90, height: 65)
    }
}
