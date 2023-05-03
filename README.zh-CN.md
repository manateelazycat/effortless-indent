[English] (./README.md) | 简体中文

# effortless-indent
当我们在粘贴代码后， 发现缩进不对， 传统的做法是， 光标定位到粘贴代码的开始和结束区域， 通过矩形操作在行首插入空格来解决。

effortless-indent 这个插件的目标是， 当我们刚执行完 `yank` 命令后， 只需要执行 `effortless-indent` 命令即可快速向右调整缩进， 不需要额外的选中操作， 节省大量的时间。

## 安装

1. 用 `git clone` 下载此仓库， 并替换下面配置中的 load-path 路径
2. 把下面代码加入到你的配置文件 ~/.emacs 中：

```elisp
(add-to-list 'load-path "<path-to-effortless-indent>")

(require 'effortless-indent)
```

## 选项

* `effortless-indent-formatting-indent-alist`: effortless-indent 默认会根据当前 mode 自动获取缩进值， 如果 `effortless-indent-formatting-indent-alist` 中没有包含你喜欢的语言， 欢迎提交 PR 改进它
