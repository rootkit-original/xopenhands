---
name: xcloudai-setup
version: 1.0.0
agent: CodeActAgent
triggers:
  - xcloudai
  - gemini-setup
  - setup-gemini
  - configurar-gemini
  - configure-llm
---

# xCloudAi Setup and Configuration

## Quick Start Guide

### 1. Get Your Gemini API Key
xCloudAi is pre-configured to use Google's Gemini 2.5 Flash model. To get started:

1. Visit [Google AI Studio](https://aistudio.google.com/app/apikey)
2. Sign in with your Google account
3. Create a new API key
4. Copy the key for the next step

### 2. Configure Your API Key

#### Using the Web Interface:
1. Run `openhands serve` (browser opens automatically after 5 seconds)
2. Click on Settings in the interface
3. Paste your API key in the LLM configuration section
4. The model is already set to `gemini/gemini-2.5-flash`

#### Using CLI/Headless Mode:
Edit `config.template.toml` and add your API key:

```toml
[llm]
api_key = "your-api-key-here"
model = "gemini/gemini-2.5-flash"
```

### 3. Start Developing

#### Option A: Using openhands serve (Recommended)
```bash
openhands serve
# Browser opens automatically at http://localhost:3000
```

#### Option B: Using Docker
```bash
bash /workspaces/OpenHands/dev-setup.sh docker
# Access at http://localhost:4001
```

## Features

### Automatic Browser Opening
When you run `openhands serve`, the browser automatically opens after 5 seconds at http://localhost:3000. This provides a seamless startup experience.

### Pre-configured Gemini Model
The default configuration includes:
- Model: `gemini/gemini-2.5-flash` (fast and cost-effective)
- Safety settings can be customized in config.template.toml
- Supports both Portuguese and English interfaces

## Port Information

Different startup methods use different ports:
- **openhands serve**: http://localhost:3000
- **dev-setup.sh docker**: http://localhost:4001

Both methods provide the same functionality, just different port mappings.

## Troubleshooting

### Browser doesn't open automatically
- Check if Docker is running: `docker ps`
- Manually open http://localhost:3000 in your browser
- The server may take a few seconds to start

### API Key Issues
- Verify your API key is valid at Google AI Studio
- Check that the key is properly set in Settings or config file
- Ensure you have API quota available

### Port Already in Use
```bash
# Stop existing containers
bash /workspaces/OpenHands/dev-setup.sh stop

# Or for openhands serve:
docker stop openhands-app
```

## Additional Resources

- [Official Documentation](https://docs.all-hands.dev)
- [Google AI Studio](https://aistudio.google.com/app/apikey)
- [GitHub Repository](https://github.com/rootkit-original/xopenhands)
