# ifeq ($(OS),Windows_NT)
#     BUILD_CMD=.\build_and_run_app.bat
#     METRICS_CMD=.\tools\dart_code_metrics.bat
#     COMMIT_CHECK_CMD=.\tools\check_commit_message.bat
# else
#     BUILD_CMD=./build_and_run_app.sh
#     METRICS_CMD=./tools/dart_code_metrics.sh
#     COMMIT_CHECK_CMD=./tools/check_commit_message.sh
# endif


clean:
	flutter clean && flutter pub get && dart run build_runner build --delete-conflicting-outputs

get:
	flutter clean && flutter pub get

apk:
	flutter build apk "--dart-define=MODE=pro" --dart-define=DART_DEFINES_BASE_URL_HTTP="https://api.pharmago.asia/api" --dart-define=DART_DEFINES_URL_KAFA="https://api.kafa.pro"
	
rm:
	flutter clean && flutter pub get && rm -rf ios/Pods ios/Podfile.lock && cd ios && pod install

tree:
	flutter pub deps > dependencies.txt

open:
	open ios/Runner.xcworkspace