# Changelog

All notable changes to the Wowza Caption Handlers plugin will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.2] - 2025-09-01

### Fixed
- **Caption Timing**: Fixed incorrect end times when captions are split due to maximum line length constraints. Previously, when a caption chunk exceeded the maximum length and was split, the end time would incorrectly use the original Whisper response end time instead of the actual end time of the last word included in the chunk. This caused timing mismatches between WebVTT output and actual Whisper transcription.

### Technical Details
- Introduced `currentEnd` variable to properly track timing for each word added to a caption chunk
- Caption chunks now receive accurate end times based on the last word actually included in the chunk
- Improved timing synchronization between Whisper server output and WebVTT caption delivery

## [1.1.1] - 2025-08-31

### Fixed
- **Connection Resilience**: Improved Whisper server reconnection handling to prevent permanent connection loss
- **Retry Logic**: Fixed retry counter that was preventing reconnection attempts after initial failure
- **Error Handling**: Enhanced error handling in the main processing loop for better fault tolerance

### Added
- **Enhanced Debugging**: Added comprehensive debug logging for language mapping and caption processing
- **Connection Monitoring**: Improved socket state checking and connection monitoring

### Changed
- **Language Processing**: Improved variable naming and logging for language mapping debugging
- **Logging**: Enhanced log messages with more detailed connection status and language processing information

## [1.1.0] - Original Release

### Features
- Azure Speech-to-Text integration for live caption generation
- OpenAI Whisper integration for live caption generation
- CEA608/708 and WebVTT subtitle format support
- Configurable caption line length and count limits
- Real-time audio processing and transcription
- Multi-language caption support
- Delayed stream caption handling
