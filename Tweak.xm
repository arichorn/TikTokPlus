%hook TikTokLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Disable LIVE video feature
    [self disableLive];

}

- (void)disableLive {
}

%end
