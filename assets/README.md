# Brand Assets

Source files for the Local SEO Skills visual identity. The main README pulls `cover.png`; GitHub Social Preview uses `og-image.png`. Everything else is available for documentation, social accounts, and embeds.

## Files

| File | Dimensions | Use |
|------|------------|-----|
| `logo-mark.svg` | vector | Master square mark (LSS monogram, middle `S` in brand green) |
| `logo-mark.png` / `@2x.png` | 512 / 1024 | App icons, GitHub avatar |
| `logo-mark-256.png` / `-128.png` | 256 / 128 | Smaller avatars, UI placements |
| `favicon-64.png` / `-32.png` | 64 / 32 | Site favicon |
| `app-icon-400.png` / `-256.png` | 400 / 256 | App icon (map pin + magnifier, matches the X profile image). ChatGPT / Codex plugin logo and composer icon |
| `wordmark.svg` | vector | Master `Local SEO Skills` wordmark lockup |
| `wordmark.png` / `@2x.png` | 1200x260 / 2400x520 | Banners, slides, email headers |
| `cover.svg` | vector | Master GitHub cover / README hero |
| `cover.png` / `@2x.png` | 1280x640 / 2560x1280 | README hero (referenced from root README) |
| `og-image.png` | 1200x630 | Social media unfurl (Twitter, LinkedIn, Slack, Discord) |

## Brand tokens

Matches the values on [localseoskills.com](https://localseoskills.com):

- Primary green: `#16A34A` (green-600)
- Accent green: `#22C55E` (green-500)
- Deep green: `#15803D` (green-700)
- Green tint backgrounds: `#F0FDF4` / `#DCFCE7` / `#BBF7D0`
- White: `#FFFFFF`
- Off-white: `#FAFBFC`
- Dark text: `#0F172A`
- Body text: `#334155`
- Display type: Plus Jakarta Sans, ExtraBold 800
- Mono (stat pills, code): JetBrains Mono, SemiBold 600
- Radius: 12 / 16 / 20 px

## Regenerating PNGs

SVGs are the source of truth. Raster outputs are generated with `rsvg-convert` (install via `brew install librsvg`):

```bash
# Logo mark
rsvg-convert -w 512  -h 512  logo-mark.svg -o logo-mark.png
rsvg-convert -w 1024 -h 1024 logo-mark.svg -o logo-mark@2x.png
rsvg-convert -w 256  -h 256  logo-mark.svg -o logo-mark-256.png
rsvg-convert -w 128  -h 128  logo-mark.svg -o logo-mark-128.png
rsvg-convert -w 64   -h 64   logo-mark.svg -o favicon-64.png
rsvg-convert -w 32   -h 32   logo-mark.svg -o favicon-32.png

# Wordmark
rsvg-convert -w 1200 -h 260 wordmark.svg -o wordmark.png
rsvg-convert -w 2400 -h 520 wordmark.svg -o wordmark@2x.png

# Cover + social
rsvg-convert -w 1280 -h 640  cover.svg -o cover.png
rsvg-convert -w 2560 -h 1280 cover.svg -o cover@2x.png
rsvg-convert -w 1200 -h 630  cover.svg -o og-image.png
```

## License

MIT, per the root [LICENSE](../LICENSE). Use in community content, partner sites, and third-party writeups is welcome.
