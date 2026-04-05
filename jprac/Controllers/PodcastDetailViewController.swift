import UIKit

class PodcastDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emojiImageView: UILabel!
    @IBOutlet weak var podcastTitleLabel: UILabel!
    @IBOutlet weak var hostLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var podcast: Podcast!
    var genreEmoji: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Episode"

        emojiImageView.text = genreEmoji
        emojiImageView.font = UIFont.systemFont(ofSize: 72)
        emojiImageView.textAlignment = .center

        podcastTitleLabel.text = podcast.title
        podcastTitleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        podcastTitleLabel.numberOfLines = 0
        podcastTitleLabel.textColor = .label

        hostLabel.text = "🎙 \(podcast.host)"
        hostLabel.font = UIFont.systemFont(ofSize: 15)
        hostLabel.textColor = .systemPurple

        durationLabel.text = "⏱ \(podcast.duration)"
        durationLabel.font = UIFont.systemFont(ofSize: 13)
        durationLabel.textColor = .secondaryLabel

        descriptionLabel.text = podcast.fullDescription
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .label
    }
}
