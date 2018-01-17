#! /bin/bash

# 安装 oh-my-zsh
echo '==== 安装 oh-my-zsh ===='
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# 安装 nvm
echo '==== 安装 nvm ===='
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

# 使 nvm 脚本生效
source ~/.zshrc

# 安装 rvm
echo '==== 安装 rvm ===='
\curl -sSL https://get.rvm.io | bash -s stable

# 使 rvm 脚本生效
source ~/.rvm/scripts/rvm

# 安装 brew
echo '==== 安装 brew ===='
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# 替换 homebrew-core
echo '==== 替换 homebrew-core ===='
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git

# 回到家目录
cd ~

# 替换 Homebrew Bottles
echo '==== 替换 Homebrew Bottles ===='
echo '' >> ~/.zshrc
echo '# 替换 Homebrew Bottles' >> ~/.zshrc
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc

# 修改 RVM 的 Ruby 安装源到 Ruby China 的 Ruby 镜像服务器
echo '' >> ~/.rvm/user/db
echo 'ruby_url=https://cache.ruby-china.org/pub/ruby' >> ~/.rvm/user/db

# 修改 RubyGems 镜像地址(https://gems.ruby-china.org/)
gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/

# 显示替换之后的 gem sources
gem sources -l

# 使用修改的 .zshrc 生效
source ~/.zshrc

# 创建工作目录
echo '==== 创建工作目录 ===='
mkdir -p ~/workspace/github ~/workspace/oschina ~/workspace/gitlab

# 以下部分应该手动安装，不推荐自动安装

# # 安装 ruby
# rvm install 2.4.2 --disable-binary # 忽略二进制。

# # 设置默认 ruby
# rvm use 2.4.2 --default

# # 安装 git-up 工具
# echo '==== git-up ===='
# gem install git-up

# # 安装 yarn(通过homebrew来安装)
# echo '==== 安装 yarn ===='
# brew install yarn --without-node

# # 安装 commitizen 工具
# echo '==== commitizen ===='
# yarn global add commitizen

# # 安装 cz-conventional-changelog 工具
# echo '==== cz-conventional-changelog ===='
# yarn global add cz-conventional-changelog

echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc