# tmux Status Bar Snippets

```
php_version_bin="#[fg=$COLOR_ACTIVE]PHP v#(/usr/bin/php --version | grep -m1 PHP | sed -e 's/ (cli).*//g' | sed 's/PHP //') (bin)"
```

```
php_version_local_bin="#[fg=$COLOR_ACTIVE]PHP v#(/usr/local/bin/php --version | grep -m1 PHP | sed -e 's/ (cli).*//g' | sed 's/PHP //') (local/bin)"
```

```
# java_version="#[fg=$COLOR_ACTIVE]#(/usr/bin/java --version | grep -m1 'Runtime') $separator_forward"
```

```
node_version="#[fg=$COLOR_ACTIVE]Node #(node --version) (#[fg=$COLOR_ACTIVE]npm v#(npm --version))"
```

```
xcode_select_version="#[fg=$COLOR_ACTIVE]#(/usr/bin/xcode-select --version | sed -e 's/version /v/g' | sed s'/.$//') (#[fg=$COLOR_ACTIVE]pod v#(pod --version))"
```

```
laravel_version="#[fg=$COLOR_ACTIVE]#(php /var/www/vulcan/vulcan/artisan --version | sed -e 's/Framework //g') (#[fg=$COLOR_ACTIVE]#(/usr/local/bin/valet --version | sed -e 's/Laravel //g'))"
```

```
$timestamp="#[fg=$COLOR_BLUE]%A | %d %H%M R %m %Y"
```
