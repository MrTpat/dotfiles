#!/bin/bash
dir=${PWD##*/}
java \
-Declipse.application=org.eclipse.jdt.ls.core.id1 \
-Dosgi.bundles.defaultStartLevel=4 \
-Declipse.product=org.eclipse.jdt.ls.core.product \
-Dlog.level=ALL \
-noverify \
-Xmx1G \
-jar /home/tilak/Downloads/jdt/plugins/org.eclipse.equinox.launcher_1.6.300.v20210813-1054.jar \
-configuration /home/tilak/Downloads/jdt/config_linux \
-data /home/tilak/Downloads/jdt/data/$dir \
--add-modules=ALL-SYSTEM \
--add-opens java.base/java.util=ALL-UNNAMED \
--add-opens java.base/java.lang=ALL-UNNAMED
