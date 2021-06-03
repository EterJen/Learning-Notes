mvn deploy:deploy-file -DgroupId=com.gwideal -DartifactId='gw_codegenerator' -Dversion='0.0.12-SNAPSHOT' -Dpackaging=jar -Dfile=/home/eter/workspace/.m2/repository/com/gwideal/gw_codegenerator/0.0.12-SNAPSHOT/gw_codegenerator-0.0.12-SNAPSHOT.jar -Durl=http://172.17.12.5:8081/repository/m2_host_3rdPart/ -DrepositoryId=eterNexus3

mvn deploy:deploy-file -DgroupId=org.oracle -DartifactId=jdbc -Dversion=8 -Dpackaging=jar -Dfile=/home/eter/.IntelliJIdea2019.2/config/jdbc-drivers/Oracle/12.2.0.1/ojdbc8.jar -Durl=http://172.17.12.5:8081/repository/m2_host_3rdPart/ -DrepositoryId=eterNexus3

