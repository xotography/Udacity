//
//  SavedMemesViewController.swift
//  Meme
//
//  Created by Ariya Behjat on 21/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import UIKit

final class SavedMemesViewController: UIViewController {
    let tableView = UITableView()
    let dataSource = SavedMemesDataSource()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: SavedMemesCollectionLayout())
    let tabBar = UITabBar()
    let tableBarItem = UITabBarItem()
    let collectionBarItem = UITabBarItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = Labels.SavedMemesScreen.title
        tableView.register(
            SavedMemesTableCell.self,
            forCellReuseIdentifier: SavedMemesTableCell.identifier
        )
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        collectionView.register(
            SavedMemesCollectionCell.self,
            forCellWithReuseIdentifier: SavedMemesCollectionCell.identifier
        )
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        
        setUpNavigationBar()
        setUpTableView()
        setUpCollectionView()
        setUpTabBar()
        tabBar.selectedItem = tableBarItem
    }
    
    override func viewDidLayoutSubviews() {
        if let layout = collectionView.collectionViewLayout as? SavedMemesCollectionLayout {
            layout.setWidth(width: view.frame.width)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated: true)
    }
    
    private func setUpNavigationBar() {
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self,  action: #selector(presentEditorViewController))
        navigationItem.rightBarButtonItem = addItem
    }
    
    private func setUpTabBar() {
        tabBar.delegate = self
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tabBar)
        NSLayoutConstraint.activate([
            tabBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        collectionBarItem.image = UIImage(systemName: "rectangle.split.3x3")
        tableBarItem.image = UIImage(systemName: "list.dash")
        tabBar.setItems([tableBarItem, collectionBarItem], animated: false)
    }
    
    private func setUpTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        tableView.backgroundView = BackgroundView()
    }
    
    private func setUpCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        collectionView.backgroundColor = .white
        collectionView.backgroundView = BackgroundView()
        collectionView.isHidden = true
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPress.minimumPressDuration = 1.0
        longPress.delaysTouchesBegan = true
        collectionView.addGestureRecognizer(longPress)
    }
    
    private func setEditingMode(on isOn: Bool) {
        let doneItem = isOn ? UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(doneAction)
        ) : nil
        
        navigationItem.leftBarButtonItem = doneItem
        navigationItem.rightBarButtonItem?.isEnabled = !isOn
        tableBarItem.isEnabled = !isOn
        collectionBarItem.isEnabled = !isOn
        dataSource.isEditModeOn = isOn
    }
    
    @objc func presentEditorViewController() {
        let vc = MemeEditorViewController { [weak self] in
            self?.dataSource.reloadData()
            self?.tableView.reloadData()
            self?.collectionView.reloadData()
        }
        let nvc = UINavigationController(rootViewController: vc)
        self.present(nvc, animated: true)
    }
    
    @objc func handleLongPress(_ longPress: UILongPressGestureRecognizer) {
        setEditingMode(on: true)
        collectionView.reloadData()
    }
    
    @objc func doneAction() {
        setEditingMode(on: false)
        collectionView.reloadData()
    }
}

extension SavedMemesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = dataSource.tableView(tableView, cellForRowAt: indexPath) as? SavedMemesTableCell
        if let image = cell?.memeImageView.image {
            let vc = MemeImageViewController(image: image)
            self.navigationController?.pushViewController(vc, animated: true)
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

extension SavedMemesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if dataSource.isEditModeOn {
            dataSource.deleteMeme(at: indexPath)
            collectionView.deleteItems(at: [indexPath])
            if collectionView.numberOfItems(inSection: 0) == 0 {
                setEditingMode(on: false)
            }
        } else {
            let image = dataSource.memeViewModels[indexPath.row].image
            let vc = MemeImageViewController(image: image)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let memeCell = cell as? SavedMemesCollectionCell else { return }
        
        memeCell.deleteImageView.isHidden = !dataSource.isEditModeOn
        if dataSource.isEditModeOn {
            let animation = makeWiggleAnimation(for: indexPath)
            memeCell.layer.add(animation, forKey: "transform")
        } else {
            memeCell.layer.removeAllAnimations()
        }
    }
    
    private func makeWiggleAnimation(for indexPath: IndexPath) -> CAKeyframeAnimation {
        let transformAnim  = CAKeyframeAnimation(keyPath:"transform")
        transformAnim.values  = [
            NSValue(caTransform3D: CATransform3DMakeRotation(0.04, 0.0, 0.0, 1.0)),
            NSValue(caTransform3D: CATransform3DMakeRotation(-0.04 , 0, 0, 1))
        ]
        transformAnim.autoreverses = true
        transformAnim.duration  = indexPath.row % 2 == 0 ? 0.115 : 0.105
        transformAnim.repeatCount = .infinity
        return transformAnim
    }
}

extension SavedMemesViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let selectedIndex = tabBar.items?.firstIndex(of: item) else { return }
        if selectedIndex == 0 {
            collectionView.isHidden = true
            tableView.isHidden = false
            tableView.reloadData()
        } else {
            tableView.isHidden = true
            collectionView.isHidden = false
            collectionView.reloadData()
        }
    }
}

