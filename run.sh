docker run --rm -v "$(pwd):/project" satran004/aion-fastvm:0.3.2.1 solc --abi --bin

docker run -i -t -v "$(pwd):/project" -v "/Users/satya/.m2:/root/.m2" -v "$MAVEN_HOME:/root/maven_home" satran004/aion-fastvm:0.3.2.1


alias gradlew='docker run --rm -v "$(pwd):/project" -v "/Users/satya/.m2:/root/.m2" -v "/Users/satya/.gradle:/root/.gradle" satran004/aion-fastvm:0.3.2-test ./gradlew'

alias solc='docker run --rm -v "$(pwd):/project" -v "/Users/satya/.m2:/root/.m2" satran004/aion-fastvm:0.3.2-test solc'

alias java='docker run --rm -v "$(pwd):/project" -v "/Users/satya/.m2:/root/.m2" satran004/aion-fastvm:0.3.2-test java'

alias javac='docker run --rm -v "$(pwd):/project" -v "/Users/satya/.m2:/root/.m2" satran004/aion-fastvm:0.3.2-test javac'


alias mvnw='docker run --rm -v "$(pwd):/project" -v "/Users/satya/.m2:/root/.m2" -v "$MAVEN_HOME:/root/maven_home" satran004/aion-fastvm:0.3.2-test ./mvnw'

alias mvn='docker run --rm -v "$(pwd):/project" -v "/Users/satya/.m2:/root/.m2" -v "$MAVEN_HOME:/root/maven_home" satran004/aion-fastvm:0.3.2-test mvn'



#### Maven setup ####
mvn install:install-file -Dfile=/root/app/aion/jars/modAion.jar -DgroupId=aion -DartifactId=modAion -Dpackaging=jar -Dversion=0.3.2
mvn install:install-file -Dfile=/root/app/aion/jars/modAionBase.jar -DgroupId=aion -DartifactId=modAionBase -Dpackaging=jar -Dversion=0.3.2
mvn install:install-file -Dfile=/root/app/aion/jars/modCrypto.jar -DgroupId=aion -DartifactId=modCrypto -Dpackaging=jar -Dversion=0.3.2
mvn install:install-file -Dfile=/root/app/aion/jars/modMcf.jar -DgroupId=aion -DartifactId=modMcf -Dpackaging=jar -Dversion=0.3.2
mvn install:install-file -Dfile=/root/app/aion/jars/modVM.jar -DgroupId=aion -DartifactId=modVM -Dpackaging=jar -Dversion=0.3.2
mvn install:install-file -Dfile=/root/app/aion/jars/modPrecompiled.jar -DgroupId=aion -DartifactId=modPrecompiled -Dpackaging=jar -Dversion=0.3.2
mvn install:install-file -Dfile=/root/app/aion/jars/aion_fastvm.jar -DgroupId=aion -DartifactId=aion_fastvm -Dpackaging=jar -Dversion=0.3.2
mvn install:install-file -Dfile=/root/app/aion/jars/libJson.jar -DgroupId=aion -DartifactId=libJson -Dpackaging=jar -Dversion=0.3.2
mvn install:install-file -Dfile=/root/app/aion/jars/libnsc.jar -DgroupId=aion -DartifactId=libnsc -Dpackaging=jar -Dversion=0.3.2




