<a href ="https://github.com/manateelazycat/effortless-indent/blob/master/README.zh-CN.md"><img src="https://img.shields.io/badge/README-%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87-555555.svg"/></a>

# effortless-indent
When we paste code and find that the indentation is incorrect, the traditional approach is to position the cursor at the beginning and end of the pasted code area, and insert spaces at the beginning of the line through rectangular operations to solve the problem.

The goal of the effortless-indent plugin is that after we have just executed the `yank` command, we only need to execute the `effortless-indent` command to quickly adjust the indentation to the right, without the need for additional selection operations, saving a lot of time.

## Installation

1. Download this repository using `git clone`, and replace the load-path path in the configuration below
2. Add the following code to your configuration file ~/.emacs:

```elisp
(add-to-list 'load-path "<path-to-effortless-indent>")

(require 'effortless-indent)
```

## Options

* `effortless-indent-formatting-indent-alist`: effortless-indent will automatically obtain the indentation value according to the current mode by default. If `effortless-indent-formatting-indent-alist` does not include your favorite language, you are welcome to submit a PR to improve it
