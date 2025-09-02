pub:
	flutter clean && flutter pub get

locale:
	flutter pub global run get_cli:get generate locales assets/locales

icons:
	dart run flutter_launcher_icons -f flutter_launcher_icons.yaml

builds:
	dart pub run build_runner build --delete-conflicting-outputs

watch:
	flutter packages pub run build_runner watch

splash:
	dart run flutter_native_splash:create

apk:
	flutter clean && flutter build apk --release

vRelease:
    git tag ${version} && git push origin ${version}

PHONY: pub locale icons builds watch splash apk