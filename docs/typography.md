# 排版规范

## 页面与版心

- 正文纸张为 `188mm × 264mm`。
- 左右页边距均为 `14mm`，上下页边距均为 `21mm`，版心在页面上居中。
- 正文版心保持为 `160mm × 222mm`；封面和封底不受正文页边距限制。
- 封面、目录和封底的“红旗”书法刊名统一取自 `assets/hongqi-logo-black.svg`；XeLaTeX 使用同目录下由它生成的矢量 PDF 适配文件。

## Kicker（专题式引题框）

- kicker 是主标题上方类似“专题”的带框短引题。
- kicker-font 可选 hei、song、fang 或 kai。
- kicker-size 控制字号，既可写 `28pt`，也兼容 `sihao`、`xiaosi` 等中文字号名。
- kicker-line-spacing 使用 `1`、`1.5` 等倍数行距；kicker-leading 仍可直接指定固定基线间距。两者同时出现时，以写在后面的参数为准。
- kicker-width、kicker-padding、kicker-rule 控制框宽、内边距和框线。
- kicker-align 可取 left、center 或 right；kicker-after 控制与主标题的距离。
- 独立口号页仍使用 HongqiSloganBox，不要与文章引题混用。
- 偶数页页脚左侧按“页码在前、累计总页码在后”排列，例如 ·6·（总820）。

## 文章正文

- `body-size` 控制正文中西文字号。既可写 `10.5pt`，也可写 `sihao`、`xiaosi`、`wuhao` 等中文字号名；默认相当于 `wuhao`（`10.5pt`）。
- `body-line-spacing` 使用类似 Word 的倍数行距，例如 `1`、`1.25` 或 `1.5`。
- `body-leading` 仍可直接指定固定基线间距，例如 `15.5pt`。它与 `body-line-spacing` 同时出现时，以写在后面的参数为准。
- `body-indent` 控制段落首行缩进，默认 `2em`，即两个当前字号的汉字宽度。
- 参数写在每篇文章的 `hongqiarticle` 环境中，只影响该篇文章。

```latex
\begin{hongqiarticle}{
  title = {文章标题},
  author = {作者},
  body-size = xiaosi,
  body-line-spacing = 1.5,
  body-indent = 2em
}
正文……
\end{hongqiarticle}
```

可用字号名依次为：`chuhao`、`xiaochu`、`yihao`、`xiaoyi`、`erhao`、`xiaoer`、`sanhao`、`xiaosan`、`sihao`、`xiaosi`、`wuhao`、`xiaowu`、`liuhao`、`xiaoliu`、`qihao`、`bahao`。

正文中的毛主席语录使用 `\yulu{语录文字}`。该命令继承所在正文的字号和行距，只将文字切换为项目黑体并加粗。

需要禁止跨行拆分的短语使用 `\keep{短语}`，例如 `\keep{毛主席}`。该命令不改变字体和字号，不宜包裹过长文字。
