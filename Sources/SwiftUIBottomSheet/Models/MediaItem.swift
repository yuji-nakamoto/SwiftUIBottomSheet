
import Foundation

public enum MediaType {
    case photo
    case camera
    case video
    case voice
}

public protocol MediaSelectDelegate: AnyObject {
    func onPhotoSelected()
    func onCameraSelected()
    func onVideoSelected()
    func onVoiceSelected()
}
