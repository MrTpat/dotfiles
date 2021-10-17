#!/bin/bash
SYSTEM=mac
dir=${PWD##*/}
java \
-Declipse.application=org.eclipse.jdt.ls.core.id1 \
-Dosgi.bundles.defaultStartLevel=4 \
-Declipse.product=org.eclipse.jdt.ls.core.product \
-Dlog.level=ALL \
-noverify \
-Xmx1G \
-jar $HOME/Downloads/jdt/plugins/org.eclipse.equinox.launcher_*.jar \
-configuration $HOME/Downloads/jdt/config_$SYSTEM \
-data $HOME/Downloads/jdt/data/$dir \
--add-modules=ALL-SYSTEM \
--add-opens java.base/java.util=ALL-UNNAMED \
--add-opens java.base/java.lang=ALL-UNNAMED
