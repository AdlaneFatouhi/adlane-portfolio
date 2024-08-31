class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? githubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.androidLink,
    required this.iosLink,
    required this.webLink,
    required this.githubLink,
  });
}

List<ProjectUtils> smaProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/sma_logo.jpg',
    title: 'SMA Inventory Management App',
    subtitle:
        'This app simplifies asset tracking for the Sonatrach Management Academy. Featuring bar/QR-code scan, real-time database integration, and custom database for efficient and accurate inventory management.',
    androidLink: 'https://play.google.com',
    iosLink: 'https://www.apple.com/app-store/',
    webLink: null,
    githubLink: 'https://github.com/titine6299',
  ),
];
List<ProjectUtils> footstationProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/footstation_logo.jpg',
    title: 'FootStation Stock Management App',
    subtitle:
        'This app is made for stock management operations at the Foot Station clothing store. Workers can easily access real-time information about product availability. It has a robust filtering and sorting system to quickly locate specific items.',
    androidLink: 'https://play.google.com',
    iosLink: 'https://www.apple.com/app-store/',
    webLink: null,
    githubLink: 'https://github.com/titine6299',
  ),
];
List<ProjectUtils> portfolioProjectUtils = [
  ProjectUtils(
    image: 'assets/adlane_coding_jpg.jpg',
    title: 'Adlane Portfolio Website',
    subtitle:
        'A stunning portfolio website. A visually captivating experience, crafted with a meticulously curated color palette and a sleek, responsive design. The eye-catching logo instantly sets the tone, making a lasting impression on visitors',
    androidLink: null,
    iosLink: null,
    webLink: 'https://adlane-portfolio.netlify.app/',
    githubLink: 'https://github.com/titine6299',
  ),
];
