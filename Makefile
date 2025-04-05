.PHONY: build

ENV ?= dev
API ?= v1
BUILD_DIR := build/web
OUT_DIR := $(BUILD_DIR)/$(ENV)/$(API)

run:
	@echo "🏃‍♀️ Running Flutter web in [$(ENV)] mode at api version [$(API)]..."
	flutter run --dart-define=ENV=$(ENV) --dart-define=API_V=$(API)

build:
	@echo "🔨 Building Flutter web in [$(ENV)] mode at api version [$(API)]..."
	flutter build web --dart-define=ENV=$(ENV) --dart-define=API_V=$(API)

	@echo "📦 Moving built files to $(OUT_DIR)..."
	@echo "出力先があれば削除して再生成"
	rm -rf $(OUT_DIR)
	mkdir -p $(OUT_DIR)
	cp -r $(BUILD_DIR)/* $(OUT_DIR)/

	@echo "✅ Build complete! Output at $(OUT_DIR)"
