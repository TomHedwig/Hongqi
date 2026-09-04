# Docker 编译

在 Windows VS Code 中打开整个项目根目录，保持 Docker Desktop 运行。
工作区配方调用 build-docker.ps1，挂载整个项目到 /data，并按当前根文档动态选择容器工作目录。
镜像沿用 texlive/texlive；修改镜像只需调整 .vscode/settings.json 的 -Image 参数。

保存任意一期的 main.tex 会编译该期，PDF 输出在同一期目录。
新增期号不需要修改脚本或 VS Code 配置。
metadata.tex、toc.tex 第一行写：% !TeX root = main.tex
articles 下的文章第一行写：% !TeX root = ../main.tex
复制期号时保留这些相对路径即可。不要给 main.tex 写指向别期的 root 标记。

手工验证（在项目根目录执行）：

    powershell.exe -NoProfile -ExecutionPolicy Bypass -File scripts/build-docker.ps1 -ProjectRoot . -Document issues/1976/10/main.tex

追加 -DryRun 只打印 Docker 参数，不启动编译。
无需 Makefile；脚本显式选择 XeLaTeX，不依赖 latexmkrc。
该脚本面向 Windows 主机及 Linux Docker 容器。
