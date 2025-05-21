<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <h1>🤖 Robot Framework - Automação de Testes</h1>
  <p>Este projeto contém a automação de testes de interface utilizando o <strong>Robot Framework</strong> com <strong>SeleniumLibrary</strong>, estruturado para promover reutilização, legibilidade e integração contínua via <strong>GitHub Actions</strong>.</p>

<h2>🚀 Recursos Principais</h2>
  <ul>
    <li>🔧 Automação baseada em palavras-chave (keywords)</li>
    <li>🧱 Estrutura modular por casos, páginas e utilitários</li>
    <li>📸 Captura automática de screenshots</li>
    <li>🖥️ Suporte a browsers como Chrome e Chromium</li>
    <li>📊 Geração de relatórios de execução HTML</li>
  </ul>

<h2>🛠️ Tecnologias Utilizadas</h2>
  <ul>
    <li>🐍 Python 3.9+</li>
    <li>🤖 Robot Framework</li>
    <li>🌐 SeleniumLibrary</li>
    <li>🧪 WebDrivers (Chrome/Chromium)</li>
  </ul>

<h2>📋 Como Executar os Testes</h2>

<h3>🖥️ Execução Local</h3>
  <p><strong>1.</strong> Clone o repositório:</p>
  <pre><code>git clone &lt;repository-url&gt;
cd robot-tests</code></pre>

  <p><strong>2.</strong> Crie um ambiente virtual e ative-o:</p>
  <pre><code>python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows</code></pre>

  <p><strong>3.</strong> Instale as dependências:</p>
  <pre><code>pip install -r requirements.txt</code></pre>

  <p><strong>4.</strong> Execute os testes:</p>
  <pre><code>robot --outputdir results tests/</code></pre>

  <p><strong>5.</strong> Abra os relatórios:</p>
  <pre><code>results/report.html
results/log.html</code></pre>

<h3>⚙️ Parâmetros adicionais</h3>
  <ul>
    <li>📁 <code>--outputdir</code>: Define onde os relatórios serão salvos</li>
    <li>🧪 <code>--include</code> ou <code>--tag</code>: Executa testes específicos por tag</li>
    <li>🔍 <code>--variable</code>: Permite passar variáveis personalizadas (ex: browser)</li>
  </ul>

  <p>Também é possível executar manualmente:</p>
  <ol>
    <li>Acesse a aba <strong>Actions</strong> no repositório</li>
    <li>Escolha o workflow <code>Robot Framework Tests</code></li>
    <li>Clique em <strong>Run workflow</strong></li>
  </ol>

<h2>📦 Estrutura do Projeto</h2>
  <pre><code>├── pages/                
│   ├── contaPage.robot
│   └── encartePage.robot
│   ├── enderecoPage.robot
│   └── homePage.robot
│   └── produtoPage.robot
├── resources/                
│   ├── config.robot
│   └── keywords.robot
├── tests/                    
│   ├── AdicionarProdutoCarrinho.robot
│   └── CriarConta.robot
├── results/                  
├── requirements.txt          
└── README.md</code></pre>

<h2>📊 Relatórios e Evidências</h2>
  <ul>
    <li>📄 <code>report.html</code>: Visão geral da execução</li>
    <li>🔍 <code>log.html</code>: Detalhamento passo a passo</li>
    <li>📸 Screenshots automáticos de falhas (usando `Capture Page Screenshot`)</li>
  </ul>

<h2>🧪 Casos de Teste Implementados</h2>
  <ul>
    <li>🔐 Login com credenciais válidas e inválidas</li>
    <li>👥 Cadastro e exclusão de usuários</li>
    <li>📄 Atualização de informações pessoais (aba My Info)</li>
    <li>🧭 Navegação por menus e filtros</li>
  </ul>

<h2>📌 Considerações Finais</h2>
  <ul>
    <li>✅ Testes modulares e reutilizáveis</li>
    <li>🧹 Estrutura clara com separação por responsabilidades</li>
  </ul>

</body>
</html>
