
import UIKit
import AVKit

/// MediaCaptionView is based in UIToolbar
public class MediaBrowserAVPlayerViewController: AVPlayerViewController {
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.showsPlaybackControls = true
        super.touchesBegan(touches, with: event)
    }
}
