//
//  ViewController.m
//  IntermediateCertification
//
//  Created by Andrey Zavershinskiy on 22.01.2024.
//

#import "ViewController.h"
#import "Robot.h"

@interface ViewController ()

@property (strong, nonatomic, readonly) UITextField *nameTextField, *xCoordTextField, *yCoordTextField;
@property (strong, nonatomic, readonly) UITextView *textView;
@property (strong, nonatomic, readonly) UIButton *userDefaultsButton, *fileButton;
@property (strong, nonatomic, readonly) NSUserDefaults *userDefaults;
@property (strong, nonatomic, readonly) NSFileManager *fileManager;

@end

@implementation ViewController

#pragma mark - UI
@synthesize nameTextField = _nameTextField;
- (UITextField *)nameTextField {
	if (!_nameTextField) {
		_nameTextField = [UITextField new];
		_nameTextField.backgroundColor = [UIColor systemGray6Color];
		_nameTextField.borderStyle = UITextBorderStyleRoundedRect;
		_nameTextField.placeholder = @"Robot name";
	}
	return _nameTextField;
}

@synthesize xCoordTextField = _xCoordTextField;
- (UITextField *)xCoordTextField {
	if (!_xCoordTextField) {
		_xCoordTextField = [UITextField new];
		_xCoordTextField.backgroundColor = [UIColor systemGray6Color];
		_xCoordTextField.borderStyle = UITextBorderStyleRoundedRect;
		_xCoordTextField.keyboardType = UIKeyboardTypeNumberPad;
		_xCoordTextField.placeholder = @"X-coordinate";
	}
	return _xCoordTextField;
}

@synthesize yCoordTextField = _yCoordTextField;
- (UITextField *)yCoordTextField {
	if (!_yCoordTextField) {
		_yCoordTextField = [UITextField new];
		_yCoordTextField.backgroundColor = [UIColor systemGray6Color];
		_yCoordTextField.borderStyle = UITextBorderStyleRoundedRect;
		_yCoordTextField.keyboardType = UIKeyboardTypeNumberPad;
		_yCoordTextField.placeholder = @"Y-coordinate";
	}
	return _yCoordTextField;
}

@synthesize textView = _textView;
- (UITextView *)textView {
	if (!_textView) {
		_textView = [UITextView new];
		_textView.backgroundColor = [UIColor systemMintColor];
		_textView.layer.cornerRadius = 5;
		_textView.editable = false;
		_textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
	}
	return _textView;
}

@synthesize userDefaultsButton = _userDefaultsButton;
- (UIButton *)userDefaultsButton {
	if (!_userDefaultsButton) {
		_userDefaultsButton = [UIButton new];
		[_userDefaultsButton setTitle:@"Save to UserDefaults" forState:UIControlStateNormal];
		_userDefaultsButton.configuration = [UIButtonConfiguration borderedProminentButtonConfiguration];
		[_userDefaultsButton addTarget:self
								action:@selector(saveToUserDefaultAndReadToTextView)
					  forControlEvents:UIControlEventTouchUpInside];
	}
	return _userDefaultsButton;
}

@synthesize fileButton = _fileButton;
- (UIButton *)fileButton {
	if (!_fileButton) {
		_fileButton = [UIButton new];
		[_fileButton setTitle:@"Save to File" forState:UIControlStateNormal];
		_fileButton.configuration = [UIButtonConfiguration borderedProminentButtonConfiguration];
		[_fileButton addTarget:self
						action:@selector(saveToFileAndReadToTextView)
			  forControlEvents:UIControlEventTouchUpInside];
	}
	return _fileButton;
}

#pragma mark - Lifecycle
- (instancetype)init {
	self = [super init];
	if (self) {
		_userDefaults = [NSUserDefaults standardUserDefaults];
		_fileManager = [NSFileManager defaultManager];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self setupUI];
}

#pragma mark - Setup UI
- (void)setupUI {
	self.view.backgroundColor = [UIColor systemBackgroundColor];
	[self addSubviews];
	[self setupConstraints];
}

- (void)addSubviews {
	[self.view addSubview:self.nameTextField];
	[self.view addSubview:self.xCoordTextField];
	[self.view addSubview:self.yCoordTextField];
	[self.view addSubview:self.textView];
	[self.view addSubview:self.userDefaultsButton];
	[self.view addSubview:self.fileButton];
}

- (void)setupConstraints {
	self.nameTextField.translatesAutoresizingMaskIntoConstraints = false;
	self.xCoordTextField.translatesAutoresizingMaskIntoConstraints = false;
	self.yCoordTextField.translatesAutoresizingMaskIntoConstraints = false;
	self.textView.translatesAutoresizingMaskIntoConstraints = false;
	self.userDefaultsButton.translatesAutoresizingMaskIntoConstraints = false;
	self.fileButton.translatesAutoresizingMaskIntoConstraints = false;

	[NSLayoutConstraint activateConstraints:@[
		[self.nameTextField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:25],
		[self.nameTextField.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:10],
		[self.nameTextField.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-10],

		[self.xCoordTextField.topAnchor constraintEqualToAnchor:self.nameTextField.bottomAnchor constant:10],
		[self.xCoordTextField.leadingAnchor constraintEqualToAnchor:self.nameTextField.leadingAnchor],
		[self.xCoordTextField.widthAnchor constraintEqualToConstant:self.view.frame.size.width / 2 - 15],

		[self.yCoordTextField.topAnchor constraintEqualToAnchor:self.xCoordTextField.topAnchor],
		[self.yCoordTextField.trailingAnchor constraintEqualToAnchor:self.nameTextField.trailingAnchor],
		[self.yCoordTextField.widthAnchor constraintEqualToAnchor:self.xCoordTextField.widthAnchor],

		[self.textView.topAnchor constraintEqualToAnchor:self.xCoordTextField.bottomAnchor constant:10],
		[self.textView.leadingAnchor constraintEqualToAnchor:self.nameTextField.leadingAnchor],
		[self.textView.trailingAnchor constraintEqualToAnchor:self.nameTextField.trailingAnchor],

		[self.userDefaultsButton.topAnchor constraintEqualToAnchor:_textView.bottomAnchor constant:10],
		[self.userDefaultsButton.leadingAnchor constraintEqualToAnchor:self.nameTextField.leadingAnchor],
		[self.userDefaultsButton.trailingAnchor constraintEqualToAnchor:self.nameTextField.trailingAnchor],

		[self.fileButton.topAnchor constraintEqualToAnchor:self.userDefaultsButton.bottomAnchor constant:10],
		[self.fileButton.leadingAnchor constraintEqualToAnchor:self.nameTextField.leadingAnchor],
		[self.fileButton.trailingAnchor constraintEqualToAnchor:self.nameTextField.trailingAnchor],
		[self.fileButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-25]
	]];
}

#pragma mark - UserDefaults
- (void)saveToUserDefaults:(Robot *) robot {
	NSData *robotData = [NSKeyedArchiver archivedDataWithRootObject:robot
											  requiringSecureCoding:YES
															  error:nil];
	[self.userDefaults setObject:robotData forKey:@"robot"];
}

- (Robot *)getFromUserDefaults {
	NSData *robotData = [self.userDefaults objectForKey:@"robot"];
	return [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:
														 Robot.class,
														 NSString.class,
														 nil]
											   fromData:robotData error:nil];
}

- (void)saveToUserDefaultAndReadToTextView {
	Robot *robot = [[Robot alloc]initWithName:self.nameTextField.text
								  xCoordinate:[self.xCoordTextField.text doubleValue]
								  yCoordinate:[self.yCoordTextField.text doubleValue]];
	[self saveToUserDefaults:robot];
	Robot *robotFromUserDefaults = [self getFromUserDefaults];
	self.textView.text = [NSString stringWithFormat:@"%@\nX-coordinate: %f\nY-coordinate: %f",
						  robotFromUserDefaults.name,
						  robotFromUserDefaults.xCoordinate,
						  robotFromUserDefaults.yCoordinate];
}

#pragma mark - Save to file
- (void)saveToFile:(Robot *) robot {
	NSURL *url = [self.fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
	NSURL *folderURL = [url URLByAppendingPathComponent:@"Robots"];
	NSURL *fileURL = [folderURL URLByAppendingPathComponent:robot.name];
	NSData *robotData = [NSKeyedArchiver archivedDataWithRootObject:robot
											  requiringSecureCoding:YES
															  error:nil];
	if ([self.fileManager createDirectoryAtURL:folderURL
				   withIntermediateDirectories:YES
									attributes:nil
										 error:nil]) {
		[self.fileManager createFileAtPath:fileURL.path contents:robotData attributes:nil];
	}
}

- (Robot *)getFromFile {
	NSURL *url = [self.fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
	NSURL *folderURL = [url URLByAppendingPathComponent:@"Robots"];
	NSURL *fileURL = [folderURL URLByAppendingPathComponent:self.nameTextField.text];
	NSData *robotData;
	if ([self.fileManager fileExistsAtPath:fileURL.path]) {
		robotData = [self.fileManager contentsAtPath:fileURL.path];
	}
	Robot *robot = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:
																 Robot.class,
																 NSString.class,
																 nil]
													   fromData:robotData error:nil];
	return robot;
}

- (void)saveToFileAndReadToTextView {
	Robot *robot = [[Robot alloc]initWithName:self.nameTextField.text
								  xCoordinate:[self.xCoordTextField.text doubleValue]
								  yCoordinate:[self.yCoordTextField.text doubleValue]];
	[self saveToFile:robot];
	Robot *robotFromFile = [self getFromFile];
	self.textView.text = [NSString stringWithFormat:@"%@\nX-coordinate: %f\nY-coordinate: %f",
						  robotFromFile.name,
						  robotFromFile.xCoordinate,
						  robotFromFile.yCoordinate];
}

@end
