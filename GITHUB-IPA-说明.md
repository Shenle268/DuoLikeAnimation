# GitHub Actions 自动生成 IPA

这个版本已经加入 `.github/workflows/build-ipa.yml`。

## 手机操作

1. 在 GitHub 新建一个空的 repository。
2. 把 `DuoLikeAnimation-main` 文件夹里的**全部内容**上传到仓库根目录。
3. 打开仓库的 **Actions**。
4. 点击 **Build iPad IPA**。
5. 点击 **Run workflow**。
6. 构建完成后进入该次运行页面，在 **Artifacts** 下载 `DuoLikeAnimation-iPad-IPA`。
7. 解压 Artifact，得到 `DuoLikeAnimation-iPad.ipa`。
8. 将 IPA 传到 iPad，用 TrollStore 安装。

## 注意

- Workflow 使用 GitHub 的 macOS Runner 和 Xcode 编译，不需要用户拥有 Mac。
- IPA 使用 ad-hoc 签名，不使用 Apple Developer 证书。
- 项目目标设备为 iPhone + iPad；本项目 UI 已针对 iPad 做了布局适配。
- Deployment Target 已从 26.5 调整为 26.0，以减少对特定 SDK 小版本的依赖。
- 如果 GitHub 当时没有可用的 `macos-26` Runner，需要把 workflow 中 `runs-on: macos-26` 改成 GitHub 当前提供的 macOS Runner，并确保其中安装了 Xcode 26.x。
