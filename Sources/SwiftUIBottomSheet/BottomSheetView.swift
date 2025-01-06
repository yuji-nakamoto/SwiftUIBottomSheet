// The Swift Programming Language
// https://docs.swift.org/swift-book

// BottomSheetView.swift
import SwiftUI

public struct BottomSheetView: View {
    private let keyboardMaxHeight: CGFloat
    private let isDarkMode: Bool
    let delegate: MediaSelectDelegate
    
    public init(
        keyboardMaxHeight: CGFloat,
        isDarkMode: Bool = false,
        delegate: MediaSelectDelegate
    ) {
        self.keyboardMaxHeight = keyboardMaxHeight
        self.isDarkMode = isDarkMode
        self.delegate = delegate
    }
    
    public var body: some View {
        VStack {
            HStack(alignment: .top) {
                Spacer()
                photoButton
                Spacer()
                cameraButton
                Spacer()
                videoButton
                Spacer()
                voiceButton
                Spacer()
            }
            .padding(.top, 12)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: keyboardMaxHeight)
        .background(isDarkMode ? Color.black.opacity(0.8) : .white)
        .transition(.move(edge: .bottom))
    }
    
    public var photoButton: some View {
        MediaButton(
            systemName: "photo",
            title: "画像",
            isDarkMode: isDarkMode
        ) {
            delegate.onPhotoSelected()
        }
    }
    
    public var cameraButton: some View {
        MediaButton(
            systemName: "camera",
            title: "カメラ",
            isDarkMode: isDarkMode
        ) {
            delegate.onCameraSelected()
        }
    }
    
    public var videoButton: some View {
        MediaButton(
            systemName: "play.circle",
            title: "動画",
            isDarkMode: isDarkMode
        ) {
            delegate.onVideoSelected()
        }
    }
    
    public var voiceButton: some View {
        MediaButton(
            systemName: "mic",
            title: "ボイス",
            isDarkMode: isDarkMode
        ) {
            delegate.onVoiceSelected()
        }
    }
}

struct MediaButton: View {
    let systemName: String
    let title: String
    let isDarkMode: Bool
    let action: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: systemName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
                .padding(.bottom, 4)
                .foregroundColor(isDarkMode ? .white : .black)
            
            Text(title)
                .font(.caption2)
                .foregroundColor(isDarkMode ? .white : .black)
        }
        .padding(EdgeInsets(top: 12, leading: 20, bottom: 0, trailing: 20))
        .onTapGesture(perform: action)
    }
}
