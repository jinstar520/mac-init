#! /bin/bash

# 安装 oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# 安装 rvm
\curl -sSL https://get.rvm.io | bash -s stable

# 使 rvm 脚本生效
source ~/.bashrc
source ~/.bash_profile
source ~/.rvm/scripts/rvm

# 修改 RVM 的 Ruby 安装源到 Ruby China 的 Ruby 镜像服务器
echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db

# 安装 ruby
rvm install 2.4.2 --disable-binary

# 设置默认 ruby
rvm use 2.4.2 --default

# 修改 RubyGems 镜像地址(https://gems.ruby-china.org/)
gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/

# 显示替换之后的 gem sources
gem sources -l

# 使用修改的 .zshrc 生效
source ~/.zshrc

# 安装 brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# 替换 homebrew-core
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git

# 替换 Homebrew Bottles
echo '# 替换 Homebrew Bottles' >> ~/.zshrc
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc


# 创建工作目录
mkdir -p ~/workspace/github ~/workspace/oschina ~/workspace/gitlab

# 创建 nvm 工作目录
mkdir -p ~/.nvm

# 安装 nvm(通过homebrew来安装, 也可通过下面的脚本进行安装)
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
brew install nvm

# 设置 nvm 目录及相关脚本
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.zshrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshrc

echo 'nvm 安装完成，先安装 node，然后在通过 brew 来安装 yarn'

# 安装 yarn(通过homebrew来安装)
# brew install yarn

# 安装 git-up 工具
# gem install git-up

# 安装 commitizen 工具
# yarn global add commitizen
# yarn global add cz-conventional-changelog
# echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc