//
//  MainViewController.swift
//  ui
//
//  Created by ImNotPro on 12/05/19.
//

import UIKit
import presenter

class MainViewController: BaseViewController {

    var data: [PostViewModel]?

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var postCollectionView: UICollectionView!

    var postsViewModel: PostsViewModel!
    var postMapper: PostMapper!

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        postCollectionView.dataSource = self
        postCollectionView.delegate = self
        postCollectionView.register(UINib.init(nibName: R.nib.postCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: R.nib.postCollectionViewCell.identifier)

        // Do any additional setup after loading the view.
        postsViewModel.postResponse.drive(onNext: { resourse in
            switch resourse.state {
            case .LOADING:
                self.loadingIndicator.visibility = .visible
            case .SUCCESS:
                self.loadingIndicator.visibility = .gone
                if let data = resourse.data {
                    self.data = data.map {self.postMapper.mapToViewModel($0)}
                    self.postCollectionView.reloadData()
                    self.postCollectionView.visibility = .visible
                }
            case .ERROR:
                self.loadingIndicator.visibility = .gone
            }
        }).disposed(by: disposeBag)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.postCollectionViewCell.identifier, for: indexPath)

        if let postCell = cell as? PostCollectionViewCell, let post = data {
            postCell.bind(post[indexPath.row])
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 16)
        return CGSize(width: size, height: (size * 2))
    }

}

extension MainViewController {
    func injectProperties(_ postsViewModel: PostsViewModel,
                          _ postMapper: PostMapper) {
        self.postsViewModel = postsViewModel
        self.postMapper = postMapper
    }
}
