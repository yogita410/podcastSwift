import UIKit

class PodcastCell: UITableViewCell {

    static let reuseIdentifier = "PodcastCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let hostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        accessoryType = .disclosureIndicator

        contentView.addSubview(titleLabel)
        contentView.addSubview(hostLabel)
        contentView.addSubview(durationLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            hostLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            hostLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hostLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            durationLabel.topAnchor.constraint(equalTo: hostLabel.bottomAnchor, constant: 4),
            durationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            durationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }

    func configure(with podcast: Podcast) {
        titleLabel.text = podcast.title
        hostLabel.text = "🎙 \(podcast.host)"
        durationLabel.text = "⏱ \(podcast.duration)"
    }
}

class PodcastListViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var genre: Genre!
    var userName: String = ""

    private var podcasts: [Podcast] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        podcasts = MockData.podcasts(for: genre.name)
        title = genre.name
        headerLabel.text = "\(genre.emoji) \(genre.name) Podcasts"

        tableView.register(PodcastCell.self, forCellReuseIdentifier: PodcastCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 90
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PodcastListToDetail",
           let destination = segue.destination as? PodcastDetailViewController,
           let podcast = sender as? Podcast {
            destination.podcast = podcast
            destination.genreEmoji = genre.emoji
        }
    }
}

extension PodcastListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        podcasts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: PodcastCell.reuseIdentifier,
            for: indexPath
        ) as! PodcastCell
        cell.configure(with: podcasts[indexPath.row])
        return cell
    }
}

extension PodcastListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "PodcastListToDetail", sender: podcasts[indexPath.row])
    }
}
