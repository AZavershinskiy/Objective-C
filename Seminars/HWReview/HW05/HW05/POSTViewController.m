//
//  POSTViewController.m
//  HW05
//
//  Created by Andrey Zavershinskiy on 17.01.2024.
//

#import "POSTViewController.h"

@interface POSTViewController ()

@property (strong, nonatomic, readonly) UITextField *firstTextField, *secondTextField;
@property (strong, nonatomic, readonly) UITextView *textView;
@property (strong, nonatomic, readonly) UIButton *sendRequestButton;
@property (strong, nonatomic, readonly) Loader *loader;

- (void)setupUI;
- (void)addSubviews;
- (void)setupConstraints;
- (void)performLoadingForPostRequest;

@end

@implementation POSTViewController

#pragma mark - UI
@synthesize firstTextField = _firstTextField;
- (UITextField *)firstTextField {
	if (!_firstTextField) {
		_firstTextField = [UITextField new];
		_firstTextField.backgroundColor = [UIColor systemGray6Color];
		_firstTextField.placeholder = @"Enter First Parameter";
	}
	return _firstTextField;
}

@synthesize secondTextField = _secondTextField;
- (UITextField *)secondTextField {
	if (!_secondTextField) {
		_secondTextField = [UITextField new];
		_secondTextField.backgroundColor = [UIColor systemGray6Color];
		_secondTextField.placeholder = @"Enter Second Parameter";
	}
	return _secondTextField;
}

@synthesize textView = _textView;
- (UITextView *)textView {
	if (!_textView) {
		_textView = [UITextView new];
		_textView.backgroundColor = [UIColor systemMintColor];
		_textView.editable = false;
	}
	return _textView;
}

@synthesize sendRequestButton = _sendRequestButton;
- (UIButton *)sendRequestButton {
	if (!_sendRequestButton) {
		_sendRequestButton = [UIButton new];
		[_sendRequestButton setTitle:@"Send POST Request" forState:UIControlStateNormal];
		_sendRequestButton.configuration = [UIButtonConfiguration borderedProminentButtonConfiguration];
		[_sendRequestButton addTarget:self
							   action:@selector(performLoadingForPostRequest)
					 forControlEvents:UIControlEventTouchUpInside];
	}
	return _sendRequestButton;
}

#pragma mark - Lifecycle
- (instancetype)initWithLoader:(Loader *)loader {
	self = [super init];
	if (self) {
		_loader = loader;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self setupUI];
}

#pragma mark - UI Setup
- (void)setupUI {
	self.view.backgroundColor = [UIColor systemBackgroundColor];
	[self setTitle:@"POST Request"];
	[self addSubviews];
	[self setupConstraints];
}

- (void)addSubviews {
	[self.view addSubview:self.firstTextField];
	[self.view addSubview:self.secondTextField];
	[self.view addSubview:self.textView];
	[self.view addSubview:self.sendRequestButton];
}

- (void)setupConstraints {
	self.firstTextField.translatesAutoresizingMaskIntoConstraints = false;
	[_firstTextField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10].active = true;
	[_firstTextField.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:5].active = true;
	[_firstTextField.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-5].active = true;

	self.secondTextField.translatesAutoresizingMaskIntoConstraints = false;
	[_secondTextField.topAnchor constraintEqualToAnchor:_firstTextField.bottomAnchor constant:5].active = true;
	[_secondTextField.leadingAnchor constraintEqualToAnchor:_firstTextField.leadingAnchor].active = true;
	[_secondTextField.trailingAnchor constraintEqualToAnchor:_firstTextField.trailingAnchor].active = true;

	self.textView.translatesAutoresizingMaskIntoConstraints = false;
	[_textView.topAnchor constraintEqualToAnchor:_secondTextField.bottomAnchor constant:10].active = true;
	[_textView.leadingAnchor constraintEqualToAnchor:_secondTextField.leadingAnchor].active = true;
	[_textView.trailingAnchor constraintEqualToAnchor:_secondTextField.trailingAnchor].active = true;

	self.sendRequestButton.translatesAutoresizingMaskIntoConstraints = false;
	[_sendRequestButton.topAnchor constraintEqualToAnchor:_textView.bottomAnchor constant:10].active = true;
	[_sendRequestButton.leadingAnchor constraintEqualToAnchor:_textView.leadingAnchor].active = true;
	[_sendRequestButton.trailingAnchor constraintEqualToAnchor:_textView.trailingAnchor].active = true;
	[_sendRequestButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-15].active = true;;
}

#pragma mark - Networking
- (void)performLoadingForPostRequest {
	[self.loader performGetRequestFromURL:@"https://postman-echo.com/get"
								arguments:@{@"arg1": self.firstTextField.text,
											@"arg2": self.secondTextField.text}
									block:^(NSDictionary *dict, NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			if (error) {
				self.textView.text = error.localizedDescription;
				return;
			}
			self.textView.text = [dict descriptionInStringsFileFormat];
		});
	}];
}

@end
