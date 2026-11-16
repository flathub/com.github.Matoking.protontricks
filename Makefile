ALACRITTY_VERSION := v0.17.0
ALACRITTY_REPO := https://github.com/alacritty/alacritty.git

BUILDER_TOOLS_URL := https://github.com/flatpak/flatpak-builder-tools.git
BUILDER_TOOLS_COMMIT := 338ce9c6512d49d98ae9a508d219ffe19b5144e8

.PHONY: regenerate-sources

regenerate-sources:
	rm -rf /tmp/alacritty /tmp/flatpak-builder-tools
	git clone --depth 1 --branch $(ALACRITTY_VERSION) $(ALACRITTY_REPO) /tmp/alacritty
	git clone $(BUILDER_TOOLS_URL) /tmp/flatpak-builder-tools
	cd /tmp/flatpak-builder-tools && git checkout $(BUILDER_TOOLS_COMMIT)
	python3 /tmp/flatpak-builder-tools/cargo/flatpak-cargo-generator.py /tmp/alacritty/Cargo.lock -o cargo-sources.json
	rm -rf /tmp/alacritty /tmp/flatpak-builder-tools
