//
//  SpeechManager.swift
//  TextToSpeechApp
//
//  Created by Nobuhiro Takahashi on 2018/06/28.
//  Copyright © 2018年 Nobuhiro Takahashi. All rights reserved.
//

import UIKit
import AVFoundation

final class SpeechManager: NSObject, AVSpeechSynthesizerDelegate {
    
    static let sharedInstance = SpeechManager()
    
    var texts = [String]()
    let speechSynthesizer = AVSpeechSynthesizer()
    var playing = false
    
    private override init() {
        super.init()
        speechSynthesizer.delegate = self
    }
    
    func append(text: String) {
        if playing { return }
        texts.append(text)
        if texts.count == 1 {
            play(text: texts.first!)
        }
    }
    
    // MARK: --
    // MARK: AVSpeechSynthesizerDelegate
    
    internal func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        if texts.count > 0 {
            texts.removeFirst()
            if texts.count > 0 {
                // start a next queued text
                play(text: texts.first!)
            } else {
                playing = false
            }
        } else {
            // finished
            playing = false
        }
    }
    
    func clear() {
        playing = false
        texts.removeAll()
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: .immediate)
        }
    }
    
    private func play(text: String) {
        playing = true
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        speechSynthesizer.speak(utterance)
    }
    
}
