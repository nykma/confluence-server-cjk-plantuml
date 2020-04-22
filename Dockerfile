FROM atlassian/confluence-server:6.15.9

ENV SARASA_VERSION 0.12.5

RUN apt update && \
        apt install -y graphviz p7zip && \
        rm -rf /var/lib/dpkg

RUN cd /tmp && \
        curl "https://github.com/be5invis/Sarasa-Gothic/releases/download/v${SARASA_VERSION}/sarasa-gothic-ttc-${SARASA_VERSION}.7z" -Lo sarasa.7z && \
        7zr x sarasa.7z && \
        mkdir -p /usr/share/fonts/truetype/sarasa && \
        mv *.ttc /usr/share/fonts/truetype/sarasa && \
        rm sarasa.7z && \
        fc-cache -fv && \
        cd -
