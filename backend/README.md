# backend (Flask 最小示例)

这个目录包含一个最小可运行的 Flask 后端示例，目的是让别人拿到仓库后可以在 Windows PowerShell 上快速运行。

主要文件：
- `app.py` — 单文件 Flask 应用（示例 endpoints: `/`、`/items/<item_id>`）
- `requirements.txt` — 记录 Python 依赖
- `start.ps1` —（可选）在 PowerShell 中创建并安装虚拟环境的脚本
- `run.ps1` —（可选）激活 venv 并运行应用的脚本

快速上手（Windows PowerShell）：

1. 在 `backend` 目录下创建虚拟环境并激活：

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

2. 升级 pip 并安装依赖：

```powershell
python -m pip install --upgrade pip
python -m pip install -r .\requirements.txt
```

3. 运行应用（开发模式）：

```powershell
python .\app.py
```

如果你只是想要一步自动化，可以运行 `start.ps1`（会尝试创建 venv 并安装依赖），然后运行 `run.ps1` 来启动应用。

如何“保存环境”（把环境状态交给别人）：
- 使用 `requirements.txt`（当前仓库已包含），在你本地准备好虚拟环境并安装好包后，运行 `pip freeze > requirements.txt` 来更新依赖清单，然后提交该文件。别人拿到代码后只需安装 `requirements.txt` 即可还原依赖。
- 更严格的方式是使用 `pip-tools`（生成 `requirements.txt` 的锁文件）或 `poetry` / `pipenv` 来管理和锁定依赖；本示例使用最简单、最通用的 `requirements.txt`。

注意事项：
- 不要把虚拟环境目录（例如 `.venv/`）加入 git。已经添加了 `.gitignore` 忽略虚拟环境。
- 内置开发服务器仅用于本地开发。生产请使用像 gunicorn + uvicorn workers / container / 云服务 的部署方式。

需要我现在在这个机器上为你运行一次 `start.ps1` 来验证安装和运行吗？（会在 `backend\.venv` 中创建虚拟环境并安装依赖）
