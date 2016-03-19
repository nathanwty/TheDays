//
//  TextEditViewController.m
//  TheDays
//
//  Created by nathan on 16/2/29.
//  Copyright © 2016年 nathanwty. All rights reserved.
//

#import "TextEditViewController.h"
#import "DiaryEntry.h"
#import "DiaryCoreDataStack.h"
#import "VLDContextSheetItem.h"

@interface TextEditViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *imagePikerButton;

@property (nonatomic, strong) UIImage *pickedImage;

@end

@implementation TextEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *date;
    
    // Do any additional setup after loading the view.
    if (self.entry != nil) {
        self.textView.text = self.entry.body;
        
        date = [NSDate dateWithTimeIntervalSince1970:self.entry.date];
    } else {
        
        date = [NSDate date];
        
    }
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE MMMM d, yyyy"];
    self.dateLabel.text = [dateFormatter stringFromDate:date];


    self.imagePikerButton.layer.cornerRadius = CGRectGetWidth(self.imagePikerButton.frame) / 2.0f;
    
    //creat ContextSheet
    [self createContextSheet];
    
    
    //主色调
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIGestureRecognizer *gestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget: self
                                                                                           action: @selector(longPressed:)];
    [self.view addGestureRecognizer: gestureRecognizer];
    

}

//VLD methods
- (void) createContextSheet {
    VLDContextSheetItem *item1 = [[VLDContextSheetItem alloc] initWithTitle: @"Gift"
                                                                      image: [UIImage imageNamed: @"gift"]
                                                           highlightedImage: [UIImage imageNamed: @"gift_highlighted"]];
    
    
    VLDContextSheetItem *item2 = [[VLDContextSheetItem alloc] initWithTitle: @"Add to"
                                                                      image: [UIImage imageNamed: @"add"]
                                                           highlightedImage: [UIImage imageNamed: @"add_highlighted"]];
    
    VLDContextSheetItem *item3 = [[VLDContextSheetItem alloc] initWithTitle: @"Share"
                                                                      image: [UIImage imageNamed: @"share"]
                                                           highlightedImage: [UIImage imageNamed: @"share_highlighted"]];
    
    self.contextSheet = [[VLDContextSheet alloc] initWithItems: @[ item1, item2, item3 ]];
    self.contextSheet.delegate = self;
}



//扩展部分
- (void) contextSheet: (VLDContextSheet *) contextSheet didSelectItem: (VLDContextSheetItem *) item {
    NSLog(@"Selected item: %@", item.title);
}

- (void) longPressed: (UIGestureRecognizer *) gestureRecognizer {
    if(gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        [self.contextSheet startWithGestureRecognizer: gestureRecognizer
                                               inView: self.view];
    }
}

- (void) willRotateToInterfaceOrientation: (UIInterfaceOrientation) toInterfaceOrientation
                                 duration: (NSTimeInterval) duration {
    
    [super willRotateToInterfaceOrientation: toInterfaceOrientation duration: duration];
    
    [self.contextSheet end];
}














- (void)dissmissSelf
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)doneWasPressed:(id)sender {
    
    if (self.entry != nil) {
        [self updateDiaryEntry];
    } else {
        [self insertDiaryEntry];
    }
    
    [self dissmissSelf];
    
}

- (IBAction)cancelWasPressed:(id)sender {
    [self dissmissSelf];
}

- (void)insertDiaryEntry
{
    DiaryCoreDataStack *coreDataStack = [DiaryCoreDataStack defaultStack];
    DiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"DiaryEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.body = self.textView.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [coreDataStack saveContext];
}

- (void)updateDiaryEntry {
    self.entry.body = self.textView.text;
    
    DiaryCoreDataStack *coreDataStack = [DiaryCoreDataStack defaultStack];
    [coreDataStack saveContext];
}


 
- (IBAction)imageSelectionButtonWasPressed:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self promptForSource];
    } else {
        [self promptForPhotoRoll];
    }
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        if (buttonIndex == actionSheet.firstOtherButtonIndex) {
            [self promptForCamera];
        } else {
            [self promptForPhotoRoll];
        }
    }
}
- (void)promptForSource {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Image Source" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photo Roll", nil];
    
    [actionSheet showInView:self.view];
}
- (void)promptForCamera {
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)promptForPhotoRoll {
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.pickedImage = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setPickedImage:(UIImage *)pickedImage {
    _pickedImage = pickedImage;
    
    if (pickedImage == nil) {
        [self.imagePikerButton setImage:[UIImage imageNamed:@"icn_noimage"] forState:UIControlStateNormal];
    } else {
        [self.imagePikerButton setImage:pickedImage forState:UIControlStateNormal];
    }
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*
 - (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [sideBar insertMenuButtonOnView:[UIApplication sharedApplication].delegate.window atPosition:CGPointMake(self.view.frame.size.width - 70, 50)];
}
 */

@end
