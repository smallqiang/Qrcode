//
//  ReaderSampleViewController.m
//  ReaderSample
//
//  Created by spadix on 4/14/11.
//

#import "ReaderSampleViewController.h"

@implementation ReaderSampleViewController

@synthesize resultImage, resultText;

- (IBAction) scanButtonTapped
{
    // ADD: present a barcode reader that scans from the camera feed
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;

    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here

    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];

    // present and release the controller
    [self presentModalViewController: reader
                            animated: YES];
    [reader release];
}

/*
- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;

    // EXAMPLE: do something useful with the barcode data
    resultText.text = symbol.data;

    // EXAMPLE: do something useful with the barcode image
    resultImage.image =
    [info objectForKey: UIImagePickerControllerOriginalImage];

    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissModalViewControllerAnimated: YES];
}*/

- (void) imagePickerController: (UIImagePickerController*) reader

 didFinishPickingMediaWithInfo: (NSDictionary*) info

{
    
    
    
    NSLog(@"info=%@",info);
    
    // 得到条形码结果
    
    id<NSFastEnumeration> results =
    
    [info objectForKey: ZBarReaderControllerResults];
    
    ZBarSymbol *symbol = nil;
    
    for(symbol in results)
        
        // EXAMPLE: just grab the first barcode
        
        break;
    
    
    
    // 将获得到条形码显示到我们的界面上
    
    resultText.text = symbol.data;
    
    
    
    // 扫描时的图片显示到我们的界面上
    
    resultImage.image =
    
    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    
    
    // 扫描界面退出
    
    [reader dismissModalViewControllerAnimated: YES];
    
}

- (void) dealloc {
    self.resultImage = nil;
    self.resultText = nil;
    [super dealloc];
}

@end
