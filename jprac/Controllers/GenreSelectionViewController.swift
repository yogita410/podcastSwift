import UIKit

class GenreCell: UICollectionViewCell {

    static let reuseIdentifier = "GenreCell"

    private static let colors: [UIColor] = [
        .systemPurple,
        .systemBlue,
        .systemOrange,
        .systemGreen,
        .systemPink,
        .systemTeal,
    ]

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        layer.cornerRadius = 14
        layer.masksToBounds = true
        contentView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }

    func configure(with genre: Genre, index: Int) {
        nameLabel.text = genre.name
        backgroundColor = Self.colors[index % Self.colors.count]
    }
}

class GenreSelectionViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var collectionViewContainer: UIView!

    var userName: String = ""
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Hey, \(userName) 👋"
        setupCollectionView()
    }

    private func setupCollectionView() {
        let spacing: CGFloat = 12
        let itemWidth = (UIScreen.main.bounds.width - spacing * 3) / 2

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidth, height: 100)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)

        collectionView = UICollectionView(frame: collectionViewContainer.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .clear
        collectionView.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionViewContainer.addSubview(collectionView)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GenreToPodcastList",
           let destination = segue.destination as? PodcastListViewController,
           let genre = sender as? Genre {
            destination.genre = genre
            destination.userName = userName
        }
    }
}

extension GenreSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MockData.genres.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GenreCell.reuseIdentifier,
            for: indexPath
        ) as! GenreCell
        cell.configure(with: MockData.genres[indexPath.item], index: indexPath.item)
        return cell
    }
}

extension GenreSelectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let genre = MockData.genres[indexPath.item]
        performSegue(withIdentifier: "GenreToPodcastList", sender: genre)
    }
}
