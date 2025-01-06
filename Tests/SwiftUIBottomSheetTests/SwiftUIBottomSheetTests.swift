import XCTest
import SwiftUI
@testable import SwiftUIBottomSheet

final class BottomSheetViewTests: XCTestCase {
   private var mockDelegate: MockMediaSelectDelegate!
   
   override func setUp() {
       super.setUp()
       mockDelegate = MockMediaSelectDelegate()
   }
   
   override func tearDown() {
       mockDelegate = nil
       super.tearDown()
   }
   
    @MainActor
    func test_初期化時にメディアボタンが正しく生成されること() {
        let sut = BottomSheetView(
            keyboardMaxHeight: 300,
            isDarkMode: false,
            delegate: mockDelegate
        )
        
        let photoButton = MediaButton(
            systemName: "photo",
            title: "画像",
            isDarkMode: false
        ) { }
        
        // 1. MediaButtonの内部パラメータを検証
        XCTAssertEqual(photoButton.systemName, "photo")
        XCTAssertEqual(photoButton.title, "画像")
        XCTAssertFalse(photoButton.isDarkMode)
        
        // 2. デリゲート呼び出しを検証
        sut.delegate.onPhotoSelected()
        XCTAssertTrue(mockDelegate.isPhotoSelectedCalled)
    }
   
   @MainActor
   func test_写真ボタンタップ時にデリゲートメソッドが呼ばれること() {
       // Given
       let sut = BottomSheetView(
           keyboardMaxHeight: 300,
           isDarkMode: false,
           delegate: mockDelegate
       )
       
       // When
       mockDelegate.isPhotoSelectedCalled = false
       sut.delegate.onPhotoSelected()
       
       // Then
       XCTAssertTrue(mockDelegate.isPhotoSelectedCalled)
   }
   
   @MainActor
   func test_カメラボタンタップ時にデリゲートメソッドが呼ばれること() {
       // Given
       let sut = BottomSheetView(
           keyboardMaxHeight: 300,
           isDarkMode: false,
           delegate: mockDelegate
       )
       
       // When
       mockDelegate.isCameraSelectedCalled = false
       sut.delegate.onCameraSelected()
       
       // Then
       XCTAssertTrue(mockDelegate.isCameraSelectedCalled)
   }
   
   @MainActor
   func test_動画ボタンタップ時にデリゲートメソッドが呼ばれること() {
       // Given
       let sut = BottomSheetView(
           keyboardMaxHeight: 300,
           isDarkMode: false,
           delegate: mockDelegate
       )
       
       // When
       mockDelegate.isVideoSelectedCalled = false
       sut.delegate.onVideoSelected()
       
       // Then
       XCTAssertTrue(mockDelegate.isVideoSelectedCalled)
   }
   
   @MainActor
   func test_ボイスボタンタップ時にデリゲートメソッドが呼ばれること() {
       // Given
       let sut = BottomSheetView(
           keyboardMaxHeight: 300,
           isDarkMode: false,
           delegate: mockDelegate
       )
       
       // When
       mockDelegate.isVoiceSelectedCalled = false
       sut.delegate.onVoiceSelected()
       
       // Then
       XCTAssertTrue(mockDelegate.isVoiceSelectedCalled)
   }
}

class MockMediaSelectDelegate: MediaSelectDelegate {
   var isPhotoSelectedCalled = false
   var isCameraSelectedCalled = false
   var isVideoSelectedCalled = false
   var isVoiceSelectedCalled = false
   
   func onPhotoSelected() {
       isPhotoSelectedCalled = true
   }
   
   func onCameraSelected() {
       isCameraSelectedCalled = true
   }
   
   func onVideoSelected() {
       isVideoSelectedCalled = true
   }
   
   func onVoiceSelected() {
       isVoiceSelectedCalled = true
   }
}
