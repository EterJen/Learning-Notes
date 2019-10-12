        docker run -dti \
        --net=host \
        --name=nexus \
        --privileged=true \
        --restart=always \
        -e INSTALL4J_ADD_VM_PARAMS="-Xms4g -Xmx4g -XX:MaxDirectMemorySize=8g" \ # 如果不需要限制java内存请删除此行
        -v /etc/localtime:/etc/localtime \
        -v /data/nexus:/nexus-data \
        sonatype/nexus3:latest
        
