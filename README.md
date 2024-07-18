# MyMovieBloc

<p float="left">
  <img src="https://github.com/iqbalnova/MyMovieBloc/blob/main/lib/public/splash.png" alt="Detail Screen" width="250" />
  <img src="https://github.com/iqbalnova/MyMovieBloc/blob/main/lib/public/list.png" alt="List Screen" width="250" /> 
  <img src="https://github.com/iqbalnova/MyMovieBloc/blob/main/lib/public/detail.png" alt="Splash Screen" width="250" />
</p>

MyMovieBloc is a Flutter application that provides detailed information about movies, including cast details, using the Bloc pattern for state management. The project is configured to use GitHub Actions for building and releasing APKs.

## Design Inspiration

[Figma](<https://www.figma.com/design/hK6NKZ5OtXQSsbD3Fgs1Dj/Movie-Mobile-App-UI-Design-(Community)?node-id=0-1&t=L1iPa1wuXgzsf5Ba-0>)

## Features

- Movie details with cast information
- State management using Bloc
- Automated APK release with GitHub Actions

## Getting Started

### Downloading the APK

1. Go to the [Releases page](https://github.com/iqbalnova/MyMovieBloc/releases) of the repository.
2. Download the latest APK file suitable for your device's architecture.

## GitHub Actions for APK Release

This project uses GitHub Actions to automate the build and release process for the APKs. The workflow is triggered on push or merge to the \`main\` branch.

## Preventing GitHub Actions from Running

If you need to update the \`main\` branch without triggering the GitHub Actions workflow, you can add \`[skip ci]\` or \`[ci skip]\` to your commit message. For example:

```
git commit -m "Update README [skip ci]"
```

This will skip the workflow run for that particular commit.

## Workflow Configuration

The GitHub Actions workflow file is located at .github/workflows/main.yml

```
on:
  push:
    branches:
      - main
    paths-ignore:
      - "**.md"
    ignore:
      - "[skip ci]"
      - "[ci skip]"

name: Build My Apps

jobs:
  build:
    if: "!contains(github.event.head_commit.message, '[skip ci]') && !contains(github.event.head_commit.message, '[ci skip]')"
    name: Build and Release new apk
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Set up JDK 11
        uses: actions/setup-java@v2
        with:
          distribution: "zulu"
          java-version: "11"

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          channel: "stable"

      - name: Install dependencies
        run: flutter pub get

      - name: Build APK
        run: flutter build apk --release

      - name: Extract version from pubspec.yaml
        id: extract_version
        run: |
          VERSION=$(grep 'version:' pubspec.yaml | sed 's/version: //')
          echo "VERSION=$VERSION" >> $GITHUB_ENV

      - name: Push to Releases
        uses: ncipollo/release-action@v1
        with:
          artifacts: |
            build/app/outputs/flutter-apk/app-release.apk
          tag: ${{ env.VERSION }}
          token: ${{ secrets.TOKEN }}


```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (\`git checkout -b feature/your-feature\`).
3. Make your changes.
4. Commit your changes (\`git commit -m 'Add some feature'\`).
5. Push to the branch (\`git push origin feature/your-feature\`).
6. Open a pull request.

Feel free to explore and contribute to MyMovieBloc. Happy coding!
