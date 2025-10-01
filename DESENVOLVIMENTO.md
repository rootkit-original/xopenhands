# 🛠️ xCloudAi - Guia de Desenvolvimento

## 🚀 Configuração Rápida

### Configurar Gemini (Modelo de IA)
Por padrão, xCloudAi está configurado para usar o Gemini 2.5 Flash. Para começar:

1. **Obtenha sua chave de API do Google AI Studio**: https://aistudio.google.com/app/apikey
2. **Configure a chave de API**:
   - Na interface web: Configure nas Configurações (Settings)
   - No CLI/Headless: Edite o arquivo `config.template.toml` e adicione sua chave:
     ```toml
     [llm]
     api_key = "sua-chave-aqui"
     model = "gemini/gemini-2.5-flash"
     ```

### Executar xCloudAi
```bash
# Executar com Docker (Recomendado)
bash /workspaces/OpenHands/dev-setup.sh docker

# Ou usando o CLI (abre o navegador automaticamente)
openhands serve

# Parar todos os serviços
bash /workspaces/OpenHands/dev-setup.sh stop
```

> **Nota**: Ao usar `openhands serve`, o navegador será aberto automaticamente após 5 segundos para acessar http://localhost:3000

## 📁 Estrutura do Projeto

### Frontend
- **Localização**: `/workspaces/OpenHands/frontend/`
- **Tecnologia**: React + TypeScript + Vite
- **Arquivos principais**:
  - `src/` - Código fonte da interface
  - `src/components/` - Componentes React
  - `src/routes/` - Rotas da aplicação
  - `package.json` - Dependências e scripts

### Backend
- **Localização**: `/workspaces/OpenHands/openhands/`
- **Tecnologia**: Python + FastAPI
- **Arquivos principais**:
  - `server/` - Servidor FastAPI
  - `core/` - Lógica principal
  - `agenthub/` - Diferentes tipos de agentes
  - `llm/` - Integrações com modelos de linguagem

## 🔧 Desenvolvimento

### 1. Modificar Frontend
```bash
cd /workspaces/OpenHands/frontend
# Edite os arquivos em src/
# Exemplo: src/components/, src/routes/, etc.
```

**Problemas de Permissão**: Devido às limitações do dev container, o hot-reload do frontend pode não funcionar perfeitamente. Para desenvolvimento, recomendamos:

1. **Editar diretamente** os arquivos em `frontend/src/`
2. **Recriar o container** para ver mudanças:
   ```bash
   bash /workspaces/OpenHands/dev-setup.sh stop
   bash /workspaces/OpenHands/dev-setup.sh docker
   ```

### 2. Modificar Backend
```bash
cd /workspaces/OpenHands
# Edite os arquivos em openhands/
# Exemplo: openhands/server/, openhands/core/, etc.
```

Para testar mudanças no backend:
```bash
# Teste imports e sintaxe
python -c "import openhands; print('✅ Backend OK')"

# Execute testes específicos (se necessário)
python -m pytest tests/unit/ -v
```

### 3. Executar Backend Local (Desenvolvimento)
Se quiser executar apenas o backend para desenvolvimento:
```bash
cd /workspaces/OpenHands
python -m openhands.server.listen --host 127.0.0.1 --port 3000
```

## 🐳 Usando Docker para Desenvolvimento

O Docker é a forma mais estável de executar o OpenHands no dev container atual:

### Vantagens:
- ✅ Ambiente consistente
- ✅ Todas as funcionalidades disponíveis
- ✅ Não há problemas de permissão
- ✅ Hot-reload funciona parcialmente

### Comandos Úteis:
```bash
# Iniciar
bash /workspaces/OpenHands/dev-setup.sh docker

# Parar
bash /workspaces/OpenHands/dev-setup.sh stop

# Ver logs
docker logs openhands-app -f

# Acessar container
docker exec -it openhands-app /bin/bash
```

## 📝 Fluxo de Desenvolvimento Recomendado

1. **Faça mudanças** no código (frontend ou backend)
2. **Teste localmente** quando possível:
   ```bash
   # Backend
   python -c "import openhands"

   # Frontend (verificar sintaxe)
   cd frontend && npm run typecheck
   ```
3. **Rebuilde o container** para testar:
   ```bash
   bash /workspaces/OpenHands/dev-setup.sh stop
   bash /workspaces/OpenHands/dev-setup.sh docker
   ```
4. **Acesse** http://localhost:4001 para testar

## 🔍 Debugging

### Logs do Backend
```bash
docker logs openhands-app -f
```

### Verificar Status
```bash
docker ps
curl http://localhost:3000/api/options/config
```

### Problemas Comuns

1. **Permissões**: Use `sudo` quando necessário
2. **Porta ocupada**: Use `bash dev-setup.sh stop` primeiro
3. **Container não inicia**: Verifique se o Docker está rodando

## 🌐 Acessos

### Usando dev-setup.sh (Docker local):
- **Interface Web**: http://localhost:4001
- **API Backend**: http://localhost:4001/api/
- **Documentação API**: http://localhost:4001/docs (quando backend local)

### Usando openhands serve:
- **Interface Web**: http://localhost:3000 (abre automaticamente)
- **API Backend**: http://localhost:3000/api/

## 📚 Recursos Adicionais

- **Documentação Oficial**: [docs.all-hands.dev](https://docs.all-hands.dev)
- **Código no GitHub**: [github.com/All-Hands-AI/OpenHands](https://github.com/All-Hands-AI/OpenHands)
- **Issues e Bugs**: [GitHub Issues](https://github.com/All-Hands-AI/OpenHands/issues)

---

## 🎯 Quick Start para Desenvolvedores

```bash
# 1. Executar OpenHands
bash /workspaces/OpenHands/dev-setup.sh docker

# 2. Acessar no navegador
# http://localhost:4001

# 3. Fazer mudanças no código
# Editar: frontend/src/ ou openhands/

# 4. Rebuildar quando necessário
bash /workspaces/OpenHands/dev-setup.sh stop
bash /workspaces/OpenHands/dev-setup.sh docker
```

**Happy Coding! 🚀**
