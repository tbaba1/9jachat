#!/bin/bash

# 9jaChat Deployment Script
echo "🚀 9jaChat Deployment Script"
echo "=============================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed. Please install Flutter first."
    exit 1
fi

print_status "Flutter found: $(flutter --version | head -n 1)"

# Get dependencies
print_status "Getting Flutter dependencies..."
flutter pub get

if [ $? -eq 0 ]; then
    print_status "Dependencies installed successfully"
else
    print_error "Failed to get dependencies"
    exit 1
fi

# Run analysis
print_status "Running Flutter analysis..."
flutter analyze --no-fatal-infos

# Ask user what to build
echo ""
echo "What would you like to build?"
echo "1) Android APK (Debug)"
echo "2) Android APK (Release)"
echo "3) Android App Bundle (Release)"
echo "4) iOS (Release)"
echo "5) Web (Release)"
echo "6) All platforms"
echo "7) Just run the app"

read -p "Enter your choice (1-7): " choice

case $choice in
    1)
        print_status "Building Android APK (Debug)..."
        flutter build apk --debug
        print_status "APK built: build/app/outputs/flutter-apk/app-debug.apk"
        ;;
    2)
        print_status "Building Android APK (Release)..."
        flutter build apk --release
        print_status "APK built: build/app/outputs/flutter-apk/app-release.apk"
        ;;
    3)
        print_status "Building Android App Bundle (Release)..."
        flutter build appbundle --release
        print_status "AAB built: build/app/outputs/bundle/release/app-release.aab"
        ;;
    4)
        print_status "Building iOS (Release)..."
        flutter build ios --release
        print_status "iOS build completed. Open ios/Runner.xcworkspace in Xcode to archive."
        ;;
    5)
        print_status "Building Web (Release)..."
        flutter build web --release
        print_status "Web build completed: build/web/"
        ;;
    6)
        print_status "Building all platforms..."
        flutter build apk --release
        flutter build appbundle --release
        flutter build web --release
        if [[ "$OSTYPE" == "darwin"* ]]; then
            flutter build ios --release
        fi
        print_status "All builds completed!"
        ;;
    7)
        print_status "Running the app..."
        flutter run
        ;;
    *)
        print_error "Invalid choice"
        exit 1
        ;;
esac

echo ""
print_status "🎉 Deployment script completed!"
print_warning "Next steps:"
echo "  1. Set up Firebase project and configuration"
echo "  2. Update app signing for release builds"
echo "  3. Test on real devices"
echo "  4. Submit to app stores"
echo ""
echo "�� For detailed setup instructions, see SETUP_GUIDE.md"
