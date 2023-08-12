lint:
	flutter analyze

format:
	dart format .

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: lint format gen
