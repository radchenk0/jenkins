FROM jenkins/jenkins:lts

# Disabling the setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Setting the configuration-as-code-plugin env variable
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs/jenkins.yaml

# Preinstalling Jenkins plugins
COPY --chown=jenkins:jenkins ./config/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Forwarding Jenkins config
COPY --chown=jenkins:jenkins ./config/jenkins.yaml /var/jenkins_home/casc_configs/

EXPOSE 8080
EXPOSE 50000
