//
//  ViewController.swift
//  MakeQRCode
//
//  Created by Patrick Costello on 11/24/24.
//
import Foundation
import AppKit
import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var qrImageView: NSImageView?
    @IBOutlet var inputTextField: NSTextField?
    @IBOutlet var scaleTextField: NSTextField?
    @IBOutlet var scaleSlide: NSSlider?
    var windowCentered: Bool = false

    var scale: CGFloat {
        return scaleSlide?.doubleValue ?? 1
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        if !windowCentered {
            windowCentered = true
            centerWindowOnScreen()
        }
        
        self.view.window?.makeKey()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScaleTextField()
        generateQRCode()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func updateScaleTextField() {
        scaleTextField?.stringValue = "Scale: \(UInt8(scale))"
    }
    
    func generateQRCode() {
        let nsImage: NSImage? = inputTextField?.stringValue.qrCIImage(scale)?.NSImage
        qrImageView?.image = nsImage
    }
    
    @IBAction func generateQRCode(_ sender: Any) {
        generateQRCode()
    }
    
    @IBAction func scaleChanged(_ sender: NSSlider) {
        updateScaleTextField()
        generateQRCode()
    }
    
    @IBAction func pressedSave(_ sender: Any) {
        showSaveDialog()
    }
    
    func showSaveDialog() {
        guard let image = qrImageView?.image else { return }
        
        let savePanel = NSSavePanel()
        
        // Step 2: Configure the save panel
        savePanel.title = "Save Your Document"
        savePanel.prompt = "Save"
        savePanel.allowedContentTypes = [.png] // Optional: Restrict file types (e.g., text files)
        savePanel.nameFieldStringValue = "qrCode.png" // Default file name
        
        // Step 3: Run the save panel as a modal window
        savePanel.begin { (result) in
            if result == .OK, let url = savePanel.url {
                _ = image.saveImageAsPNG(url: url)
            } else {
                print("Save dialog was canceled.")
            }
        }
    }
}







