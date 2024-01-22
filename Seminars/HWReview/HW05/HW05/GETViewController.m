//
//  GETViewController.m
//  HW05
//
//  Created by Andrey Zavershinskiy on 22.01.2024.
//

#import "GETViewController.h"
#import "POSTViewController.h"

@interface GETViewController ()

@property (strong, nonatomic, readonly) UITextView *textView;
@property (strong, nonatomic, readonly) UIButton *goToPostRequestButton;
@property (strong, nonatomic, readonly) Loader *loader;

- (void)setupUI;
- (void)addSubviews;
- (void)setupConstraints;
- (void)openPostRequestVC;
- (void)performLoadingForGetRequest;

@end

@implementation GETViewController

#pragma mark - UI
@synthesize textView = _textView;
- (UITextView *)textView {
	if (!_textView) {
		_textView = [UITextView new];
		_textView.backgroundColor = [UIColor systemMintColor];
		_textView.editable = false;
	}
	return _textView;
}

@synthesize goToPostRequestButton = _goToPostRequestButton;
- (UIButton *)goToPostRequestButton {
	if (!_goToPostRequestButton) {
		_goToPostRequestButton = [UIButton new];
		[_goToPostRequestButton setTitle:@"Open POST Request" forState:UIControlStateNormal];
		_goToPostRequestButton.configuration = [UIButtonConfiguration borderedProminentButtonConfiguration];
		[_goToPostRequestButton addTarget:self
								   action:@selector(openPostRequestVC)
						 forControlEvents:UIControlEventTouchUpInside];
	}
	return _goToPostRequestButton;
}

#pragma mark - Lifecycle
- (instancetype)initWithLoader: (Loader *) loader {
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

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self performLoadingForGetRequest];
}

#pragma mark - Setup UI
- (void)setupUI {
	self.view.backgroundColor = [UIColor systemBackgroundColor];
	[self setTitle:@"GET Request"];
	[self addSubviews];
	[self setupConstraints];
}

- (void)addSubviews {
	[self.view addSubview:self.textView];
	[self.view addSubview:self.goToPostRequestButton];
}

- (void)setupConstraints {
	self.textView.translatesAutoresizingMaskIntoConstraints = false;
	[self.textView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10].active = true;
	[self.textView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:5].active = true;
	[self.textView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-5].active = true;

	self.goToPostRequestButton.translatesAutoresizingMaskIntoConstraints = false;
	[self.goToPostRequestButton.topAnchor constraintEqualToAnchor:_textView.bottomAnchor constant:20].active = true;
	[self.goToPostRequestButton.leadingAnchor constraintEqualToAnchor:_textView.leadingAnchor].active = true;
	[self.goToPostRequestButton.trailingAnchor constraintEqualToAnchor:_textView.trailingAnchor].active = true;
	[self.goToPostRequestButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-15].active = true;
}

#pragma mark - Navigation
- (void)openPostRequestVC {
	UIViewController *postRequestVC = [[POSTViewController alloc] initWithLoader:self.loader];
	[self.navigationController pushViewController:postRequestVC animated:true];
}

#pragma mark - Networking
- (void)performLoadingForGetRequest {
	[self.loader performGetRequestFromURL:@"https://postman-echo.com/get"
								arguments:@{@"arg1": @"first", @"arg2": @"second"}
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
