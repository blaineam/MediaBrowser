
import AVKit
import UIKit

/// MediaCaptionView is based in UIToolbar
public class MediaBrowserAVPlayerViewController: AVPlayerViewController {
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        showsPlaybackControls = true
        super.touchesBegan(touches, with: event)
    }
}
